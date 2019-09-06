# Conexión Tec

[![Maintainability](https://api.codeclimate.com/v1/badges/48ba91edbd5eabbf4912/maintainability)](https://codeclimate.com/github/ProyectoIntegrador2018/conexion_tec/maintainability)

Página web para el manejo del evento conexión tec.


## Table of contents

- [Client Details](#client-details)
- [Environment URLS](#environment-urls)
- [The Team](#team)
- [Management resources](#management-resources)
- [Development](#development)
- [Setup the project for development](#setup-the-project-for-development)
- [Stop the project](#stop-the-project)
- [Debugging](#debugging)
- [Running tests](#running-tests)
- [Checking code for potential issues](#checking-code-for-potential-issues)


### Client Details

| Name                      | Email             | Role               |
| ------------------------- | ----------------- | ------------------ |
| Juan M. Hinojosa Olivares | juhinojo@itesm.mx | Profesor de planta |


### Environment URLS

- **Production** - [localhost:5000](localhost:5000)
- **Development** - [https://aqueous-beyond-94616.herokuapp.com/](https://aqueous-beyond-94616.herokuapp.com/)


### Equipos de desarrollo

**Gucci Gang - AGO - DIC 2018**

| Name                         | Email                     | Role        |
| ---------------------------- | ------------------------- | ----------- |
| José Luis Carvajal Carbajal  | josecarcar1@gmail.com     | Development |
| Daniel González González     | dano.gonzalez0@gmail.com  | Development |
| Jorge Andrés González Borboa | sixofswords3@gmail.com    | Development |
| Andrés Sosa Silva            | andressosasilva@gmail.com | Development |
| Jorge Armando Vázquez Ortiz  | jorgevzqz6@gmail.com      | Development |

**Codebusters - ENE - MAY 2019**

| Name                           | Email                      | Role        |
| ------------------------------ | -------------------------- | ----------- |
| Abril Marina González Ramírez  | abril.gonzalezr@gmail.com  | Development |
| Juan Luis Flores Garza         | jluisfgarza@gmail.com      | Development |
| José Humberto Guevara Martínez | j.humberto95@gmail.com     | Development |
| Luis Alfonso Arriaga Quezada   | luisaq95nin@gmail.com      | Development |
| Santiago Sandoval Treviño      | santiago_st_95@hotmail.com | Development |

**Ruby O's - AGO - DIC 2019**

| Name                           | Email                       | Role        |
| ------------------------------ | --------------------------- | ----------- |
| José Eduardo Sánchez Yépiz		 | gallo.sanchez23@gmail.com   | Development |
| Javier De la Garza Solís       | javierdelagarza96@gmail.com | Development |
| Jose Antonio Domene Reyes			 | domene96@gmail.com 				 | Development |
| Juan Carlos Gonzalez Petrocchi | juancarlosgzz23@gmail.com   | Development |


### Management tools

You should ask for access to this tools if you don't have it already:

- [Github repo](https://github.com/ProyectoIntegrador2018/conexion_tec)
- [Backlog](https://github.com/ProyectoIntegrador2018/conexion_tec/projects/1) - Check Project inside this repository.
- [Heroku](https://aqueous-beyond-94616.herokuapp.com)
- [Documentation](https://goo.gl/EyBjWj)


## Development


### Setup

Before setting up the project, you sould have installed the following development tools:

* [Git](https://git-scm.com/downloads)
* [Docker](https://runnable.com/docker/getting-started/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Plis](https://github.com/IcaliaLabs/plis) (optional, but highly recommended)

Once you have installed the required third-party software, you can follow this steps:

1. Clone the project repository on your local machine

	SSH:

	```bash
	$ git clone git@github.com:ProyectoIntegrador2018/conexion_tec.git
	```

	or HTTPS:
	```bash
	$ git clone https://github.com/ProyectoIntegrador2018/conexion_tec.git
	```

2. Create the Docker image:

	`plis`:

	```bash
	$ plis build
	```

	`docker-compose`:

	```bash
	$ docker-compose build
	```


### Running the stack for development

In yout termina, run:

`plis`

```bash
$ plis start web
```

`docker-compose`

```bash
$ docker-compose up
```

If the service is already running, you can run the command `plis attach frontend-web` to attach current service's logs.

***NOTE: You can allways run `plis run frontend-web bash` or `docker-compose run frontend-web bash` commands to enter the container's console.***

***NOTE: If you have trouble with the connection between the rails application and the database, try turning up the database container and the web container in different terminal window: `plis start db` or `docker-compose up db`, and `plis start web` or `docker-compose up web`.***


### Stopping services

In order to stop `web` entirely you can run:

`plis`:

```bash
$ plis stop
```

`docker-compose`:

```bash
$ docker-compose stop
```

If you want to stop the services and remove the containers:

`plis`:

```bash
$ plis down
```

`docker-compose`:

```bash
$ docker-compose down
```

If you only want to stop one service in particular, you can specify it with the following command:

`plis`:

```bash
$ plis stop [service_name]
```

`docker-compose`:

```bash
$ docker-compose stop [service_name]
```

### Running specs

To run specs, you can do:

`plis`:

```bash
$ plis run test rspec
```

`docker-compose`:
```
$ docker-compose run test rspec
```

Or for a specific file:

`plis`:

```bash
$ plis run test rspec spec/models/user_spec.rb
```

`docker-compose`:

```bash
$ docker-compose run test rspec spec/models/user_spec.rb
```

Currently we have 27 test ranging from unit test to integration test. We would like to increase the test coverate in the app as we believe that testing should be done automatically instead of doing it by hand.

### Deployment

The project is currently deployed on Heroku. To make a deployment push your changes to `master` branch. Deployments are configured to be done automatically when changes are detected on the branch.
