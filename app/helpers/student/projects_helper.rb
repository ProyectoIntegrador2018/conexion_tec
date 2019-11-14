module Student::ProjectsHelper
  def can_register_project
    current_edition = Edition.last
    starting_date = current_edition[:project_registration_starting_date]
    ending_date = current_edition[:project_registration_ending_date]
    today = Date.today

    can_register = true
    if starting_date
      can_register &= starting_date <= today
    end
    if ending_date
      can_register &= today <= ending_date
    end
    can_register
  end
end
