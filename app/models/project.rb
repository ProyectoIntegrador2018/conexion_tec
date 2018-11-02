class Project < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :field, presence: true
	validates :expertise_area, presence: true
	validates :client, presence: true
	validates :abstract, presence: true
	validates :video_url, presence: true, if: :video_url
	validates :status, presence: true
	has_many :students
	belongs_to :expertise_area
	belongs_to :professor
	belongs_to :category
	accepts_nested_attributes_for :user


	enum client: [
		"Departamento del Tec", 
		"Desarrollo propio",
		"Gobierno",
		"Industria Privada",
		"Organización Social",
		"Profesor de la clase"
	]

	enum field: [
		"Biotecnología y alimentos",
		"Energía",
		"Nanotecnología",
		"Ingeniería",
		"Tecnologías de información",
		"Comunicación y eletrónica",
		"Sostenibilidad",
		"Emprendimiento de base tecnológica",
		"Otra"
	]

	enum status: [
		"No calificado",
		"Calificado",
		"No aprobado",
		"Aprobado"
	]

	scope :recommendations, -> (exp_areas) {
		where(expertise_area_id: exp_areas)
		.where(status: 4)
		.order(:num_assignments)
		.order(:num_evaluations)
		.limit(5)
	}
end
