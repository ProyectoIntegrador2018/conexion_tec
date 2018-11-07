$(document).on 'turbolinks:load', -> 

	$r_table = $('#recommendations')
	$all_table = $('#all_projects')

	$add_selector = $('.js-add')
	$remove_selector = $('.js-remove')

	$r_table.on 'click', '.js-remove', ->
		$row = $(this).closest('tr')
		$row.remove()
		console.log($(this))
		# $last_td = $row.find('td:last-child')
		# $last_td.find("button").html('<i class="fa fa-check"></i>')
		# $last_td.find("button").addClass('js-add btn-success')
		# $last_td.find("button").removeClass('js-remove btn-danger')


	$all_table.on 'click', '.js-add', ->
		console.log($(this))
		$row = $(this).closest('tr')
		$(this).closest('tr').hide()
		$r_table.append($row)
		$new_row = $r_table.find('tr:last')
		$last_td = $new_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-trash"></i>')
		$last_td.find("button").addClass('js-remove btn-danger')
		$last_td.find("button").removeClass('js-add btn-success')
		$new_row.show()