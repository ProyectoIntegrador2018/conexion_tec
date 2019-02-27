class Student < ApplicationRecord
	has_many :projects
	belongs_to :major
end
