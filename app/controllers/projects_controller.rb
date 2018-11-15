class ProjectsController < ApplicationController
  # renders new view
  def new   
	  @user = User.new
    @user.build_project
    puts "wwerwre----"
    puts @user.project.inspect
  end

  # insert data in db
  def create
    students_params = params[:user][:project_attributes][:students]
    @students = []
    if students_params
      students_params.each do |param|
        @students << Student.new(student_params(param))
      end
      params[:user][:project_attributes].delete(:students)
    end
	  @user = User.new(project_params)
    @students.each do |student|
      student.project = @user.project
      student.save
    end
    @user.project.event_date = EventDate.first
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
        project_attributes: [:id, :name, :field, :expertise_area_id, :client, 
        :abstract, :video_url, :status, :description, :category_id,
        professor_attributes: [:id, :name, :department, :course_code]])
    end
end
