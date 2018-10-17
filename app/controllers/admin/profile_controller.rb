class Admin::ProfileController < Admin::BaseController

	def show
		@admin = current_admin
	end

end
