# API

#### This repository contains a CRUD Agenda application.

### Technology used on this project:
1. [Sinatra](https://github.com/sinatra/sinatra)
1. [Mysql2](https://github.com/brianmario/mysql2)
1. [Mongodb](https://github.com/mongodb/mongo-ruby-driver)
1. [Dotenv](https://github.com/bkeepers/dotenv)

### With this aplication you can:
1. Create any agenda type you want.
1. Read a contact.
1. Update a contact.
1. Delete a contact.

### How to start the MySQL:

first of all we need to create our ```.env```. Place it on the same folder as the ```server.rb```. Here is an ```.env``` exemple:

```
DATABASE_STORAGE_TYPE=mongodb

DATABASE_HOST_MYSQL2=localhost
DATABASE_USERNAME_MYSQL2=root
DATABASE_PWD_MYSQL2=
DATABASE_NAME_MYSQL2=AGENDA

DATABASE_HOST_MONGODB=127.0.0.1:27017
DATABASE_NAME_MONGODB=agenda
DATABASE_COLLECTION_NAME_MONGODB=user
```

with our .env file created we are safe to continue.

Start mysql cli

````
  mysql -u root -p
````

create 'agenda' database

```
  CREATE DATABASE AGENDA;
```

create agenda table

````
CREATE TABLE `agenda` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` CHAR(100),
	`email` CHAR(100),
	PRIMARY KEY (`id`)
);
````

### How to start the Mongodb:



go to ```../lib/api/server.rb``` and run ```ruby server.rb``` you will see your aplication running on http://127.0.0.1:4567 port.

Using you favorite API Client (Insomnia/Postman):

### Show all our contacts:
 Select ```GET``` option and set the URL to be ```http://127.0.0.1:4567/``` you will get all the contacts you have on your agenda.

### Create our first contact:
Select ```POST``` option and set the URL to be ```http://127.0.0.1:4567/create``` choose the option ```JSON``` and pass our arguments.

```
  {
    "name": "mike",
	  "email": "mike@xpto.com"
  }
```

### Update  contact:
Select ```PUT``` option and set the URL to be ```http://127.0.0.1:4567/update``` choose the option ```JSON``` and pass our arguments.

```
  {
    "name": "mike",
	  "email": "mike@xpto.com"
  }
```

OBS: the id is hard-coded (study only) so you have to change the id you want manually, on ```../lib/storage/mysql2.rb.```

### Delete contact:
Select ```DELETE``` option and set the URL to be ```http://127.0.0.1:4567/delete``` choose the option ```JSON``` and pass our arguments.

```
  {
    "name": "mike"
  }
```











