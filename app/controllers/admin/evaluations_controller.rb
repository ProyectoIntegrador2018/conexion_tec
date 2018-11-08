class Admin::EvaluationsController < Admin::BaseController
    before_action :set_evaluation, only: [:destroy]

    def index
        @evaluations = Evaluation.all.order('judge_id') 
    end

    def destroy
        project=@evaluation.project
        puts("Ver datos de proyecto")
        puts(project)
        sum=0
        count = Evaluation.where(project_id:project.id).count
        Evaluation.where(project_id:project.id).each do |evaluation|
            sum += evaluation.total
        end
        project.score = (sum-@evaluation.total)/((count-1)||1)
        project.score ||= 0
        project.save
        @evaluation.destroy
        flash[:success] = "Evaluacion Eliminada"
        redirect_to admin_evaluations_path
    end

    private
        def set_evaluation
            @evaluation = Evaluation.find(params[:id])
        end
end
