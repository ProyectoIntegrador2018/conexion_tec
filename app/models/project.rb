class Project < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :field, presence: true
	validates :kind, presence: true
	validates :client, presence: true
	validates :abstract, presence: true
	validates :video_url, presence: true
	validates :status, presence: true
	has_many :students
	belongs_to :kind
	belongs_to :professor
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
end
