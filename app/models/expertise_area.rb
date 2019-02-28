class ExpertiseArea < ApplicationRecord
	has_and_belongs_to_many :judges
	has_many :projects

	validates :area, presence: true
end