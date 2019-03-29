class Admin::JudgesController <  Admin::BaseController
    before_action :set_judge, only: [:destroy, :approve, :reject]

    def index
        @judges = Judge.all
    end

    def destroy
        @user.destroy
        @judge.destroy
        flash[:success] = "Juez Eliminado"
        redirect_to admin_judges_path
    end

    def approve
        @user.authorized = 1
		if @user.save
			flash[:success] = "Juez aprobado"
			redirect_to admin_judges_path
		else
			flash[:error] = "Error al aprobar el juez"
			redirect_to admin_judges_path
		end
	end

	def reject
		@user.authorized = 0
		if @user.save
			flash[:success] = "Juez rechazado"
			redirect_to admin_judges_path
		else
			flash[:error] = "Error al rechazar el juez"
			redirect_to admin_judges_path
		end
	end


    
    private
        def set_judge
            @judge = Judge.find(params[:id])
            @user = @judge.user
        end
end
