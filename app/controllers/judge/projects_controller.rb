class Judge::ProjectsController < Judge::BaseController
    before_action :get_projects, only: [:index]

    def index
    end

    private
        def get_projects
            judge=current_judge
            print("hola #{judge.id}")
            evaluations = Evaluation.where(judge_id:judge.id)
            @projects = []
            evaluations.each do |eval|
                @projects.push(eval.project)
            end
        end
end
