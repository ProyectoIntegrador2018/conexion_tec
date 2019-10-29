class Common::ProjectsController < Common::AdminCommitteeBaseController
  include Common::ProjectsHelper

  before_action :set_project,
                only: [:new,
                       :show,
                       :edit,
                       :reject,
                       :update,
                       :destroy,
                       :approve]

  ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

  def show
  end

  def index
    params[:order_by] ||= 0
    params[:order_by] = params[:order_by].to_i
    @projects = if params[:order_by].zero?
                  sort_by_name(Project.all)
                else
                  sort_by_grade(projects_with_grade)
                    .concat(sort_by_name(projects_without_grade))
                end
  end

  def new
    @url = common_projects_path
  end

  def create
    password = SecureRandom.base64(10) # Generates random password
    student_name = project_params['student_name']
    student_email = project_params['student_id']
    professor_name = project_params['professor_name']
    professor_email = project_params['professor_id']

    if student_email.present? && professor_email.present?
      student = User.find_by(email: student_email)
      professor = User.find_by(email: professor_email)

      if professor.nil? # We need to create a professor
        if professor_email.match(ITESM_MAIL)
          professor = create_professor(password,
                                       professor_name,
                                       professor_email)
        end
      end

      if student.nil? # We need to create a student
        if student_email.match(ITESM_MAIL)
          student = create_student(password, student_name, student_email)
        end
      end

      if !professor.nil? && !student.nil?
        project = create_project(professor, student)

        if project.save
          flash[:success] = '¡Proyecto creado exitosamente!'
          redirect_to action: 'index'
        else
          flash[:danger] = 'Error al crear el proyecto'
          @url = common_projects_path
          set_project
          render 'new'
        end
      else
        flash[:danger] = 'Asegurese de utilizar correos del TEC.'
        @url = common_projects_path
        set_project
        render 'new'
      end
    else
      message = 'Complete los campos relacionados a estudiante y profesor.'
      flash[:danger] = message
      @url = common_projects_path
      set_project
      render 'new'
    end
  end

  def edit
    @url = common_project_path
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = 'Información del proyecto actualizada'
      redirect_to action: 'index'
    else
      flash.now[:danger] = 'Error'
      render 'edit'
    end
  end

  def destroy
    @project.delete
    flash[:success] = 'Proyecto eliminado'
    redirect_to common_projects_path
  end

  def approve
    @project.status_id = Status.fourth.id
    if @project.save
      flash[:success] = 'Proyecto aprobado'
      redirect_to common_projects_path
    else
      flash[:danger] = 'Error al aprobar proyecto'
      redirect_to common_projects_path
    end
  end

  def reject
    @project.status_id = Status.third.id
    if @project.save
      flash[:success] = 'Proyecto rechazado'
      redirect_to common_projects_path
    else
      flash[:danger] = 'Error al rechazar proyecto'
      redirect_to common_projects_path
    end
  end


  private

  def create_project(professor, student)
    project = Project.new(project_params.except(:student_name,
                                                :student_email,
                                                :professor_name,
                                                :professor_email))
    project.student_id = student.userable_id
    project.professor_id = professor.userable_id
    project.edition_id = Edition.last.id
    project.status_id = Status.fourth.id
    project
  end

  def create_professor(password, professor_name, professor_email)
    new_professor = Professor.create(department_id: Department.first.id)
    professor = User.create(name: professor_name,
                            email: professor_email,
                            password: password,
                            authorized: 1,
                            userable_id: new_professor.id,
                            userable_type: 'Professor',
                            password_confirmation: password)
    professor
  end

  def create_student(password, student_name, student_email)
    new_student = Student.create(major_id: Major.first.id)
    student = User.create(name: student_name,
                          email: student_email,
                          password: password,
                          authorized: 1,
                          userable_id: new_student.id,
                          userable_type: 'Student',
                          password_confirmation: password)
    student
  end

  def set_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

  def project_params
    params.require(:project).permit(:name,
                                    :field_id,
                                    :stand_id,
                                    :campus_id,
                                    :client_id,
                                    :semestrei,
                                    :video_url,
                                    :student_id,
                                    :category_id,
                                    :description,
                                    :student_name,
                                    :professor_id,
                                    :social_impact,
                                    :professor_name,
                                    :selection_score,
                                    :abstract_impact,
                                    :abstract_problem,
                                    :abstract_results,
                                    :expertise_area_id,
                                    :abstract_feasibility,
                                    :abstract_methodology,
                                    :social_impact_empathy,
                                    :social_impact_problem,
                                    :social_impact_responsibility)
  end
end
