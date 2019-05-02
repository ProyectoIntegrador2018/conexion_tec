class Common::EvaluationsController < Common::AdminCommitteeBaseController
    before_action :set_evaluation, only: [:destroy]

    def index
        @evaluations = Evaluation.all.order('assignment_id') 
    end

    def destroy
        evaluation_questions = EvaluationQuestion.where(evaluation_id: @evaluation.id).destroy_all
        @evaluation.destroy
        flash[:success] = "Evaluacion eliminada"
        redirect_to common_evaluations_path
    end

    private
        def set_evaluation
            @evaluation = Evaluation.find(params[:id])
        end
end
