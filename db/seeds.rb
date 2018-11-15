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
	email: "jorge@test.com", 
	password: "password", 
	password_confirmation: "password", 
	role: "admin")

ExpertiseArea.create(area: "Agrobiotecnología")
ExpertiseArea.create(area: "Automatización de Procesos")
ExpertiseArea.create(area: "Bionegocios")
ExpertiseArea.create(area: "Diseño Industrial")
ExpertiseArea.create(area: "Electrónica-Hardware")
ExpertiseArea.create(area: "Ingeniería Civil")
ExpertiseArea.create(area: "Ingeniería de Alimentos")
ExpertiseArea.create(area: "Ingeniería Industrial")
ExpertiseArea.create(area: "Ingeniería Mecánica")
ExpertiseArea.create(area: "Ingeniería Mecatrónica")
ExpertiseArea.create(area: "Ingeniería Química")
ExpertiseArea.create(area: "Modelo Arquitectónico")
ExpertiseArea.create(area: "Modelo de Negocio")
ExpertiseArea.create(area: "Multidisciplinario")
ExpertiseArea.create(area: "Nanotecnología")
ExpertiseArea.create(area: "Proceso de producción")
ExpertiseArea.create(area: "Química-Bioquímica")
ExpertiseArea.create(area: "Sistemas Embebidos")
ExpertiseArea.create(area: "Software")
ExpertiseArea.create(area: "Otro")

Category.create(name: "Categoria 1")
Category.create(name: "Categoria 2")
Category.create(name: "Categoria 3")
Category.create(name: "Categoria 4")