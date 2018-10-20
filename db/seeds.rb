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
	role:"admin",
	project: Project.create(name: "Name", field: 1, kind_id: 1, abstract: "asd", video_url: "asd.com", client: 1, professor: first_professor)
	)