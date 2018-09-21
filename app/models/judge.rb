class Judge < ApplicationRecord
	belongs_to :user
	validates :user, presence: true
	validates :department, presence: true
	validates :name, presence: true


	enum department: [
		"Tecnologías de Información",
		"Historia",
		"Química"
	]
end
