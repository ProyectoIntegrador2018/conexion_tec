class ProfessorSessionsController < ApplicationController
    include AuthHelper
    
    ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

    def new
        if current_user && current_user.professor?
            redirect_to professor_profile_path
        else
            @login_url = get_login_url(authorize_professor_url)
        end
    end

    def create
        token = get_token_from_code(params[:code], authorize_professor_url)
        raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

        mail = raw_information["mail"] || raw_information["userPrincipalName"]
        full_name = raw_information["displayName"]

        # if mail.match(ITESM_MAIL)
            user = User.find_by(email: mail)
            if user
                auto_login(user)
                redirect_to professor_profile_path
            else
                # Create the user and login
                professor = Professor.create(department_id: Department.first.id) # Temporal department
                password = SecureRandom.base64(10) # Generates random password
                user = User.create(email: mail,
                                    name: full_name,
                                    userable_type: 'Professor',
                                    userable_id: professor.id,
                                    password: password,
                                    password_confirmation: password)

                auto_login(user)
                redirect_to professor_edit_path
            end
        # else
        #     flash[:danger] = 'Correo invalido: favor de utilizar correo del ITESM.'
        #     redirect_to action: 'new'
        # end
    end

    def destroy
        logout
        redirect_to login_professor_path
    end
end