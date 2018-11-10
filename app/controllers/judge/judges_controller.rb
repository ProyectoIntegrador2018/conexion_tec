class Judge::JudgesController < Judge::BaseController
	before_action :set_judge, only: [:show, :edit, :update, :destroy]

	def show
		print("Show en judges_controller")
		@judge = Judge.find(params[:id])
	end

	def edit
	end

	def update
		if @user.update_attributes(judge_params)
			if @user.save
				print("User information updated")
				flash[:success] = "Información del juez actualizada"
				redirect_to judge_profile_path
			else
				render "edit"
			end
		end
	end

	private
		def set_judge
			@judge = Judge.find(params[:id])
			@user = @judge.user
		end

		def judge_params
			params.require(:user).permit(
				:id, :email, :password, :password_confirmation, :role, 
				judge_attributes: [:id, :name, :department, :has_tablet, expertise_area_ids: []])
		end
end