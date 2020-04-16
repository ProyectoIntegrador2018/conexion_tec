class Major < ApplicationRecord
	has_many :students
	has_many :members
	has_many :collaborators

	validates :name, presence: true
end
