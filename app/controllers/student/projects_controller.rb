class Student::ProjectsController < Student::BaseController
  before_action :set_project, only: [:new, :show, :edit, :update]

  ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

  def show
  end

  def index
    @projects = Project.where(student_id: current_user.userable_id)
    @projects = @projects.sort_by { |project| project.name.downcase }
  end

  def new
    @url = student_projects_path
  end

  def create
    professor_email = project_params['email_professor']
    if professor_email.present?
      email_professor = professor_email
      professor = User.find_by(email: email_professor)
      if professor.nil?
        if email_professor.match(ITESM_MAIL)
          professor = create_professor(email_professor)
          project = create_project(professor)
          save_project(project)
        else
          flash.now[:danger] = 'Ingresar un correo de profesor del TEC'
          @url = student_projects_path
          set_project
          render 'new'
        end
      else
        project = create_project(professor)
        save_project(project)
      end
    else
      flash.now[:danger] = 'Ingresar el correo del profesor'
      @url = student_projects_path
      set_project
      render 'new'
    end
  end

  def edit
    @url = student_project_path
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = 'Información del proyecto actualizada'
      redirect_to action: 'index'
    else
      flash[:error] = 'Error'
      render 'edit'
    end
  end

  def create_project(professor)
    project = Project.new(project_params.except(:email_professor,
                                                :name_professor,
                                                :department_professor))
    project.student_id = current_user.userable_id
    project.professor_id = professor.userable_id
    project.edition_id = Edition.last.id
    project.status_id = Status.fifth.id
    project
  end

  def create_professor(email_professor)
    # Generates random password
    password = SecureRandom.base64(10)
    department_professor = project_params['department_professor']
    prof_instance = Professor.create(department_id: department_professor)
    professor = User.create(email: email_professor,
                            userable_type: 'Professor',
                            userable_id: prof_instance.id,
                            name: project_params['name_professor'],
                            password: password,
                            password_confirmation: password,
                            authorized: 1)
    professor
  end

  def save_project(project)
    if project.save
      UserMailer.with(user: current_user,
                      project: project).project_confirmation.deliver_now
      flash[:success] = '¡Proyecto creado exitosamente!'
      redirect_to action: 'index'
    else
      flash.now[:danger] = 'Error al crear el proyecto'
      @url = student_projects_path
      set_project
      render 'new'
    end
  end


  private

  def set_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

  def project_params
    params.require(:project).permit(:name,
                                    :field_id,
                                    :campus_id,
                                    :client_id,
                                    :semestrei,
                                    :video_url,
                                    :category_id,
                                    :description,
                                    :social_impact,
                                    :name_professor,
                                    :abstract_impact,
                                    :email_professor,
                                    :abstract_problem,
                                    :abstract_results,
                                    :expertise_area_id,
                                    :abstract_methodology,
                                    :abstract_feasibility,
                                    :department_professor,
                                    :social_impact_empathy,
                                    :social_impact_problem,
                                    :social_impact_responsibility)
  end
end
