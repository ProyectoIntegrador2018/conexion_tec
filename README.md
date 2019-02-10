# Conexión Tec

[![Maintainability](https://api.codeclimate.com/v1/badges/48ba91edbd5eabbf4912/maintainability)](https://codeclimate.com/github/ProyectoIntegrador2018/conexion_tec/maintainability)

Página web para el manejo del evento conexión tec.

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [The Team](#team)
* [Management resources](#management-resources)
* [Development](#development)
* [Setup the project for development](#setup-the-project-for-development)
* [Stop the project](#stop-the-project)
* [Debugging](#debugging)
* [Running tests](#running-tests)
* [Checking code for potential issues](#checking-code-for-potential-issues)


### Client Details

| Name               	    | Email             | Role                |
| ------------------------- | ----------------- | ------------------  |
| Juan M. Hinojosa Olivares | juhinojo@itesm.mx | Profesor de planta  |


### Environment URLS

* **Production** - [localhost:5000](localhost:5000)
* **Development** - [https://aqueous-beyond-94616.herokuapp.com/](https://aqueous-beyond-94616.herokuapp.com/)

### Equipos de desarrollo

**Gucci Gang - AGO - DIC 2018**

| Name           				| Email             		| Role        |
| ---------------------------- 	| ------------------------- | ----------- |
| José Luis Carvajal Carbajal 	| josecarcar1@gmail.com 	| Development |
| Daniel González González 		| dano.gonzalez0@gmail.com 	| Development |
| Jorge Andrés González Borboa 	| sixofswords3@gmail.com 	| Development |
| Andrés Sosa Silva			  	| andressosasilva@gmail.com | Development |
| Jorge Armando Vázquez Ortiz 	| jorgevzqz6@gmail.com 		| Development |

**Codebusters - ENE - MAY 2019**

| Name           				| Email             		| Role        |
| ---------------------------- 	| ------------------------- | ----------- |
| Abril Marina González Ramírez | abril.gonzalezr@gmail.com | Development |
| Juan Luis Flores Garza | jluisfgarza@gmail.com 	| Development |
| José Humberto Guevara Martínez | j.humberto95@gmail.com | Development |
| Luis Alfonso Arriaga Quezada	| luisaq95nin@gmail.com | Development |
| Santiago Sandoval Treviño | santiago_st_95@hotmail.com | Development |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/ProyectoIntegrador2018/conexion_tec)
* [Backlog](https://github.com/ProyectoIntegrador2018/conexion_tec/projects/1) - Check Project inside this repository.
* [Heroku](https://aqueous-beyond-94616.herokuapp.com) 
* [Documentation](https://goo.gl/EyBjWj)

## Development
* RVM
\
`$ curl -sSL https://get.rvm.io | bash -s stable`
* Ruby – Version 2.4.2
\
`$ rvm use ruby-2.4.2 --default`
* Rails – Version 5.2.1
\
`$ gem install rails -v 5.2.1`

### Setup the project for development

We will usedthe basic tools that come with rails. (rails server, test, and coonsole).

1. Clone this repository into your local machine

```bash
$ git clone https://github.com/ProyectoIntegrador2018/conexion_tec.git
```

2. Setup the database:
```
$ rails db:migrate
```

3. Start the application:

```
$ rails s
```

Once you see an output like this:

```
web_1   | => Booting Puma
web_1   | => Rails 5.1.3 application starting in development on http://0.0.0.0:3000
web_1   | => Run `rails server -h` for more startup options
web_1   | => Ctrl-C to shutdown server
web_1   | Listening on 0.0.0.0:3000, CTRL+C to stop
```

This means the project is up and running.

### Stop the project

In order to stop the project just hit Ctrl-C on the terminal where rails server is running.

### Running tests

To run all tests, you can do:

```
$ rspec 
```
Currently we have 27 test ranging from unit test to integration test. We would like to increase the test coverate in the app as we believe that testing should be done automatically instead of doing it by hand.
