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


	# enum client: [
	# 	"Departamento del Tec", 
	# 	"Desarrollo propio",
	# 	"Gobierno",
	# 	"Industria Privada",
	# 	"Organización Social",
	# 	"Profesor de la clase"
	# ]

	# enum field: [
	# 	"Biotecnología y alimentos",
	# 	"Energía",
	# 	"Nanotecnología",
	# 	"Ingeniería",
	# 	"Tecnologías de información",
	# 	"Comunicación y eletrónica",
	# 	"Sostenibilidad",
	# 	"Emprendimiento de base tecnológica",
	# 	"Otra"
	# ]

	# enum status: [
	# 	"No calificado",
	# 	"Calificado",
	# 	"No aprobado",
	# 	"Aprobado"
	# ]

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
