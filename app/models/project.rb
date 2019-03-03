class Project < ApplicationRecord
	# belongs_to :user
	validates :name, presence: true
	validates :abstract, presence: true
	validates :video_url, presence: true, if: :video_url
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
