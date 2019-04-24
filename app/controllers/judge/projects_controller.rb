class Judge::ProjectsController < Judge::BaseController
    before_action :get_projects, only: [:index]

    def index
    end

    private
        def get_projects
            judge = current_user.userable
            assignment = Assignment.where(judge_id:judge.id)
            evaluations = Evaluation.where(assignment:assignment)
            @projects = []
            evaluations.each do |eval|
                @projects.push(eval.assignment.project)
            end
        end
end
