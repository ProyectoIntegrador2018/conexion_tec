class Staff::AssignmentsController < Staff::BaseController

	def index
		@judges = Judge.all
	end

	def show
		@judge = Judge.find(params[:id])
		@recommended_projects = Project.recommendations(@judge.expertise_area_ids)
		@projects = Project.not_qualified.order_projects
		@projects = @projects - @recommended_projects
	end

	def create
		@evaluation = Evaluation.new
		puts "PARAMSSSSSSS"
		puts params.inspect
		# project_ids = params[:evaluation][:projects]
		# puts params.inspect
		# project_ids.each do |p|
		# 	e = Evaluation.new
		# 	e.judge = @judge
		# 	e.project_id = p
		# 	if !e.save
		# 		flash[:error] = "No se pudo agregar un proyecto a evaluar"
		# 	else
		# 		flash[:success] = "Proyecto a evaluar agregado!!!"
		# 	end
		# end
	end

	def update
	end

end
