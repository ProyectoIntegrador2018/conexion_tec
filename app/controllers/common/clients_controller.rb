class Common::ClientsController < Common::AdminCommitteeBaseController

	before_action :set_client, except: [:index, :create]

	def index
		@clients = Client.all
	end

	def edit
		@url = common_client_path
	end

	def new
		@url = common_clients_path
	end

	def update
		if @client.update_attributes(client_params)
			flash[:success] = "Tipo de cliente actualizado"
			redirect_to action: 'index'
		else
			@url = common_client_path
			flash.now[:danger] = "Error al actualizar el cliente"
			render 'edit'
		end
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			flash[:success] = "Tipo de cliente creado"
			redirect_to action: 'index'
		else
			@url = common_clients_path 
			flash.now[:danger] = "Error al crear el cliente"
			render 'new'
		end
	end

	def set_client
		@client = params[:id].present? ? Client.find(params[:id]) : Client.new
	end

	def destroy
		@client.delete
		flash[:success] = "Cliente eliminado"
		redirect_to action: 'index'
	end
		

	private

		def client_params
			params.require(:client).permit(:client)
		end
end