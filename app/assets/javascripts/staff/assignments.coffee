$(document).on 'turbolinks:load', -> 

	$r_table = $('#recommendations')
	$all_table = $('#all_projects')

	$recommended_projects = []
	$list_projects = []

	$('#all_projects tbody tr').each ->
		$list_projects.push($(this))

	$('#recommendations tbody tr').each ->
		$recommended_projects.push($(this))

	$r_table.on 'click', '.js-remove', ->
		$row = $(this).closest('tr')
		$return_row = $row
		$last_td = $return_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-check"></i>')
		$last_td.find("button").addClass('js-add btn-success')
		$last_td.find("button").removeClass('js-remove btn-danger')

		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$return_row.attr('id', 'all-' + $prev_id.substring($index + 1))

		# remover de recommended projects y mostrar en lista de proyectos
		if $.inArray($return_row, $list_projects) != -1
			$return_row.show()
		else
			$list_projects.push($return_row)
			$return_row.show()
		$recommended_projects.splice($.inArray($row, $recommended_projects), 1)
		# remover de la tabla
		$row.remove()
		# console.log("TABLE")
		# console.log($return_row)
		console.log("REMOVED")
		console.log($list_projects)
		console.log($recommended_projects)
		
	$all_table.on 'click', '.js-add', ->
		$row = $(this).closest('tr')
		$(this).closest('tr').hide()
		$new_row = $row
		$last_td = $new_row.find('td:last-child')
		$last_td.find("button").html('<i class="fa fa-trash"></i>')
		$last_td.find("button").addClass('js-remove btn-danger')
		$last_td.find("button").removeClass('js-add btn-success')

		# agregar a tabla de recomendaciones
		$prev_id = $row.attr('id')
		$index = $prev_id.indexOf('-')
		$new_row.attr('id', 'recommend-' + $prev_id.substring($index + 1))
		console.log($new_row)
		$r_table.append($new_row)
		$new_row.show()
		# quitar de arreglo de list y agrega al de recommended
		$recommended_projects.push($new_row)
		$list_projects.splice($.inArray($row, $list_projects),1)

		console.log("ADDED")
		console.log($list_projects)
		console.log($recommended_projects)