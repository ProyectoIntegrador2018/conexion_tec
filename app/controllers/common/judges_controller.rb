class Common::JudgesController <  Common::AdminCommitteeBaseController
  before_action :set_judge, only: [:destroy, :approve, :reject, :edit, :update]

  def index
    @judges = Judge.all
  end

  def destroy
    @user.destroy
    @judge.destroy
    flash[:success] = "Juez Eliminado"
    redirect_to common_judges_path
  end

  def approve
    @user.authorized = 1
		if @user.save
			flash[:success] = "Juez aprobado"
			redirect_to common_judges_path
		else
			flash[:error] = "Error al aprobar el juez"
			redirect_to common_judges_path
		end
	end

	def reject
		@user.authorized = 0
		if @user.save
			flash[:success] = "Juez rechazado"
			redirect_to common_judges_path
		else
			flash[:error] = "Error al rechazar el juez"
			redirect_to common_judges_path
		end
	end

  def edit
    @url = edit_common_judge_path
    @areas_ids = @judge.expertise_areas.map(&:id)
  end

  def update
    judge_id = @judge.id
    if @judge.update_attributes(judge_params.except(:expertise_areas))

      # Delete all records, to create new ones
      ExpertiseAreasJudge.where(judge_id: judge_id).delete_all

      # New expertise_areas add
      areas = judge_params[:expertise_areas]

      # Create the relation between judge and expertise_area
      create_relation(areas, judge_id)

      if @judge.save
        flash[:success] = 'Información del juez actualizada'
        redirect_to action: 'index'
      else
        render 'edit'
      end
    end

  end

  private
    def create_relation(areas, judge_id)
      areas.each do |area|
        ExpertiseAreasJudge.create(expertise_area_id: area, judge_id: judge_id)
      end
    end

    def set_judge
      @judge = Judge.find(params[:id])
      @user = @judge.user
    end

    def judge_params
      params.require(:judge).permit(:has_tablet,
				                            :department_id,
				                            :ex_nombreEmpresaExterna,
				                            :ex_contactName,
				                            :ex_contactEmail,
				                            expertise_areas: [])
    end
end
