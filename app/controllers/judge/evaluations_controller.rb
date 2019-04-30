class Judge::EvaluationsController < Judge::BaseController
	before_action :set_project, only: [:new, :create]

	def new
		@questions = Question.where(category: @project.category_id)
		@evaluation = Evaluation.new
		@url = judge_evaluations_path(id: params[:id])
		@assignment = current_user.userable.assignments.where(project_id: @project.id).first # Assignment
	end

	def create
		scores = params["scores"] # The scores given by the judge
		questions = Question.where(category: @project.category_id) # Questions
		assignment = current_user.userable.assignments.where(project_id: @project.id).first # Assignment
		evaluation = Evaluation.create(result: 0, assignment_id: assignment.id) # Evaluation

		score = 0 # Final score of the evaluation

		questions.each do |question|
			score += scores[question.id.to_s].to_i # They key is the id of the question
			EvaluationQuestion.create(evaluation_id: evaluation.id, question_id: question.id, result: scores[question.id.to_s].to_i)
		end

		evaluation.result = score # The evaluation final score

		if evaluation.save
			@project.partial_score += score
			@project.evaluation_score = @project.partial_score / @project.evaluations
			@project.save
			flash[:success] = 'Proyecto evaluado con éxito'
			redirect_to judge_projects_path
		else
			flash[:danger] = 'Error al evaluar proyecto'
			render 'new'
		end
	end

	def set_project
		@project = Project.find(params[:id])
	end

end
