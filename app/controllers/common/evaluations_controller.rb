class Common::EvaluationsController < Common::AdminCommitteeBaseController
    before_action :set_evaluation, only: [:destroy]

    def index
        @evaluations = Evaluation.all.order('assignment_id') 
    end

    def destroy
        @evaluation.destroy
        @assignment.destroy
        flash[:success] = "Evaluacion eliminada"
        redirect_to common_evaluations_path
    end

    private
        def set_evaluation
            @evaluation = Evaluation.find(params[:id])
            byebug
            @assignment = Assignment.find(@evaluation.assignment_id)
        end
end
