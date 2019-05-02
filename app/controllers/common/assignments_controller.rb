class Common::AssignmentsController < Common::BaseController

	def index
		if params[:judge_id].present?
			judge = Judge.find(params[:judge_id])
			@projects = available_projects(judge)
		end
		@judges = Judge.available_judges
	end

	# Set the avaiable projects for that judge
	def available_projects(judge)
		assignments = judge.assignments
		projects_assigned = assignments.map(&:project_id) # All the projects assigned to that judge
		areas = judge.expertise_areas.map(&:id)
		projects = Project.where.not(id: projects_assigned)
		projects = projects.where(status_id: 4) # Approved projects
						   .where(attended: 1) # Present projects in the contest
						   .where(expertise_area_id: areas) # Project related to the field
		projects
	end

	def create
		judge_id = assignment_params[:judge_id]
		assignment = Assignment.new(assignment_params)
		if assignment.save
			flash[:success] = 'Juez asignado correctamente'
			redirect_to action: 'index', judge_id: judge_id
		else
			flash[:danger] = 'Error al asignar juez'
			redirect_to action: 'index', judge_id: judge_id
		end
	end

	private

		def assignment_params
			params.permit(
				:judge_id,
				:project_id)
		end
end