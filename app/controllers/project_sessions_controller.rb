class ProjectSessionsController < ApplicationController

    def new   
    end
    
    def create
        # @project = User.new(params[:project])    # Not the final implementation!
		@user = login(params[:email], params[:password])
		if @user
			redirect_to project_profile_path     
			# Handle a successful save.
        else
			flash.now[:danger] = 'Contraseña y/o email incorrecto'
            render 'new'
        end
    end
end
