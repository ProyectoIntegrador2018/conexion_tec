class ExpertiseArea < ApplicationRecord
	has_and_belongs_to_many :judges
end