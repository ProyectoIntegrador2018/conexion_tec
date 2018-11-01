class Admin::JudgesController <  Admin::BaseController
    before_action :set_judge, only: [:destroy]

    def index
        @judges = Judge.all
    end

    def destroy
        @judge.destroy
        flash[:success] = "Juez Eliminado"
        redirect_to admin_judges_path
    end
    
    private
        def set_judge
            @judge = Judge.find(params[:id])
        end
end
