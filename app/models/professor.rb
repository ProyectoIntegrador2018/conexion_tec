class Professor < ApplicationRecord
	has_many :projects
	belongs_to :department


	# enum department: [
	# 	"Matemáticas",
	# 	"Química",
	# 	"Derecho",
	# 	"Otro"
	# ]
end
