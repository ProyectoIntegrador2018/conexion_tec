class Judge::ProjectsController < Judge::BaseController
    before_action :get_assignments, only: [:index]

    def index
    end

    private
        def get_assignments
            judge = current_user.userable
            @assignments = judge.assignments
        end
end
