class Admin::FieldsController < Admin::BaseController

	before_action :set_field, except: [:index, :create]

	def index
		@fields = Field.all
	end

	def edit
		@url = admin_field_path
	end

	def new
		@url = admin_fields_path
	end

	def update
		if @field.update_attributes(field_params)
			flash[:success] = "Área temática actualizada"
			redirect_to action: 'index'
		else
			@url = admin_field_path
			flash.now[:danger] = "Error al actualizar área temática"
			render 'edit'
		end
	end

	def create
		@field = Field.new(field_params)
		if @field.save
			flash[:success] = "Área temática creada"
			redirect_to action: 'index'
		else
			@url = admin_fields_path
			flash.now[:danger] = "Error al crear área temática"
			render 'new'
		end
	end

	def destroy
		@field.delete
		flash[:success] = "Área temática eliminada"
		redirect_to action: 'index'
	end

	def set_field
		@field = params[:id].present? ? Field.find(params[:id]) : Field.new
	end

	private

		def field_params
			params.require(:field).permit(:name)
		end
end