class Admin::ExpertiseAreasController < Admin::BaseController

	before_action :set_expertise_area, except: [:index, :create]

	def index
		@expertise_areas = ExpertiseArea.all
	end

	def edit
		@url = admin_expertise_area_path
	end

	def new
		@url = admin_expertise_areas_path
	end

	def update
		if @expertise_area.update_attributes(expertise_area_params)
			flash[:success] = "Área temática actualizada"
			redirect_to action: 'index'
		else
			@url = admin_expertise_area_path
			flash.now[:danger] = "Error al actualizar área de expertise"
			render 'edit'
		end
	end

	def create
		@expertise_area = ExpertiseArea.new(expertise_area_params)
		if @expertise_area.save
			flash[:success] = "Área temática creada"
			redirect_to action: 'index'
		else
			@url = admin_expertise_areas_path
			flash.now[:danger] = "Error al crear área de expertise"
			render 'new'
		end
	end

	def destroy
		@expertise_area.delete
		flash[:success] = "Área temática eliminada"
		redirect_to action: 'index'
	end

	def set_expertise_area
		@expertise_area = params[:id].present? ? ExpertiseArea.find(params[:id]) : ExpertiseArea.new
	end

	private

		def expertise_area_params
			params.require(:expertise_area).permit(:area)
		end
end