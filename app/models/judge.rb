class Judge < ApplicationRecord
	validates :department_id, presence: true
	has_and_belongs_to_many :expertise_areas
	has_many :assignments
	has_many :projects, through: :assignments
	belongs_to :department
	has_one :user, as: :userable
end
