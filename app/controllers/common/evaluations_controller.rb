class Common::EvaluationsController < Common::AdminCommitteeBaseController
    before_action :set_evaluation, only: [:destroy]

    def index
        @evaluations = Evaluation.all.order('assignment_id') 
    end

    def destroy
        EvaluationQuestion.where(evaluation_id: @evaluation.id).destroy_all # Destroy de questions
        result = @evaluation.result
        project = @evaluation.assignment.project
        @evaluation.destroy

        project.partial_score -= result

        if project.evaluations == 0
            project.evaluation_score = nil
        else
            project.evaluation_score = project.partial_score / project.evaluations
        end

        project.save

        flash[:success] = "Evaluacion eliminada"
        redirect_to common_evaluations_path
    end

    private
        def set_evaluation
            @evaluation = Evaluation.find(params[:id])
        end
end
