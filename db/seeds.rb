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
    email: "santiago_st_95@hotmail.com", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Administrator",
    userable_id: admin.id,
    authorized: 1)

operative = Operative.create()
User.create(
    name: "Anthony Edward Stark",
    email: "A01280767@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Operative",
    userable_id: operative.id)

professor = Professor.create()
User.create(
    name: "Natalia Alianovna Romanova",
    email: "A01280904@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Professor",
    userable_id: professor.id,
    authorized: 1)

student = Student.create()
User.create(
    name: "Bruce Banner",
    email: "A01280642@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Student",
    userable_id: student.id,
    authorized: 1)

committee = Committee.create()
User.create(
    name: "Nicholas Joseph Fury",
    email: "A01039195@itesm.mx", 
    password: "password", 
    password_confirmation: "password", 
    userable_type: "Committee",
    userable_id: committee.id)
        
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

student = Student.create(major_id: Major.first.id)
User.create(
        name: "Paul Enrique Vazquez Badillo",
    	email: "A00819877@itesm.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Student",
        userable_id: student.id,
        authorized: 1)

professor = Professor.create(department_id: Department.first.id)
User.create(
        name: "Juan Hinojosa",
    	email: "juhinojo@tec.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Professor",
        userable_id: professor.id,
        authorized: 1)

Project.create(
        name: "RoBorregos @Home",
        abstract:"El equipo de robótica RoBorregos, en colaboración con clase de proyecto de robótica, trabaja este semestre en la creación de un robot de servicio doméstico para la competencia internacional de Robocup @HOME, categoría Open, en la cual se busca desarrollar soluciones tecnológicas para el hogar.
        Este semestre el desarrollo se centra específicamente en el reto de “Speech and Person Recognition”, el cual engloba diferentes áreas de investigación y desarrollo inteligente de tareas complejas como: interacción humano-robot en situaciones realísticas, detección de objetos y humanos con visión, control y navegación, mapeo del entorno, procesamiento (parsing) de voz, uso de IoT, al igual que un elevado reto mecánico estructural y funcional.
        Algunas de las tecnologías utilizadas para realizar el sistema son ROS, Tensorflow, Kinect v1 y diferentes herramientas de mapeo en tiempo real. 
        Finalmente, el proyecto podria en un futuro brindar un servicio de comodidad, seguridad y ayuda a personas con discapacidades motrices o que requieran atención especial dentro de su propia casa.",
        category_id: Category.first.id,
        expertise_area_id: ExpertiseArea.first.all,
        description: "Desarrollar un robot de servicio que ayude con las tareas del hogar.",
        professor_id: professor.id,
        student_id: student.id,
        field_id: Field.first.id,
        client_id: Client.first.id,
        status_id: Status.first.id,
        edition_id: Edition.first.id,
        attended: 0)

student = Student.create(major_id: Major.first.id)
User.create(
        name: "Rodrigo Ruz Cuen",
    	email: "a01703007@itesm.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Student",
        userable_id: student.id,
        authorized: 1)

professor = Professor.create(department_id: Department.first.id)
User.create(
        name: "Luis Eduardo Garza Castañón",
    	email: "legarza@tec.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Professor",
        userable_id: professor.id,
        authorized: 1)

Project.create(
        name: "Espectrometría de Bajo Costo",
        abstract:"Nuestro proyecto consiste en el diseño, construcción y calibración de un sistema de espectrometría de reflectancia para el análisis de suelo. El alto costo de estos análisis en laboratorio ha limitado el desarrollo sostenible de comunidades agrícolas y rurales (Gublo, 2015). Por este motivo, es necesario crear alternativas de bajo costo que ayuden a mejorar el acceso a la información sobre producción agrícola. El hardware del espectrómetro está basado en conceptos de óptica y consiste principalmente en una caja impresa en material 3D con una entrada de luz a través de un cable de fibra óptica; la luz es canalizada hacia una rejilla de difracción que se encarga de dispersarla hacia un sensor de imagen lineal de la marca SONY. El software del proyecto consiste en la recopilación de datos del sensor a través de Arduino, su posterior análisis en MATLAB, y finalmente la realización de un mapeo bioquímico del terreno en Python. Los componentes individuales del espectrómetro ya se tienen y se está trabajando en su calibración e integración en el sistema ciberfísico, que esperamos esté listo para tomar mediciones a finales del mes de Marzo y tenga la capacidad de detectar al menos un compuesto orgánico para el mes de Abril del 2019. Este proyecto puede tener un impacto positivo en comunidades agrícolas, ya que a través de la recopilación de información sobre su siembra a través del espectrómetro, se puede empoderar a los sembradores para que mejoren la productividad y sostenibilidad de sus comunidades y cosechas.",
        category_id: Category.first.id,
        expertise_area_id: ExpertiseArea.first.all,
        description: "Desarrollar un espectrómetro de reflectancia de bajo costo que permita el muestreo y análisis de suelo en zonas agrícolas rurales.",
        professor_id: professor.id,
        student_id: student.id,
        field_id: Field.first.id,
        client_id: Client.first.id,
        status_id: Status.first.id,
        edition_id: Edition.first.id,
        attended: 0)

