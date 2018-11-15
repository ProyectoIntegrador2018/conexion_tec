class Professor < ApplicationRecord
	belongs_to :project

	enum department: [
		"Matemáticas",
		"Química",
		"Derecho",
		"Otro"
	]
end
