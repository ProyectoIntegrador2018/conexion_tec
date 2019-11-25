module Professor::ProjectsHelper
  def not_approved(project)
    project.current_status == 'No_aprobado'
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

  def can_approve_project
    current_edition = Edition.last
    starting_date = current_edition[:project_approval_starting_date]
    ending_date = current_edition[:project_approval_ending_date]
    today = Date.today

    can_approve = true
    can_approve &= starting_date ? starting_date <= today : true
    can_approve &= ending_date ? today <= ending_date : true
    can_approve
  end
end
