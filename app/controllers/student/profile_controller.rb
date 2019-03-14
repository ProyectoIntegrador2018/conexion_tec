class Student::ProfileController < Student::BaseController

  def index
    @user = User.find(current_user.id)
  end

  def edit
    @url = student_update_path
    @student = current_user.userable
  end

  def update
    @student = current_user.userable
    if @student.update_attributes(student_params)
      flash[:success] = "Información actualizada correctamente"
      redirect_to student_profile_path
    else
      @url = student_update_path
      flash.now[:danger] = "Error al actualizar la información"
      render 'edit'
    end
  end

  private

    def student_params
      params.require(:student).permit(:major_id)
    end
end
