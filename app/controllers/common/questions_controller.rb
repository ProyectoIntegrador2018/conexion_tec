class Common::QuestionsController < Common::AdminCommitteeBaseController
	before_action :set_question, only: [:edit, :destroy, :update]

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
		@url = common_questions_new_path
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to common_questions_path
		else
			flash[:danger] = "Error al crear pregunta"
			render :new
		end
	end

	def edit
		@url = common_question_path
	end

	def destroy
		@question.destroy
		flash[:success] = "Pregunta eliminada"
		redirect_to common_questions_path
	end

	def update
		if @question.update_attributes(question_params)
			flash[:success] = "Pregunta actualizada"
			redirect_to common_questions_path
		else
			flash[:danger] = "Error al editar pregunta"
			render "edit"
		end
	end

	private
		def set_question
			@question = Question.find(params[:id])
		end


		def question_params
			params.require(:question).permit(:title, :text, :category_id)
		end
	
end