class Admin::StatisticsController < Admin::BaseController

	def projects_category
		@projects = Project.joins(:category).order("categories.name ASC")
	end

	def judges_expertise_areas
		@judges = Judge.joins(:expertise_areas).group(:judge_id).order("expertise_areas.area")
	end
end
