class Admin::UsersController < Admin::BaseController
	before_action :set_user, except: [:index, :create]

	def index
		@users = User.where(userable_type: "Committee")
	end

	def new
		@url = admin_users_path
	end

	def edit
		@url = admin_user_path
	end

	def create
		committee = Committee.create()
		password = SecureRandom.base64(10) # Generates random password
		user = User.new(user_params)
		user.password = password
		user.userable_type = "Committee"
		user.password_confirmation = password
		user.userable_id = committee.id
		
		if user.save
			flash[:success] = "Usuario creado"
			redirect_to admin_users_path
		else
			committee.delete
			@user = User.new(user_params)
			@url = admin_users_path
			flash.now[:danger] = "Error al crear el usuario"
			render 'new'
		end

	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = 'Datos del usuario actualizado'
			redirect_to admin_users_path
		else
			flash[:danger] = 'Error al actualizar datos'
			@url = admin_user_path
			render 'edit'
		end
	end

	def authorize
		if @user.authorized
			@user.authorized = false
			@user.save
			flash[:success] = "Usuario desautorizado"
		else
			@user.authorized = true
			@user.save
			flash[:success] = "Usuario autorizado"
		end
		redirect_to admin_users_path
	end

	def destroy
		committee = Committee.find(@user.userable_id)
		committee.delete
		@user.delete
		flash[:success] = "Usuario eliminado"
		redirect_to admin_users_path
	end

	def set_user
		@user = params[:id].present? ? User.find(params[:id]) : User.new
	end

	private

		def user_params
			params.require(:user).permit(:name,
				:email,
				:userable_type)
		end
end