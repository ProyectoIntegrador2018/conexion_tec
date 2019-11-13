module Student::ProjectsHelper
	def can_register_project
		current_edition = Edition.last
		starting_date = current_edition[:project_registration_starting_date]
		ending_date = current_edition[:project_registration_ending_date]
		today = Date.today
		if starting_date && ending_date
			can_register = starting_date <= today and today <= ending_date
		elsif starting_date
			can_register = starting_date <= today
		elsif ending_date
			can_register = today <= ending_date
		else
			can_register = true
		end
		can_register
	end
end
