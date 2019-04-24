class AdministratorSessionController < ApplicationController
	include AuthHelper

	def new
        if current_user && current_user.admin?
            redirect_to admin_profile_path
        else
            @login_url = get_login_url(authorize_admin_url)
        end
    end

	def create
		token = get_token_from_code(params[:code], authorize_admin_url)
        raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

        mail = raw_information["mail"] || raw_information["userPrincipalName"]

        user = User.find_by(email: mail)
        byebug

        if user && user.admin?
            auto_login(user)
            redirect_to admin_profile_path
        else
        	flash.now[:danger] = 'Esta cuenta no es de administrador'
        	render 'new'
        end
	end

	def destroy
		logout
		redirect_to root_path
	end
end
