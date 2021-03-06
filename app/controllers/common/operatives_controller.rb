class Common::OperativesController < Common::AdminCommitteeBaseController
	include AuthorizeHelper
	before_action :set_user, except: [:index, :create]

	def index
		@users = User.where(userable_type: 'Operative')
	end

	def new
		@url = common_operatives_path
	end

	def edit
		@url = common_operative_path
	end

	def create
		operative = Operative.create()
		password = SecureRandom.base64(10) # Generates random password
		user = User.new(user_params)
		user.password = password
		user.userable_type = "Operative"
		user.password_confirmation = password
		user.userable_id = operative.id
		
		if user.save
			flash[:success] = "Usuario creado"
			redirect_to common_operatives_path
		else
			operative.delete
			@user = User.new(user_params)
			@url = common_operatives_path
			flash.now[:danger] = "Error al crear el usuario"
			render 'new'
		end

	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = 'Datos del usuario actualizado'
			redirect_to common_operatives_path
		else
			flash[:danger] = 'Error al actualizar datos'
			@url = common_operatives_path
			render 'edit'
		end
	end

	def authorize
		if authorize_user(@user)
			flash[:success] = 'Usuario autorizado'
		else
			flash[:success] = 'Usuario desautorizado'
		end
		redirect_to common_operatives_path
	end

	def destroy
		operative = Operative.find(@user.userable_id)
		operative.delete
		@user.delete
		flash[:success] = "Usuario eliminado"
		redirect_to common_operatives_path
	end

	def set_user
		@user = params[:id].present? ? User.find(params[:id]) : User.new
	end

	private

		def user_params
			params.require(:user).permit(
				:name,
				:email,
				:userable_type)
		end
end