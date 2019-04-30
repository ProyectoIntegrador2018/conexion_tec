class ExpertiseAreasJudge < ApplicationRecord
	has_many :judges
	has_many :projects
end