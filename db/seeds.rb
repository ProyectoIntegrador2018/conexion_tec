# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_professor = Professor.create(
	email: "prof1@test.com", 
	enrollment: "L01282893", 
	department: 1, 
	name: "Profesor 1")


first_user = User.create(
	email:"jorge@test.com", 
	password:"password", 
	password_confirmation: "password", 
	role:"admin")

second_user = User.create(
	email:"jorge@test.com", 
	password:"password", 
	password_confirmation: "password", 
	role:"project",
	project: Project.create(name: "Name", field: 1, kind_id: 1, abstract: "asd", video_url: "asd.com", client: 1, professor: first_professor)
	)


Kind.create(name: "Agrobiotecnología")
Kind.create(name: "Automatización de Procesos")
Kind.create(name: "Bionegocios")
Kind.create(name: "Diseño Industrial")
Kind.create(name: "Electrónica-Hardware")
Kind.create(name: "Ingeniería Civil")
Kind.create(name: "Ingeniería de Alimentos")
Kind.create(name: "Ingeniería Industrial")
Kind.create(name: "Ingeniería Mecánica")
Kind.create(name: "Ingeniería Mecatrónica")
Kind.create(name: "Ingeniería Química")
Kind.create(name: "Modelo Arquitectónico")
Kind.create(name: "Modelo de Negocio")
Kind.create(name: "Multidisciplinario")
Kind.create(name: "Nanotecnología")
Kind.create(name: "Proceso de producción")
Kind.create(name: "Química-Bioquímica")
Kind.create(name: "Sistemas Embebidos")
Kind.create(name: "Software")
Kind.create(name: "Otro")
