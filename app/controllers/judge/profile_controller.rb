class Judge::ProfileController < Judge::BaseController

	def index
		@user = User.find(current_user.id)
	end

	def edit
		@url = judge_update_path
		@judge = current_user.userable
	  end
	
	  def update
		@judge = current_user.userable
		if @judge.update_attributes(judge_params)
		  flash[:success] = "Información actualizada correctamente"
		  redirect_to judge_profile_path
		else
		  @url = judge_update_path
		  flash.now[:danger] = "Error al actualizar la información"
		  render 'edit'
		end
	  end
	
	  private
	
		def judge_params
		  params.require(:judge).permit(:has_tablet,
				:department_id,
				:ex_nombreEmpresaExterna,
				:ex_contactName,
				:ex_contactEmail)
		end
end
