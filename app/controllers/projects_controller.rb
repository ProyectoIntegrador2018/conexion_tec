class ProjectsController < ApplicationController
  # renders new view
  def new   
	  @user = User.new
	  @user.build_project
  end

  # insert data in db
  def create
    students_params = params[:user][:project_attributes][:students]
    @students = []
    students_params.each do |param|
      @students << Student.new(student_params(param))
    end
    params[:user][:project_attributes].delete(:students)
	  @user = User.new(project_params)
    @students.each do |student|
      student.project = @user.project
      student.save
    end
    if @user.save
      flash[:success] = "Proyecto creado exitosamente!"
	  auto_login(@user)
	  redirect_to project_profile_path
    else
      render 'new'
    end
  end

  private
    def project_params
      params.require(:user).permit(
        :id, :email, :password, :password_confirmation, :role, 
        project_attributes: [:id, :name, :field, :professor_id, :kind_id, :client, :abstract, :video_url, :status, :description, :category_id])
    end

    def student_params(s_p)
      s_p.permit(:name, :major, :enrollment, :email)
    end
end