student = Student.create(major_id: Major.first.id)
User.create(
        name: "Sergio Andrés Villarreal Gómez",
    	email: "a01381492@itesm.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Student",
        userable_id: student.id,
        authorized: 1)

professor = Professor.create(department_id: Department.first.id)
User.create(
        name: "Felipe Hernández Rodríguez",
    	email: "felipe.hdz@tec.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Professor",
        userable_id: professor.id,
        authorized: 1)

Project.create(
        name: "Monitoreo estadístico en tiempo real para proveedores",
        abstract:"El Proyecto de Monitoreo estadístico en tiempo real para proveedores busca mejorar los sistemas actuales de inspección-recibo de la empresa mediante la implementación de un sistema electrónico de monitoreo, este sistema presenta una innovación a las normas de control estadístico de procesos que menciona la norma IATF:16949. 
        En este proyecto se recibe apoyo de un equipo multidisciplinario e interdepartamental para el desarrollo de esta plataforma, que buscará monitorear estadísticamente los procesos de manufactura de los proveedores, sustentándose en herramientas como Gráficos de Control y Análisis de Cpk y Ppk. 
        El sistema estará enfocado a diez números de parte, de dos proveedores, que han presentado defectos de producción o cuentan con un alto grado de importancia debido a su costo o volumen requerido.
        El proyecto busca relacionar múltiples departamentos para establecer tanto las características críticas como la viabilidad de darle trazabilidad a cada lote del proceso y mejorar de esta manera los indicadores de desempeño y los tiempos de inspección.
        El producto final para principios de Mayo 2019, será una plataforma web en la cual se podrán analizar en tiempo real los procesos de producción de los proveedores, dando mayor capacidad a la empresa para identificar defectos y estableciendo una relación puerta a puerta para los materiales que se reciben de los proveedores.
        Este proyecto forma parte del Semestre i del programa InternING de la carrera de Ingeniería Industrial y de Sistemas del Tecnológico de Monterrey, Campus Saltillo.",
        category_id: Category.first.id,
        expertise_area_id: ExpertiseArea.first.all,
        description: "Desarrollar un sistema de comunicación entre empresas para monitorear los procesos de manufactura de los proveedores, a fin de mejorar los indicadores de las operaciones de inspección-recibo en la empresa, basados en el control estadístico de la producción incluido en la norma IATF:16949, para principios de Mayo 2019.",
        professor_id: professor.id,
        student_id: student.id,
        field_id: Field.first.id,
        client_id: Client.first.id,
        status_id: Status.first.id,
        edition_id: Edition.first.id,
        attended: 0)

student = Student.create(major_id: Major.first.id)
User.create(
        name: "Rodolfo Cañamar Guajardo",
    	email: "a00816931@itesm.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Student",
        userable_id: student.id,
        authorized: 1)

professor = Professor.create(department_id: Department.first.id)
User.create(
        name: "José Ignacio Huertas Cardozo",
    	email: "jhuertas@tec.mx", 
    	password: "password", 
    	password_confirmation: "password", 
        userable_type: "Professor",
        userable_id: professor.id,
        authorized: 1)

Project.create(
        name: "Prototipo de Naves Industrial para Evaluar el Uso de Materiales Cambiantes de Fase (PCM)",
        abstract:"Este proyecto, que forma parte del consorcio que el Tecnologico de Monterrey tiene con varias empresas locales y que impulsa el uso de tecnologías emergentes y apoya a las economías locales, está a cargo del Dr. José Ignacio Huertas Cardozo y supervisado directamento por  Enrique Darinel González Campos. Se está trabajando en conjunto con la empresa local NRGY en construir dos prototipos de nave industrial en el cual uno tendría PCMs por dentro y el otro no. Estas naves tendrán unidades de aire acondicionado y varios instrumentos de medición de temperatura, consumo energético, entre otros. Estas estarán en las mismas condiciones excepto por la instalación de PCMs. Esto con el objetivo de obtener información en tiempo real, con la instalación de un sistema que esté brindando información al momento de las temperaturas de ambos prototipos acerca del consumo energético y poder encontrar las ventajas y desventajas que se puedan observar con el uso de PCMs en las construcciones. Esta información nos permitirá realizar varios análisis y poder encontrar el ahorro de energía por uso de PCMs por área instalada y también, posteriormente, lograr comparar distintos tipos de PCMs y acomodos para encontrar el más óptimo. ",
        category_id: Category.first.id,
        expertise_area_id: ExpertiseArea.first.all,
        description: "Hacer pruebas e ilustrar la reducción en consumo energético asociado al aire acondicionado usando PCMs en prototipos de naves industriales.",
        professor_id: professor.id,
        student_id: student.id,
        field_id: Field.first.id,
        client_id: Client.first.id,
        status_id: Status.first.id,
        edition_id: Edition.first.id,
        attended: 0)