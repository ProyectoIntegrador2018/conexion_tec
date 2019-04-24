class CommitteeSessionsController < ApplicationController
    include AuthHelper

    ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

    def new
        if current_user && current_user.committe?
            redirect_to committe_profile_path
        else
            @login_url = get_login_url(authorize_committe_url)
        end
    end

    # This method is in charge of redirecting to committe profile if info is valid
    def create
        token = get_token_from_code(params[:code], authorize_committe_url)
        raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

        mail = raw_information['mail'] || raw_information['userPrincipalName']
        full_name = raw_information['displayName']

        user = User.find_by(email: mail)
        if user # The user exists, login to the system
            url = committe_profile_path
        else # The user is not on the database
            url = committe_edit_path
            if mail.match(ITESM_MAIL) # Check if it is from the ITESM
                user = create_committe(mail,full_name)
            else #committe mail is not from ITESM 
               #TODO implement error message
            end
        end
        login_redirect(user, url)
    end

    # Login user and redirect page to another path
    def login_redirect(user, url)
        auto_login(user)
        redirect_to url
    end

    # Handle internal committe
    def create_committe(mail,full_name)
        # Create the user and login
        committe = Committee.create()
        password = generates_password
        user = User.create(email: mail,
                            name: full_name,
                            userable_type: 'Committee',
                            userable_id: committe.id,
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
        redirect_to login_committee_path
    end
end
