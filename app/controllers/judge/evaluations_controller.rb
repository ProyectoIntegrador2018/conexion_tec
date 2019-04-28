class Judge::EvaluationsController < Judge::BaseController

	def new
		@project = Project.find(params[:id])
		@questions = Question.where(category: @project.category_id)
		@evaluation = Evaluation.new
		@url = judge_evaluations_path(id: params[:id])
	end

	def create
		scores = params["scores"]
		project = Project.find(params[:id])
		questions = Question.where(category: project.category_id)
		assignment = current_user.userable.assignments.where(project_id: project.id).first
		evaluation = Evaluation.create(result: 0, assignment_id: assignment.id) # Evaluation
		score = 0

		questions.each do |question|
			score += scores[question.id.to_s].to_i
			EvaluationQuestion.create(evaluation_id: evaluation.id, question_id: question.id, result: scores[question.id.to_s].to_i)
		end

		evaluation.result = score
		evaluation.save

		project.evaluation_score = score
		project.save

		flash[:success] = 'Evaluación creada'
		redirect_to judge_projects_path
	end

end
