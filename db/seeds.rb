# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# User.create(
# 	email: "abril@test.com", 
# 	password: "password", 
# 	password_confirmation: "password", 
# 	role: "admin")

# User.create(
# 	email: "pepe@test.com", 
# 	password: "password", 
# 	password_confirmation: "password", 
# 	role: "admin")

# User.create(
# 	email: "poncho@test.com", 
# 	password: "password", 
# 	password_confirmation: "password", 
# 	role: "admin")

# User.create(
# 	email: "juan@test.com", 
# 	password: "password", 
# 	password_confirmation: "password", 
# 	role: "admin")

# User.create(
# 	email: "santiago@test.com", 
# 	password: "santiago", 
# 	password_confirmation: "santiago", 
# 	role: "admin")

Major.create(name: "ITC")
Major.create(name: "INT")
Major.create(name: "ISD")
Major.create(name: "IFI")
Major.create(name: "LAD")
Major.create(name: "IMI")
Major.create(name: "LAF")
Major.create(name: "LSP")
Major.create(name: "IQA")
Major.create(name: "LIN")
Major.create(name: "IQP")

Department.create(name: "Matemáticas")
Department.create(name: "Química")
Department.create(name: "Derecho")
Department.create(name: "Otro")

Client.create(client: "Deparamento del Tec")
Client.create(client: "Desarrollo propio")
Client.create(client: "Gobierno")
Client.create(client: "Industria Privada")
Client.create(client: "Organización Social")
Client.create(client: "Profesor de la clase")

Field.create(name: "Biotecnología y alimentos")
Field.create(name: "Energía")
Field.create(name: "Nanotecnología")
Field.create(name: "Ingeniería")
Field.create(name: "Tecnologías de información")
Field.create(name: "Comunicación y eletrónica")
Field.create(name: "Sostenibilidad")
Field.create(name: "Emprendimiento de base tecnológica")
Field.create(name: "Otra")

Status.create(status: "No calificado")
Status.create(status: "Calificado")
Status.create(status: "No aprobado")
Status.create(status: "Aprobado")

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

Judge.create(
	department_id: 1,
	has_tablet: 1)

Judge.create(
	department_id: 2,
	has_tablet: 0)

Judge.create(
	department_id: 3,
	has_tablet: 0)

User.create(
	email: "judge1@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Judge",
	userable_id: 1,
	name: "Juez 1")

User.create(
	email: "judge2@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Judge",
	userable_id: 2,
	name: "Juez 2")

User.create(
	email: "judge3@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Judge",
	userable_id: 3,
	name: "Juez 3")

Administrator.create()

Administrator.create()

Administrator.create()

Administrator.create()

Administrator.create()

User.create(
	email: "abril@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Administrator",
	userable_id: 1,
	name: "Abril")

User.create(
	email: "juan@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Administrator",
	userable_id: 2,
	name: "Juan")

User.create(
	email: "pepe@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Administrator",
	userable_id: 3,
	name: "Humberto")

User.create(
	email: "poncho@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Administrator",
	userable_id: 4,
	name: "Alfonso")

User.create(
	email: "santiago@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Administrator",
	userable_id: 5,
	name: "Santiago")

Professor.create(
	department_id: 1)

Professor.create(
	department_id: 2)

Professor.create(
	department_id: 3)

Professor.create(
	department_id: 4)

User.create(
	email: "professor1@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Professor",
	userable_id: 1,
	name: "Luis Humberto")

User.create(
	email: "professor2@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Professor",
	userable_id: 2,
	name: "Jackeline")

User.create(
	email: "professor3@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Professor",
	userable_id: 3,
	name: "Elda Quiroga")

User.create(
	email: "professor4@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Professor",
	userable_id: 4,
	name: "Lorena Gómez")

Student.create(
	major_id: 1)

Student.create(
	major_id: 2)

Student.create(
	major_id: 3)

Student.create(
	major_id: 4)

User.create(
	email: "student1@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Student",
	userable_id: 1,
	name: "Estudiante 1")

User.create(
	email: "student2@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Student",
	userable_id: 2,
	name: "Estudiante 2")

User.create(
	email: "student3@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Student",
	userable_id: 3,
	name: "Estudiante 3")

User.create(
	email: "student4@test.com", 
	password: "password", 
	password_confirmation: "password",
	userable_type: "Student",
	userable_id: 4,
	name: "Estudiante 4")

# Edition.create(
# 	number: 2019,
# 	registry_open: "2019-01-01",
# 	registry_limit: "2020-01-01",
# 	video_open: "2019-01-01",
# 	video_limit: "2020-01-01")

# Evaluation.create(
# 	result:8.5,
# 	assignment_id: 1)

# Assignment.create(
# 	judge_id:1,
# 	project_id:1)

# Judge.create(
# 	has_tablet:true,
# 	department_id: 1)


# Project.create(
# 	name:"test",
# 	abstract: "test",
# 	video_url: "http:google.com",
# 	category_id: 1,
# 	expertise_area_id: 1,
# 	description: "test",
# 	selection_score: 10.0,
# 	evaluation_score: 8.5,
# 	professor_id: 1,
# 	student_id: 1,
# 	field_id: 1,
# 	client_id: 1,
# 	status_id: 1,
# 	edition_id: 1)

