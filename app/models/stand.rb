class Stand < ApplicationRecord
	has_one :project
	validates :number, presence: true
end
