class Admin::UsersController < Admin::BaseController
	before_action :set_user, except: [:index, :create]

	def index
		@users = User.where(userable_type: "Committee").or(User.where(userable_type: 'Operative'))
	end

	def new
		@url = admin_users_path
	end

	def edit
		@url = admin_user_path
	end

	def create
		userable_type = user_params["userable_type"]
		if userable_type == "Committee"
			createCommittee
		else
			createOperative
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
		@user.authorized = true
		@user.save
		flash[:success] = 'Usuario autorizado'
		redirect_to admin_users_path
	end


	def createCommittee
		committee = Committee.create()
		user = User.new(user_params)
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

	def createOperative
		operative = Operative.create()
		user = User.new(user_params)
		user.userable_id = operative.id
		
		if user.save
			flash[:success] = "Usuario creado"
			redirect_to admin_users_path
		else
			operative.delete
			@user = User.new(user_params)
			@url = admin_users_path
			flash.now[:danger] = "Error al crear el usuario"
			render 'new'
		end
	end

	def destroy
		if @user.userable_type == "Committee"
			committee = Committee.find(@user.userable_id)
			committee.delete
		else
			operative = Operative.find(@user.userable_id)
			operative.delete
		end
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