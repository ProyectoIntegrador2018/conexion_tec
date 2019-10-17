# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "click", "input#project_social_impact", ->
	problem_text_area = $("textarea#project_social_impact_problem")
	empathy_text_area = $("textarea#project_social_impact_empathy")
	responsibility_text_area = $("textarea#project_social_impact_responsibility")
	social_impact_checkbox = $("input#project_social_impact")

	if this.checked
		this.removeAttribute("checked")
		problem_text_area.removeAttr("disabled")
		empathy_text_area.removeAttr("disabled")
		responsibility_text_area.removeAttr("disabled")
	else
		this.setAttribute("checked", "true")
		problem_text_area.attr("disabled", "true")
		empathy_text_area.attr("disabled", "true")
		responsibility_text_area.attr("disabled", "true")
