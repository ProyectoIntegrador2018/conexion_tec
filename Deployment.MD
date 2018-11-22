# Deployment de Conexión Tec

Pasos para realizar el despliege

### Requisitos

1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
2. [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)

## Descargar el repositorio

Corremos el siguiente comando:
```
$ git clone https://github.com/ProyectoIntegrador2018/conexion_tec.git
```

Ejecutado el comando, veráz algo similar dentro de tu terminal lo cual indica que el repositorio con el código pudo ser descargado de manera correcta.
```
Cloning into 'conexion_tec'...
remote: Enumerating objects: 185, done.
remote: Counting objects: 100% (185/185), done.
remote: Compressing objects: 100% (106/106), done.
remote: Total 817 (delta 115), reused 129 (delta 76), pack-reused 632
Receiving objects: 100% (817/817), 121.18 KiB | 317.00 KiB/s, done.
Resolving deltas: 100% (437/437), done.
```
Despues, ingresaremos al directorio donde se encuentra el proyecto ingresando el siguiente comando:
```
$ cd conexion_tec
```

### Subir a la aplicación a Heroku.

Una vez que hayamos realizado los cambios a la aplicación es necesario que estos se encuentren dentro de la branch de master. Heroku solamente sube aplicaciones que se encuentren en `master`.

Si no estas segúro en que branch te encuentras puedes ingresar el siguiente comando.
```
$ git branch
```
y esta te arrojá la branch en la que te encuentras. En mi caso me encuentro en master.
```
* master
```
Asegurate que no tengas cambios pendientes corriendo el comando 
```
$ git status
```
En caso de que existe, commitea los cambios y subelos a master.

Como ya existe una aplicación de heroku realizada para este proyecto no existe la necesidad crear una aplicación nueva de heroku.

Dentro de tu terminal escribes el siguiente comando:
```
$ heroku git:remote -a aqueous-beyond-94616
```
Cuando estemos listo para realizar un nuevo deploy ejecutamos el comando:
```
$ git push heroku
```
Veremos el proceso de instalación automático de la aplicación en Heroku
```
Counting objects: 816, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (619/619), done.
Writing objects: 100% (816/816), 112.22 KiB | 3.87 MiB/s, done.
Total 816 (delta 464), reused 259 (delta 144)
remote: Compressing source files... done.
remote: Building source:
remote: 
remote:  !     Warning: Multiple default buildpacks reported the ability to handle this app. The first buildpack in the list below will be used.
remote: 			Detected buildpacks: Ruby,Node.js
remote: 			See https://devcenter.heroku.com/articles/buildpacks#buildpack-detect-order
remote: -----> Ruby app detected
remote: -----> Compiling Ruby/Rails
remote: -----> Using Ruby version: ruby-2.4.2
remote: -----> Installing dependencies using bundler 1.15.2
....
```
Al final de este proceso nos avisara que la aplicación ya esta activa
```
remote: -----> Discovering process types
remote:        Procfile declares types     -> (none)
remote:        Default types for buildpack -> console, rake, web, worker
remote: 
remote: -----> Compressing...
remote:        Done: 55.7M
remote: -----> Launching...
remote:        Released v5
remote:        https://aqueous-beyond-94616.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/aqueous-beyond-94616.git
 * [new branch]      master -> master
```
Antes de poder utilizar la aplicación tenemos que actualizar la base de datos dentro de heroku e instalar los usuarios por default con los siguientes comandos:
```
$ heroku run rails db:migrate
```
Veremos los Creates e Inserts de las tablas en la base de datos
```
...
== 20180920204652 RemoveEmailPasswordFromJudge: migrating =====================
-- remove_column(:judges, :password)
D, [2018-09-22T21:00:46.618667 #4] DEBUG -- :    (2.1ms)  ALTER TABLE "judges" DROP COLUMN "password"
   -> 0.0026s
-- remove_column(:judges, :email)
D, [2018-09-22T21:00:46.623208 #4] DEBUG -- :    (3.7ms)  ALTER TABLE "judges" DROP COLUMN "email"
   -> 0.0042s
-- remove_column(:projects, :password)
D, [2018-09-22T21:00:46.627189 #4] DEBUG -- :    (2.9ms)  ALTER TABLE "projects" DROP COLUMN "password"
   -> 0.0032s
-- remove_column(:projects, :email)
D, [2018-09-22T21:00:46.630605 #4] DEBUG -- :    (3.1ms)  ALTER TABLE "projects" DROP COLUMN "email"
   -> 0.0033s
-- remove_column(:projects, :password_digest)
D, [2018-09-22T21:00:46.632466 #4] DEBUG -- :    (1.5ms)  ALTER TABLE "projects" DROP COLUMN "password_digest"
   -> 0.0018s
== 20180920204652 RemoveEmailPasswordFromJudge: migrated (0.0164s) ============

D, [2018-09-22T21:00:46.637864 #4] DEBUG -- :   ActiveRecord::SchemaMigration Create (4.3ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20180920204652"]]
D, [2018-09-22T21:00:46.645264 #4] DEBUG -- :    (4.1ms)  COMMIT
D, [2018-09-22T21:00:46.667509 #4] DEBUG -- :   ActiveRecord::InternalMetadata Load (3.5ms)  SELECT  "ar_internal_metadata".* FROM "ar_internal_metadata" WHERE "ar_internal_metadata"."key" = $1 LIMIT $2  [["key", "environment"], ["LIMIT", 1]]
D, [2018-09-22T21:00:46.688252 #4] DEBUG -- :    (5.7ms)  BEGIN
D, [2018-09-22T21:00:46.698233 #4] DEBUG -- :   ActiveRecord::InternalMetadata Create (5.0ms)  INSERT INTO "ar_internal_metadata" ("key", "value", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "key"  [["key", "environment"], ["value", "production"], ["created_at", "2018-09-22 21:00:46.691752"], ["updated_at", "2018-09-22 21:00:46.691752"]]
D, [2018-09-22T21:00:46.703913 #4] DEBUG -- :    (3.0ms)  COMMIT
D, [2018-09-22T21:00:46.705234 #4] DEBUG -- :    (1.1ms)  SELECT pg_advisory_unlock(7351622198637525375)
```
Y por ultimo:
```
$ heroku run rails db:seed
```
y veras
```
Running rails db:seed on ⬢ aqueous-beyond-94616... up, run.5285 (Free)
D, [2018-09-22T21:19:22.610522 #4] DEBUG -- :    (1.5ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
D, [2018-09-22T21:19:22.666492 #4] DEBUG -- :    (5.5ms)  BEGIN
D, [2018-09-22T21:19:22.771587 #4] DEBUG -- :   User Exists (3.4ms)  SELECT  1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER($1) LIMIT $2  [["email", "jorge@test.com"], ["LIMIT", 1]]
D, [2018-09-22T21:19:22.800590 #4] DEBUG -- :    (2.7ms)  ROLLBACK
D, [2018-09-22T21:19:22.894286 #4] DEBUG -- :    (1.2ms)  BEGIN
D, [2018-09-22T21:19:22.911361 #4] DEBUG -- :    (4.9ms)  ROLLBACK
```
El primer comando actualiza la base de datos, mientras que el segundo insertar los datos por default en la base de datos.

Listo!!
La aplicación se encuentra corriendo en https://aqueous-beyond-94616.herokuapp.com/
