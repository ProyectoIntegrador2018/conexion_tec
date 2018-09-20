class ProjectSessionsController < ApplicationController

    def new   
        @project = Project.new 
    end
    
    def create
        # @project = User.new(params[:project])    # Not the final implementation!
        user = login(params[:project_session][:email], params[:project_session][:password])
		if user && user.role = "proyectos"
			flash.now[:danger] = 'Log in'
			render 'new'
            # Handle a successful save.
        else
			flash.now[:danger] = 'Invalid credentials'
            render 'new'
        end
    end

end
