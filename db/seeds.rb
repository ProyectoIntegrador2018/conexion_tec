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

ExpertiseArea.create(name: "Agrobiotecnología")
ExpertiseArea.create(name: "Automatización de Procesos")
ExpertiseArea.create(name: "Bionegocios")
ExpertiseArea.create(name: "Diseño Industrial")
ExpertiseArea.create(name: "Electrónica-Hardware")
ExpertiseArea.create(name: "Ingeniería Civil")
ExpertiseArea.create(name: "Ingeniería de Alimentos")
ExpertiseArea.create(name: "Ingeniería Industrial")
ExpertiseArea.create(name: "Ingeniería Mecánica")
ExpertiseArea.create(name: "Ingeniería Mecatrónica")
ExpertiseArea.create(name: "Ingeniería Química")
ExpertiseArea.create(name: "Modelo Arquitectónico")
ExpertiseArea.create(name: "Modelo de Negocio")
ExpertiseArea.create(name: "Multidisciplinario")
ExpertiseArea.create(name: "Nanotecnología")
ExpertiseArea.create(name: "Proceso de producción")
ExpertiseArea.create(name: "Química-Bioquímica")
ExpertiseArea.create(name: "Sistemas Embebidos")
ExpertiseArea.create(name: "Software")
ExpertiseArea.create(name: "Otro")

second_user = User.create(
	email:"jorge@test.com", 
	password:"password", 
	password_confirmation: "password", 
	role:"project",
	project: Project.create(name: "Name", field: 1, expertise_area_id: 1, abstract: "asd", video_url: "asd.com", client: 1, professor: first_professor)
	)