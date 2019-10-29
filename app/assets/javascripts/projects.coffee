# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

calculate_total_grade = ->
	display = $("span#total-grade")
	abstract = $("select#project_grade_abstract")
	description = $("select#project_grade_description")
	abstract_impact = $("select#project_grade_abstract_impact")
	abstract_results = $("select#project_grade_abstract_results")
	abstract_problem = $("select#project_grade_abstract_problem")
	abstract_methodology = $("select#project_grade_abstract_methodology")
	abstract_feasibility = $("select#project_grade_abstract_feasibility")

	abstract = parseInt(abstract.val())
	description = parseInt(description.val())
	abstract_impact = parseInt(abstract_impact.val())
	abstract_results = parseInt(abstract_results.val())
	abstract_problem = parseInt(abstract_problem.val())
	abstract_methodology = parseInt(abstract_methodology.val())
	abstract_feasibility = parseInt(abstract_feasibility.val())

	sum = abstract + description + abstract_impact + abstract_results + abstract_problem + abstract_methodology + abstract_feasibility
	display.text(sum)

$ -> calculate_total_grade()

$(document).on "change", "select#project_grade_abstract", ->
	calculate_total_grade()

$(document).on "change", "select#project_grade_description", ->
	calculate_total_grade()

$(document).on "change", "select#project_grade_abstract_impact", ->
	calculate_total_grade()

$(document).on "change", "select#project_grade_abstract_results", ->
	calculate_total_grade()

$(document).on "change", "select#project_grade_abstract_problem", ->
	calculate_total_grade()

$(document).on "change", "select#project_grade_abstract_methodology", ->
	calculate_total_grade()

$(document).on "change", "select#project_grade_abstract_feasibility", ->
	calculate_total_grade()
