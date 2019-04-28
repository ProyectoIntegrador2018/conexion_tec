class Committee::ProfileController < Committee::BaseController
   
    def index
        @user = User.find(current_user.id)
    end
end