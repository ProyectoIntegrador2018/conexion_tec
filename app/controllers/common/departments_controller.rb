class Common::DepartmentsController < Common::AdminCommitteeBaseController

	before_action :set_department, except: [:index, :create]

	def index
		@departments = Department.all
	end

	def edit
    @url = common_department_path
	end

  def new
    @url = common_departments_path
  end

	def update
		if @department.update_attributes(department_params)
			flash[:success] = "Departamento actualizado"
			redirect_to action: 'index'
		else
      @url = common_department_path
			flash.now[:danger] = "Error al actualizar departamento"
			render 'edit'
		end
	end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = "Departamento creado"
      redirect_to action: 'index'
    else
      @url = common_departments_path
      flash.now[:danger] = "Error al crear departamento"
      render 'new'
    end
  end

  def destroy
    @department.delete
    flash[:success] = "Departamento eliminado"
    redirect_to action: 'index'
  end

	def set_department
		@department = params[:id].present? ? Department.find(params[:id]) : Department.new
	end

	private

		def department_params
			params.require(:department).permit(:name)
		end
end
