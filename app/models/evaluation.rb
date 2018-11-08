class Evaluation < ApplicationRecord
    belongs_to :judge
    belongs_to :project
	has_and_belongs_to_many :questions
end
