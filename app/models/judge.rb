class Judge < ApplicationRecord
	belongs_to :user
	validates :user, presence: true
	validates :department, presence: true
	validates :name, presence: true
	has_and_belongs_to_many :expertise_areas
	has_many :evaluations


	enum department: [
		"Tecnologías de Información",
		"Historia",
		"Química"
	]
end
