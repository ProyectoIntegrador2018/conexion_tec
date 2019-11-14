module Student::ProjectsHelper
  def can_register_project
    current_edition = Edition.last
    starting_date = current_edition[:project_registration_starting_date]
    ending_date = current_edition[:project_registration_ending_date]
    today = Date.today

    can_register = true
    can_register &= starting_date ? starting_date <= today : true
    can_register &= ending_date ? today <= ending_date : true
    can_register
  end

  def can_edit_project
    current_edition = Edition.last
    starting_date = current_edition[:project_edition_starting_date]
    ending_date = current_edition[:project_edition_ending_date]
    today = Date.today

    can_edit = true
    can_edit &= starting_date ? starting_date <= today : true
    can_edit &= ending_date ? today <= ending_date : true
    can_edit
  end
end
