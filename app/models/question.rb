class Question < ApplicationRecord
	belongs_to :category
	# has_and_belongs_to_many :evaluations
	has_many :evaluation_questions
	has_many :evaluations, :through => :evaluation_questions
end
