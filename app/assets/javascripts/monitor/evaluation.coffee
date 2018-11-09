$(document).on 'turbolinks:load', -> 
	$form = $('#assistance')
	$checkbox = $form.find('input:checkbox')
	$checkbox.change -> $form.submit()

