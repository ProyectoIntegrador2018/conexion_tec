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
        
Major.create(name: "ARQ")
Major.create(name: "IA")
Major.create(name: "IAB")
Major.create(name: "IBN")
Major.create(name: "IBT")
Major.create(name: "IC")
Major.create(name: "IDA")
Major.create(name: "IDS")
Major.create(name: "IFI")
Major.create(name: "IIA")
Major.create(name: "IID")
Major.create(name: "IIN")
Major.create(name: "IIS")
Major.create(name: "IMA")
Major.create(name: "IMD")
Major.create(name: "IME")
Major.create(name: "IMI")
Major.create(name: "IMT")
Major.create(name: "INCQ")
Major.create(name: "INT")
Major.create(name: "IQA")
Major.create(name: "IQP")
Major.create(name: "IQS")
Major.create(name: "ISC")
Major.create(name: "ISD")
Major.create(name: "ITC")
Major.create(name: "ITE")
Major.create(name: "ITI")
Major.create(name: "ITIC")
Major.create(name: "ITM")
Major.create(name: "ITS")
Major.create(name: "Maestría")
Major.create(name: "Doctorado")
Major.create(name: "Otra")

Department.create(name: "Bioingeniería")
Department.create(name: "Ciencias")
Department.create(name: "Computación")
Department.create(name: "Industrial")
Department.create(name: "Mecánica y materiales avanzados")
Department.create(name: "Mecatrónica y electrónica")
Department.create(name: "Tecnologías sostenibles y civil")
Department.create(name: "Otro")

Client.create(client: "Departamento del Tec")
Client.create(client: "Desarrollo propio")
Client.create(client: "Gobierno")
Client.create(client: "Industria privada")
Client.create(client: "Organización social")
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

Category.create(name: "Desarrollo Tecnológico")
Category.create(name: "Desarrollo de Software")
Category.create(name: "Investigación y Desarrollo de Propuestas de Mejora")
Category.create(name: "Productos o Servicios para Emprendimiento de Base Tecnológica")

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
