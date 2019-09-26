class Project < ApplicationRecord

	before_save :set_selection_score

	validates :name, presence: true
	validates :abstract, presence: true
	validates :description, presence: true
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
  has_one :project_grade
	belongs_to :stand, optional: true
	
	def set_selection_score
		if self.selection_score.present? && self.status_id == Status.first.id
			self.status_id = Status.second.id
		elsif !self.selection_score.present?
			self.status_id = Status.first.id
		end 
	end

	def evaluations
		evaluations = 0
		assignments = self.assignments # All the assignments
		assignments.each do |assignment|
			if !assignment.evaluation.nil?
				evaluations += 1
			end
		end
		evaluations
	end
end
