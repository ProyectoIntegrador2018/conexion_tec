$(document).on('turbolinks:load', function() {

	var limit_students = 6;
	var count = 0;
	$('#add_student').on('click', function() {
		if (count < 6) {
			var parent = document.getElementById("members_form")
			var form = document.createElement('div')
			form.innerHTML = '<label for="user_project_attributes_students_nombre">Nombre</label><input class="form-control" type="text" name="user[project_attributes][students][][name]" id="user_project_attributes_students_name" /> <label for="user_project_attributes_students_correo_electronico">Correo electronico</label> <input class="form-control" type="text" name="user[project_attributes][students][][email]" id="user_project_attributes_students_email" /> <label for="user_project_attributes_students_mátricula">Mátricula</label> <input class="form-control" type="text" name="user[project_attributes][students][][enrollment]" id="user_project_attributes_students_enrollment" /> <label for="user_project_attributes_students_carrera">Carrera</label> <input class="form-control" type="text" name="user[project_attributes][students][][major]" id="user_project_attributes_students_major" />'
			parent.appendChild(form)
			count += 1
		} else {
			alert("Solamente se permiten hasta 6 alumnos")
		}
	});
});