$(document).on 'turbolinks:load', -> 

	$r_table = $('#recommendations')
	$all_table = $('#all_projects')

	$r_table.on 'click', '.js-remove', ->
		$row = $(this).closest('tr')
		$return_row = $row.clone()
		$last_td = $return_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-check"></i>')
		$last_td.find("button").addClass('js-add btn-success')
		$last_td.find("button").removeClass('js-remove btn-danger')

		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$return_row.attr('id', 'all-' + $prev_id.substring($index + 1))
		$all_table.append($return_row)
		$return_row.show()
		$row.remove()
		
		
	$all_table.on 'click', '.js-add', ->
		$row = $(this).closest('tr')
		$new_row = $row.clone()
		$last_td = $new_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-trash"></i>')
		$last_td.find("button").addClass('js-remove btn-danger')
		$last_td.find("button").removeClass('js-add btn-success')

		# agregar a tabla de recomendaciones
		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$new_row.attr('id', 'recommend-' + $prev_id.substring($index + 1))
		$r_table.append($new_row)
		$new_row.show()
		$row.hide()
