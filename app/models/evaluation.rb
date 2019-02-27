class Evaluation < ApplicationRecord
    belongs_to :assignment
	has_many :evaluation_questions
	has_many :questions, :through => :evaluation_questions
end