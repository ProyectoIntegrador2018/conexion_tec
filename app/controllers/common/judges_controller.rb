class Common::JudgesController <  Common::AdminCommitteeBaseController
    before_action :set_judge, only: [:destroy, :approve, :reject, :edit, :update]

    def index
        @judges = Judge.all
    end

    def destroy
        @user.destroy
        @judge.destroy
        flash[:success] = "Juez Eliminado"
        redirect_to common_judges_path
    end

    def approve
        @user.authorized = 1
		if @user.save
			flash[:success] = "Juez aprobado"
			redirect_to common_judges_path
		else
			flash[:error] = "Error al aprobar el juez"
			redirect_to common_judges_path
		end
	end

	def reject
		@user.authorized = 0
		if @user.save
			flash[:success] = "Juez rechazado"
			redirect_to common_judges_path
		else
			flash[:error] = "Error al rechazar el juez"
			redirect_to common_judges_path
		end
	end

  def edit
    set_judge
    @url = edit_common_judge_path
    @areas_ids = @judge.expertise_areas.map(&:id)
  end

  def update
		#if @user.update_attributes(judge_params)
			if @user.save
				print("User information updated")
				flash[:success] = "Información del juez actualizada"
				redirect_to judge_judge_path(@user.judge.id)
			else
				render "edit"
			end
		#end
	end

    private
        def set_judge
            @judge = Judge.find(params[:id])
            @user = @judge.user
        end
end
