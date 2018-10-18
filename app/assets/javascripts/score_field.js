$(document).on('turbolinks:load',function() {
	$('#user_project_attributes_status').on('change', function() {
		var scoreFields = document.getElementById("scoreDiv");
		if ($('#user_project_attributes_status').val() == "Calificado") {
			scoreFields.style.display = "block";
		} else {
			scoreFields.style.display = "none";
		}
	});
});