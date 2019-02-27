class Question < ApplicationRecord
	belongs_to :category
	has_many :evaluation_questions
	has_many :evaluations, :through => :evaluation_questions
end
