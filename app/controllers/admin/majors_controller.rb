class Admin::MajorsController < Admin::BaseController

	before_action :set_major, except: [:index, :create]

	def index
		@majors = Major.all
	end

	def edit
		@url = admin_major_path
	end

	def new
		@url = admin_majors_path
	end

	def update
		if @major.update_attributes(major_params)
			flash[:success] = "Carrera actualizado"
			redirect_to action: 'index'
		else
			@url = admin_major_path
			flash.now[:danger] = "Error al actualizar la carrera"
			render 'edit'
		end
	end

	def create
		@major = Major.new(major_params)
		if @major.save
			flash[:success] = "Carrera creada"
			redirect_to action: 'index'
		else
			@url = admin_majors_path 
			flash.now[:danger] = "Error al crear la carrera"
			render 'new'
		end
	end

	def set_major
		@major = params[:id].present? ? Major.find(params[:id]) : Major.new
	end

	def destroy
		@major.delete
		flash[:success] = "Carrera eliminada"
		redirect_to action: 'index'
	end
		

	private

		def major_params
			params.require(:major).permit(:name)
		end
end