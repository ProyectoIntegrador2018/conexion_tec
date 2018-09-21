class ProjectSessionsController < ApplicationController

    def new   
        @project = Project.new 
    end
    
    def create
        # @project = User.new(params[:project])    # Not the final implementation!
        user = login(params[:email], params[:password])
		if user && user.role = "project"
			redirect_to projects_url(id:user.id)            
			# Handle a successful save.
        else
			flash.now[:danger] = 'Invalid credentials'
            render 'new'
        end
    end

end
