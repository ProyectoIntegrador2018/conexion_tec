class JudgeSessionsController < ApplicationController
  include AuthHelper
  
  def new
    if current_user && current_user.judge?
      redirect_to judge_profile_path
    else
      @login_url = get_login_url(authorize_judge_url)
    end
  end

  # this method is in charge of redirecting to judge profile if info is valid
  def create
      token = get_token_from_code(params[:code], authorize_judge_url)
      raw_information = token.get('https://graph.microsoft.com/v1.0/me').parsed

      mail = raw_information["mail"] || raw_information["userPrincipalName"]
      full_name = raw_information["displayName"]

      #Check email for judge procedence
      # EMAIL REGEX ^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$
      
      if mail.match(/^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/) # Judge is from ITESM
        user = User.find_by(email: mail)

        if user
            auto_login(user)
            redirect_to judge_profile_path
        else
            # Create the user and login
            judge = Judge.create(has_tablet: 0,
                                department_id: 1) # Temporal data
            password = SecureRandom.base64(10) # Generates random password
            user = User.create(email: mail,
                                name: full_name,
                                userable_type: 'Judge',
                                userable_id: judge.id,
                                password: password,
                                password_confirmation: password)

            auto_login(user)
            redirect_to judge_edit_path
        end
      else #Judge is EXTERNAL
        user = User.find_by(email: mail)

        if user
            auto_login(user)
            redirect_to judge_profile_path
        else
            # Create the user and login
            judge = Judge.create(has_tablet: 0,
                                department_id: 1,
                                external: true) # Temporal data
            password = SecureRandom.base64(10) # Generates random password
            user = User.create(email: mail,
                                name: full_name,
                                userable_type: 'Judge',
                                userable_id: judge.id,
                                password: password,
                                password_confirmation: password)

            auto_login(user)
            redirect_to judge_edit_path
          end
      end
  end

  def destroy
    logout
    redirect_to login_judge_path
  end

end