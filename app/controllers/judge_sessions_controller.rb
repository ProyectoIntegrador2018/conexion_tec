class JudgeSessionsController < ApplicationController
    include AuthHelper

    ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

    def new
        if current_user && current_user.judge?
            redirect_to judge_profile_path
        else
            @login_url = get_login_url(authorize_judge_url)
        end
    end

    # This method is in charge of redirecting to judge profile if info is valid
    def create
        token = get_token_from_code(params[:code], authorize_judge_url)
        raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

        mail = raw_information['mail'] || raw_information['userPrincipalName']
        full_name = raw_information['displayName']

        user = User.find_by(email: mail)
        if user # The user exists, login to the system
            url = judge_profile_path
        else # The user is not on the database
            url = judge_edit_path
            if mail.match(ITESM_MAIL) # Check if it is from the ITESM
                user = internal_judge(mail,full_name)
            else #Judge is EXTERNAL
                user = external_judge(mail,full_name)
            end
        end
        login_redirect(user, url)
    end

    # Login user and redirect page to another path
    def login_redirect(user, url)
        auto_login(user)
        redirect_to url
    end

    # Handle internal judge
    def internal_judge(mail,full_name)
        # Create the user and login
        judge = Judge.create(has_tablet: 0, department_id: 1) # Temporal data
        password = generates_password
        user = User.create(email: mail,
                            name: full_name,
                            userable_type: 'Judge',
                            userable_id: judge.id,
                            password: password,
                            password_confirmation: password)

        user
    end

    # Handle external judge
    def external_judge(mail,full_name)
        # Create the user and login
        judge = Judge.create(has_tablet: 0, department_id: 1, external: true) # Temporal data
        password = generates_password
        user = User.create(email: mail,
                            name: full_name,
                            userable_type: 'Judge',
                            userable_id: judge.id,
                            password: password,
                            password_confirmation: password)
        user
    end

    # Generates random password
    def generates_password
        SecureRandom.base64(10)
    end

    def destroy
        logout
        redirect_to login_judge_path
    end
end
