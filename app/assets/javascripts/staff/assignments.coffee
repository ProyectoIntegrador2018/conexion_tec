$(document).on 'turbolinks:load', -> 

	# <input value="4" multiple="multiple" type="hidden" name="judge[project_ids][]" id="judge_project_ids">
	
	$r_table = $('#recommendations')
	$all_table = $('#all_projects')
	$form = $('.edit_judge')

	$r_table.on 'click', '.js-remove', ->
		$row = $(this).closest('tr')
		$return_row = $row.clone()
		$last_td = $return_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-check"></i>')
		$last_td.find("button").addClass('js-add btn-success')
		$last_td.find("button").removeClass('js-remove btn-danger')

		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$id = $prev_id.substring($index + 1)
		$input = $('#form-' + $id).remove()
		$return_row.attr('id', 'all-' + $id)
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

		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$id = $prev_id.substring($index + 1)
		# '<input type="hidden" value="' + $id + '" name="judge[project_ids][' + $id + '][id]" id="judge_project_ids_' + $id + '_id">'
		$input = '<input type="hidden" multiple="multiple" value="' + $id + '" name="judge[project_ids][]" id="form-' + $id + '">'
		$form.append($input)
		$new_row.attr('id', 'recommend-' + $id)
		$r_table.append($new_row)
		$new_row.show()
		$row.hide()
