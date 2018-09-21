class AdministratorSessionController < ApplicationController

	def new
	end

	def create
		user = login(params[:email], params[:password])
		puts "User: #{user}"
		if user && user.role == "admin"
			redirect_to projects_url(message: ApplicationHelper.encrypt(user.role))
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end
end
