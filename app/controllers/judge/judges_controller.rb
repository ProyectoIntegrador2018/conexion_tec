class Judge::JudgesController < Judge::BaseController
	before_action :set_judge, only: [:show, :edit, :update, :destroy]

	def show
		@judge = Judge.find(params[:id])
	end

	def edit
	end

	def update
		if @user.update_attributes(judge_params)
			if @user.save
				print("User information updated")
				flash[:success] = "Información del juez actualizada"
				redirect_to judge_judge_path(@user.judge.id)
			else
				render "edit"
			end
		end
	end

	private
		def set_judge
			@user = User.find(current_user.id)
			@judge = current_user.userable
		end

		def judge_params
			params.require(:judge).permit(:has_tablet,
				:department_id,
				:ex_nombreEmpresaExterna,
				:ex_contactName,
				:ex_contactEmail)
		end
end
