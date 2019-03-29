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
		if user_params["userable_type"] == "Committee"
			committee = Committee.create()
			user = User.new(user_params)
			user.userable_id = committee.id
		else
			operative = Operative.create()
			user = User.new(user_params)
			user.userable_id = operative.id
		end

		if user.save
			flash[:success] = "Usuario creado"
			redirect_to admin_users_path
		else
			if committee
				committee.delete
			else
				operative.delete
			end
			@user = User.new(user_params)
			@url = admin_users_path
			flash.now[:danger] = "Error al crear el usuario"
			render 'new'
		end
	end

	def update
		@user.authorized = true
		@user.save
		flash[:success] = "Usuario autorizado"
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
				:password,
				:password_confirmation,
				:userable_type)
		end
end