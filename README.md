# Conexión Tec

Página web para el manejo del evento conexión tec.

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [Da Team](#team)
* [Management resources](#management-resources)
* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Restoring the database](#restoring-the-database)
* [Debugging](#debugging)
* [Running specs](#running-specs)
* [Checking code for potential issues](#checking-code-for-potential-issues)


### Client Details

| Name               	    | Email             | Role                |
| ------------------------- | ----------------- | ------------------  |
| Juan M. Hinojosa Olivares | juhinojo@itesm.mx | Profesor de planta  |


### Environment URLS

* **Production** - [TBD](TBD)
* **Development** - [TBD](TBD)

### Da team

| Name           				| Email             		| Role        |
| ---------------------------- 	| ------------------------- | ----------- |
| José Luis Carvajal Carbajal 	| josecarcar1@gmail.com 	| Development |
| Daniel González González 		| dano.gonzalez0@gmail.com 	| Development |
| Jorge Andrés González Borboa 	| sixofswords3@gmail.com 	| Development |
| Andrés Sosa Silva			  	| andressosasilva@gmail.com | Development |
| Jorge Armando Vázquez Ortiz 	| jorgevzqz6@gmail.com 		| Development |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/ProyectoIntegrador2018/conexion_tec)
* [Backlog]()
* [Heroku]() - to be defined 
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
* Postgres – Version 0.20.0
\
*Inside Gemfile*  
`$ gem 'pg'`

### Setup the project for development

We will usedthe basic tools that come with rails. (rails server, test, and coonsole).

1. Clone this repository into your local machine

```bash
$ git clone https://github.com/ProyectoIntegrador2018/conexion_tec.git
```

2. Setup the database:

```bash
$ rails db:init
```
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


### Debugging

Use raill default gem `debugger`. You just need to put the literal word `debugger` inside the any *.rb file.


### Running tests

To run all tests, you can do:

```
$ rails t 
```

Or for a specific file:

```
$ rails t test/<view, controller,etc.>/<filename>
```

### Checking code for potential issues

To format ruby code, the gem `rubocop` will be used. Check usage on their repository - [Rubocop](https://github.com/rubocop-hq/rubocop). 
