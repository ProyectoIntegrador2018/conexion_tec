class Evaluation < ApplicationRecord
	has_and_belongs_to_many :questions
	belongs_to :judge
	belongs_to :project
end

