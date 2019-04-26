class Judge::ProjectsController < Judge::BaseController
    before_action :get_projects, only: [:index]

    def index
    end

    private
        def get_projects
            judge = current_user.userable
            assignments = judge.assignments
            @projects = []
            assignments.each do |assignment|
                @projects << assignment.project
            end
        end
end
