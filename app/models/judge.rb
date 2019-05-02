class Judge < ApplicationRecord
	validates :department_id, presence: true
	has_and_belongs_to_many :expertise_areas
	has_many :assignments
	has_many :projects, through: :assignments
	belongs_to :department
	has_one :user, as: :userable

	def name
		self.user.name
	end

	def self.available_judges
		judges = []
		users = User.where(userable_type: 'Judge') # Just judges
		users = users.where(authorized: 1) # Just authorized judges
		users.each do |user|
			if user.userable.attended # Judges present in the contest
				judges << user.userable
			end
		end
		judges
	end
end
