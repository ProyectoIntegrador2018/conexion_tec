class Operative::ProfileController < Operative::BaseController

  def index
    @user = User.find(current_user.id)
  end

end
