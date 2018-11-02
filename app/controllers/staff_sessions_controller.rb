class StaffSessionsController < ApplicationController

	def new
	end

	def create
		user = login(params[:email], params[:password])
		if user 
			if user.role == "staff"
				redirect_to staff_assignments_path
			else
				flash.now[:danger] = "Esta cuenta no es de staff"
				redirect_to root
			end
		else
			flash.now[:danger] = 'Usuario o contraseña incorrectos'
			render 'new'
		end
	end
end
