class StaffsController < ApplicationController
	def new   
	  @user = User.new
  end

  # insert data in db
  def create
	  @user = User.new(staff_params)
    if @user.save
      flash[:success] = "Cuenta de staff creada exitosamente!"
	  auto_login(@user)
	  redirect_to staff_judges_path
    else
      render 'new'
    end
  end

  private
    def staff_params
      params.require(:user).permit(
        :id, :email, :password, :password_confirmation, :role, :name
        )
    end
end
