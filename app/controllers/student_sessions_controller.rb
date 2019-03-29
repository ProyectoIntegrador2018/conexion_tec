class StudentSessionsController < ApplicationController
    include AuthHelper

    def new
        if current_user && current_user.student?
            redirect_to student_profile_path
        else
            @login_url = get_student_login_url
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
            # Create the user and login (delete password from model)
            student = Student.create(major_id: 1) # Temporal major
            user = User.create(email: mail,
                                name: full_name,
                                userable_type: 'Student',
                                userable_id: student.id)

            auto_login(user)
            redirect_to student_edit_path
        end
    end

    def destroy
        logout
        redirect_to login_student_path
    end
end
