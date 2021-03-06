class AdministratorSessionController < ApplicationController
	include AuthHelper

	def new
        if current_user && current_user.admin?
            redirect_to common_projects_path
        else
            @login_url = get_login_url(authorize_admin_url)
        end
    end

	def create
		token = get_token_from_code(params[:code], authorize_admin_url)
        raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

        mail = raw_information["mail"] || raw_information["userPrincipalName"]

        user = User.find_by(email: mail)

        if user && user.admin?
            auto_login(user)
            redirect_to common_projects_path
        else
        	flash[:danger] = 'Esta cuenta no es de administrador'
        	redirect_to action: 'new'
        end
	end

	def destroy
		logout
		redirect_to root_path
	end
end
