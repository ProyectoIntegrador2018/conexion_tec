# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = Administrator.create()
User.create(
    name: "Steve Rogers",
    email: "A00816927@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Administrator",
    userable_id: admin.id)

admin = Administrator.create()
User.create(
    name: "Anthony Edward Stark",
    email: "A01280767@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Administrator",
    userable_id: admin.id)

admin = Administrator.create()
User.create(
    name: "Natalia Alianovna Romanova",
    email: "A01280904@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Administrator",
    userable_id: admin.id)

admin = Administrator.create()
User.create(
    name: "Bruce Banner",
    email: "A01280642@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Administrator",
    userable_id: admin.id)

admin = Administrator.create()
User.create(
    name: "Nicholas Joseph Fury",
    email: "A01039195@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Administrator",
    userable_id: admin.id)
        
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

Edition.create(number: 1, registry_open: Date.today, registry_limit: Date.today + 30)

10.times do |i|
	professor = Professor.create(department_id: rand(1..4))
	User.create(
        name: "Profesor #{i}",
    	email: "professor#{i}@test.com", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Professor",
        userable_id: professor.id)

	student = Student.create(major_id: rand(1..11))
	User.create(
        name: "Estudiante #{i}",
    	email: "student#{i}@test.com", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Student",
        userable_id: student.id)

	judge = Judge.create(department_id: rand(1..4), has_tablet: rand(0..1))
	User.create(
        name: "Juez #{i}",
    	email: "judge#{i}@test.com", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Judge",
        userable_id: judge.id)
end
