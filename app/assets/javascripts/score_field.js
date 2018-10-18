$(document).on('turbolinks:load',function() {


	var status = $('#user_project_attributes_status').val();

	if (status == "Calificado") {
		document.getElementById("scoreDiv").style.display = "block";
	}
	if (status == "No aprobado") {
		document.getElementById("rejectedDiv").style.display = "block"
	}

	$('#user_project_attributes_status').on('change', function() {
		if ($('#user_project_attributes_status').val() == "Calificado") {
			document.getElementById("scoreDiv").style.display = "block";
			document.getElementById("rejectedDiv").style.display = "none"
		} else if ($('#user_project_attributes_status').val() == "No aprobado") {
			document.getElementById("rejectedDiv").style.display = "block"
			document.getElementById("scoreDiv").style.display = "none";
		} else {
			document.getElementById("rejectedDiv").style.display = "none"
			document.getElementById("scoreDiv").style.display = "none";
		}
	});
});