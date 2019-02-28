class Admin::EvaluationsController < Admin::BaseController
    before_action :set_evaluation, only: [:destroy]

    def index
        @evaluations = Evaluation.all.order('assignment_id') 
    end

    def destroy
        @evaluation.destroy
        flash[:success] = "Evaluacion Eliminada"
        redirect_to admin_evaluations_path
    end

    private
        def set_evaluation
            @evaluation = Evaluation.find(params[:id])
        end
end
