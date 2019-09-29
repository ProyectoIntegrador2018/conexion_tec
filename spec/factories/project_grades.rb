FactoryBot.define do
  factory :project_grade do
    video_grade { 1 }
    objective_grade { 1 }
    abstract_grade { 1 }
    project { nil }
  end
end
