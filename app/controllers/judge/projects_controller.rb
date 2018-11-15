class Judge::ProjectsController < Judge::BaseController
    before_action :get_projects, only: [:index]

    def index
        @projects = current_judge.projects.group(:project_id)
    end

    private
        def get_projects
            judge=current_judge
            evaluations = Evaluation.where(judge_id:judge.id)
            @projects = []
            evaluations.each do |eval|
                @projects.push(eval.project)
            end
        end
end
