class Judge::ProfileController < Judge::BaseController

	def show
		@judge = current_judge
	end

end
