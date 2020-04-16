FactoryBot.define do
  factory :collaborator do
    name { "MyString" }
    email { "MyString" }
    student_code { "MyString" }
    major { nil }
    project { nil }
  end
end
