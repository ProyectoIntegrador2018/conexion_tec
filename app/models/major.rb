class Major < ApplicationRecord
	has_many :students
	has_many :members
end