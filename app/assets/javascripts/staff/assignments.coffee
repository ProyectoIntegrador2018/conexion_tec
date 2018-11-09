$(document).on 'turbolinks:load', -> 

	# <input type="hidden" value="1" name="judge[project_ids][1][id]" id="judge_project_ids_1_id">
	
	$r_table = $('#recommendations')
	$all_table = $('#all_projects')
	$form = $('.edit_judge')

	$('#recommendations tbody tr').each ->
		$prev_id = $(this).attr('id')
		$index = $prev_id.indexOf('-')
		$id = $prev_id.substring($index + 1)
		$input = '<input type="hidden" value="' + $id + '" name="judge[project_ids][' + $id + '][id]" id="judge_project_ids_' + $id + '_id">'
		$form.append($input)

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
		$input = $('#judge_project_ids_' + $id + '_id').remove()
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
		$input = '<input type="hidden" value="' + $id + '" name="judge[project_ids][' + $id + '][id]" id="judge_project_ids_' + $id + '_id">'
		$form.append($input)
		$new_row.attr('id', 'recommend-' + $id)
		$r_table.append($new_row)
		$new_row.show()
		$row.hide()
