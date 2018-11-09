class Evaluation < ApplicationRecord
    belongs_to :judge
    belongs_to :project
	has_many :evaluation_questions
	has_many :questions, :through => :evaluation_questions
end

