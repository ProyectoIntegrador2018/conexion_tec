$(document).on 'turbolinks:load', -> 

	add_to_hidden = (row) ->
		$prev_id = row.attr('id')
		$index = $prev_id.indexOf('-')
		$id = $prev_id.substring($index + 1) 
		if $hidden_field.val()
			$hidden_field.val($hidden_field.val() + ',' + $id)
		else
			$hidden_field.val($id)

	remove_from_hidden = (row) ->
		$prev_id = row.attr('id')
		$index = $prev_id.indexOf('-')
		$id = $prev_id.substring($index + 1) 
		$hidden_array = $hidden_field.val().split(',')
		$hidden_array = jQuery.grep $hidden_array, (p_id) ->
			return $id != p_id
		$hidden_field.val($hidden_array.join(','))

	$r_table = $('#recommendations')
	$all_table = $('#all_projects')
	$hidden_field = $('#assignment_projects')

	$('#recommendations tbody tr').each ->
		add_to_hidden($(this))


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
		remove_from_hidden($return_row)
		$return_row.show()
		$row.remove()
		
	$all_table.on 'click', '.js-add', ->
		$row = $(this).closest('tr')
		$new_row = $row.clone()
		$last_td = $new_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-trash"></i>')
		$last_td.find("button").addClass('js-remove btn-danger')
		$last_td.find("button").removeClass('js-add btn-success')

		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$new_row.attr('id', 'recommend-' + $prev_id.substring($index + 1))
		add_to_hidden($new_row)
		$r_table.append($new_row)
		$new_row.show()
		$row.hide()
