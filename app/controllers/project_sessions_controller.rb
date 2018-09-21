class ProjectSessionsController < ApplicationController

    def new   
    end
    
    def create
        # @project = User.new(params[:project])    # Not the final implementation!
		@user = login(params[:email], params[:password])
		if @user
			redirect_to @user.project     
			# Handle a successful save.
        else
			flash.now[:danger] = 'Invalid credentials'
            render 'new'
        end
    end
end
