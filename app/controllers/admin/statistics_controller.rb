class Admin::StatisticsController < Admin::BaseController

	def projects_category
		@projects = Project.joins(:category).order("categories.name ASC")
	end
end
