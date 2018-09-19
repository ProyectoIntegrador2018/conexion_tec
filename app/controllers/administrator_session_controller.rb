class AdministratorSessionController < ApplicationController

	def new
	end

	def create
		if login(params[:administrator_session][:email], params[:administrator_session][:password])
			flash.now[:danger] = 'Log in!!'
			render 'new'
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end
end
