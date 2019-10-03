class Project < ApplicationRecord
	before_save :set_selection_score

	validates :name, presence: true
	validates :field_id, presence: true
	validates :client_id, presence: true
	validates :description, presence: true
	validates :abstract_impact, presence: true
	validates :abstract_problem, presence: true
	validates :abstract_results, presence: true
	validates :expertise_area_id, presence: true
	validates :abstract_methodology, presence: true
	validates :abstract_feasibility, presence: true

	belongs_to :field
	belongs_to :client
	belongs_to :status
	belongs_to :student
	belongs_to :edition
	belongs_to :category
	belongs_to :professor
	belongs_to :expertise_area
	belongs_to :stand, optional: true

  has_many :members
	has_many :assignments

  has_one :project_grade

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
