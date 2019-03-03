class AdministratorSessionController < ApplicationController

	def new
	end

	def create
		user = login(params[:email], params[:password])
		if user 
			if user.admin?
				redirect_to admin_projects_path
			else
				logout
				flash.now[:danger] = "Esta cuenta no es de administrador"
				render 'new'
			end
		else
			flash.now[:danger] = 'Contraseña y/o email incorrecto'
			render 'new'	
		end
	end

	def destroy
		logout
		redirect_to root_path
	end
end
