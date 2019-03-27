class Professor::ProfileController < Professor::BaseController

  def index
    @user = User.find(current_user.id)
  end

  def edit
    @url = professor_update_path
    @professor = current_user.userable
  end

  def update
    @professor = current_user.userable
    if @professor.update_attributes(professor_params)
      flash[:success] = "Información actualizada correctamente"
      redirect_to professor_profile_path
    else
      @url = professor_update_path
      flash.now[:danger] = "Error al actualizar la información"
      render 'edit'
    end
  end

  private

    def professor_params
      params.require(:professor).permit(:department_id)
    end
end
