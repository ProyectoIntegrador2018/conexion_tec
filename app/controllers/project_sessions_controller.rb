class ProjectSessionsController < ApplicationController

    def new   
        @project = Project.new 
    end
    
    def create
        @project = User.new(params[:project])    # Not the final implementation!
        if @project.save
            # Handle a successful save.
        else
            render 'new'
        end
    end

end
