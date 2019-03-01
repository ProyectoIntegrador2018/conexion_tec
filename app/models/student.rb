class Student < ApplicationRecord
	has_many :projects
	belongs_to :major
	has_one :user, as: :userable
end
