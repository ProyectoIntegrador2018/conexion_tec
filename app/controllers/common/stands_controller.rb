class Common::StandsController < Common::AdminCommitteeBaseController
    before_action :set_stand, except: [:index, :create]

	def index
		@stands = Stand.all
	end

	def edit
		@url = common_stand_path
	end

	def new
		@url = common_stands_path
	end

	def update
		if @stand.update_attributes(stand_params)
			flash[:success] = "Stamd actualizado"
			redirect_to action: 'index'
		else
			@url = common_stand_path
			flash.now[:danger] = "Error al actualizar el stand"
			render 'edit'
		end
	end

	def create
		@stand = Stand.new(stand_params)
		if @stand.save
			flash[:success] = "Stand creado"
			redirect_to action: 'index'
		else
			@url = common_stands_path 
			flash.now[:danger] = "Error al crear el stand"
			render 'new'
		end
	end

	def set_stand
		@stand = params[:id].present? ? Stand.find(params[:id]) : Stand.new
	end

	def destroy
		@stand.delete
		flash[:success] = "Stand eliminado"
		redirect_to action: 'index'
	end
		

	private

		def stand_params
			params.require(:stand).permit(:number)
		end
end