class Project < ApplicationRecord
	# belongs_to :user
	before_save :set_selection_score

	validates :name, presence: true
	validates :abstract, presence: true
	validates :field_id, presence: true
	validates :expertise_area_id, presence: true
	validates :client_id, presence: true

	belongs_to :field
	belongs_to :client
	belongs_to :status
	belongs_to :category
	belongs_to :expertise_area
	belongs_to :professor
	belongs_to :student
	belongs_to :edition
	has_many :assignments
	has_many :members
	
	def set_selection_score
		if self.selection_score.present? && self.status_id != 4 && self.status_id != 3
			self.status_id = 2
		elsif !self.selection_score.present? && (self.status_id == 4 || self.status_id == 3)
			self.status_id = 1
		elsif self.status_id != 4 && self.status_id != 3
			self.status_id = 1
		end 
	end
	# scope :recommendations, -> (exp_areas) {
	# 	where(expertise_area_id: exp_areas)
	# 	.not_qualified
	# 	.order_projects
	# 	.limit(5)
	# }

	# scope :not_qualified, -> {
	# 	where(status: 0)
	# }

	# scope :qualified, -> {
	# 	where(status: 1)
	# }

	# scope :not_approved, -> {
	# 	where(status: 2)
	# }

	# scope :approved, -> {
	# 	where(status: 3)
	# }

	# scope :order_projects, -> {
	# 	order(:num_assignments, :num_evaluations)
	# }
end
