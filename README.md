# API

#### This repository contains a CRUD Agenda application.

#### Technology used on this project:
1. [Sinatra](https://github.com/sinatra/sinatra)
1. [Mysql2](https://github.com/brianmario/mysql2)

#### With this aplication you can:
1. Create an agenda contact.
1. Read a contact.
1. Update a contact.
1. Delete a contact.

#### How to start the databese:
## TODO: add a database.sh to automatically do this.

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




