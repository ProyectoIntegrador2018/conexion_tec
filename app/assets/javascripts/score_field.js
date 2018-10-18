$(document).on('turbolinks:load',function() {


	var status = $('#user_project_attributes_status').val();

	if (status == "Calificado") {
		document.getElementById("scoreDiv").style.display = "block";
	}

	$('#user_project_attributes_status').on('change', function() {
		var scoreFields = document.getElementById("scoreDiv");
		if ($('#user_project_attributes_status').val() == "Calificado") {
			scoreFields.style.display = "block";
		} else {
			scoreFields.style.display = "none";
		}
	});
});