class Evaluation < ApplicationRecord
    belongs_to :judge
    belongs_to :project
	# has_and_belongs_to_many :questions
	has_many :evaluation_questions
	has_many :questions, :through => :evaluation_questions
end
