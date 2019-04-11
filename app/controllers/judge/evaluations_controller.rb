# class Judge::EvaluationsController < Judge::BaseController

# 	def show
# 		@project_id = params[:id]
# 		@project = Project.find(@project_id)
# 		@project_category = Project.find(@project_id).category
# 		@questions = Question.where(category:@project_category)
# 		@evaluation = Evaluation.new
# 	end

# 	def submit
# 		params.permit(:scores)
# 		@project = Project.find(params[:id])
# 		@evaluation = Evaluation.new
# 		evaluations_from_project = Evaluation.where(:project => @project)
# 		questions_from_project = EvaluationQuestion.where(:evaluation => evaluations_from_project)
# 		partial_total = 0
# 		count2 = 0
# 		questions_from_project.each do |question|
# 			count2 += 1
# 			partial_total += question.result
# 		end
# 		@evaluation.project = @project
# 		@evaluation.judge = current_judge
# 		scores_param = params[:scores]
# 		evaluation_score = 0
# 		if !scores_param
# 			@evaluation.total = 0
# 			partial_total /= evaluations_from_project.size + 1
# 			@project.score = partial_total
# 		else
# 			count = 0
# 			scores_param.each do |id, value|
# 				count += 1
# 				evaluation_score += value.to_f
# 				EvaluationQuestion.create(evaluation: @evaluation, question_id: id, result: value)
# 			end
# 			@project.score = (partial_total.to_f + evaluation_score) / (count2.to_f + count.to_f)
# 		end
# 		@evaluation.total = evaluation_score
# 		@evaluation.save
# 		@project.save
# 		flash[:success] = "Evaluación del proyecto realizada"
# 		redirect_to judge_projects_path
# 	end

# end
