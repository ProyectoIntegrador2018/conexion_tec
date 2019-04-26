class Common::AssignmentsController < Common::BaseController

	def index
		@projects = Project.all
	end

	def create
		assignment = Assignment.new(assignment_params)
		if assignment.save
			flash[:success] = 'Juez asignado correctamente'
			redirect_to action: 'index'
		else
			flash[:danger] = 'Error al asignar juez'
			redirect_to action: 'index'
		end
	end

	private

		def assignment_params
			params.require(:assignment).permit(
				:judge_id,
				:project_id)
		end
end