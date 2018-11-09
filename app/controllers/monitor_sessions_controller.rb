class MonitorSessionsController < ApplicationController

	def new
	end

	def create
		user = login(params[:email], params[:password])
		if user 
			if user.role == "monitor"
				redirect_to monitor_projects_path
			else
				flash.now[:danger] = "Esta cuenta no es de monitor"
				redirect_to root
			end
		else
			flash.now[:danger] = 'Usuario o contraseña incorrectos'
			render 'new'
		end
	end
end
