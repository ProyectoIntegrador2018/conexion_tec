class Admin::DepartmentsController < Admin::BaseController

	before_action :set_department, only: [:edit, :update]

	def index
		@departments = Department.all
	end

	def edit
	end

	def update
		if @department.update_attributes(department_params)
			flash[:success] = "Departamento actualizado"
			redirect_to action: 'index'
		else
			flash.now[:danger] = "Error al actualizar departamento"
			render 'edit'
		end
	end

	def set_department
		@department = Department.find(params[:id])
	end

	private

		def department_params
			params.require(:department).permit(:name)
		end
end
