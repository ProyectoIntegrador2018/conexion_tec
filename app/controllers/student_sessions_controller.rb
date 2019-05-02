class StudentSessionsController < ApplicationController
    include AuthHelper

    ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

    def new
        if current_user && current_user.student?
            redirect_to student_profile_path
        else
            @login_url = get_login_url(authorize_student_url)
        end
    end
    
    def create
        token = get_token_from_code(params[:code], authorize_student_url)
        raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

        mail = raw_information["mail"] || raw_information["userPrincipalName"]
        full_name = raw_information["displayName"]

        user = User.find_by(email: mail)

        if user
            auto_login(user)
            redirect_to student_profile_path
        else
            if mail.match(ITESM_MAIL) # Check if it is from the ITESM
                # Create the user and login
                student = Student.create(major_id: 1) # Temporal major
                password = SecureRandom.base64(10) # Generates random password
                user = User.create(email: mail,
                                    name: full_name,
                                    userable_type: 'Student',
                                    userable_id: student.id,
                                    password: password,
                                    password_confirmation: password)

                auto_login(user)
                redirect_to student_edit_path
            else
                flash[:danger] = 'El correo electrónico no es del TEC'
                redirect_to login_student_path
            end
        end
    end

    def destroy
        logout
        redirect_to login_student_path
    end
end
