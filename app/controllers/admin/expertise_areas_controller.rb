class Admin::ExpertiseAreasController < Admin::BaseController

	before_action :set_expertise_area, only: [:edit, :update]

	def index
		@expertise_areas = ExpertiseArea.all
	end

	def edit
	end

	def update
		if @expertise_area.update_attributes(expertise_area_params)
			flash[:success] = "Área temática actualizada"
			redirect_to action: 'index'
		else
			flash.now[:danger] = "Error al actualizar área temática"
			render 'edit'
		end
	end

	def set_expertise_area
		@expertise_area = ExpertiseArea.find(params[:id])
	end

	private

		def expertise_area_params
			params.require(:expertise_area).permit(:area)
		end
end