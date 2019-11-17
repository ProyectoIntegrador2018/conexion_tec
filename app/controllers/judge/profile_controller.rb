class Judge::ProfileController < Judge::BaseController

	def index
		@user = User.find(current_user.id)
	end

	def edit
		@url = judge_update_path
		@judge = current_user.userable
		@areas_ids = @judge.expertise_areas.map(&:id)
  end

  def update
  	@judge = current_user.userable
  	if @judge.update_attributes(judge_params.except(:expertise_areas))
  		ExpertiseAreasJudge.where(judge_id: @judge.id).delete_all # Delete all records, to create new ones

  		areas = judge_params[:expertise_areas] # New expertise_areas add
  		create_relation(areas, @judge.id) # Create the relation between judge and expertise_area

  		flash[:success] = "Información actualizada correctamente"
  		redirect_to judge_profile_path
  	else
  		@url = judge_update_path
  	  	flash.now[:danger] = "Error al actualizar la información"
  	  	render 'edit'
  	end
  end

	  def create_relation(areas, judge_id)
	  	areas.each do |area|
	  		ExpertiseAreasJudge.create(expertise_area_id: area, judge_id: judge_id)
	  	end
	  end

	  private

		def judge_params
		  params.require(:judge).permit(:has_tablet,
				:department_id,
				:ex_nombreEmpresaExterna,
				:ex_contactName,
				:ex_contactEmail,
				expertise_areas: [])
		end
end
