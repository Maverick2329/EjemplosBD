--Script para generar la base de datos Agenda; que tiene como responsabilidad de mantener la informacion de las tareas a realizar

--Descomentar la linea para generar la base de datos Agenda_db
--If Not Exists (select * from sys.databases where name = 'Agenda_db') Create DataBase Agenda_db

--Se crea la tabla tarea dentro de la base de datos Agenda_db
Use Agenda_db

Create Table Tarea(
 id_tarea int identity(1,1) primary key,
 fecha_inicio_vigencia datetime Not null,
 nombre_tarea varchar(25) Not Null,
 descripcion varchar(300),
 tarea_activa bit Default 0 Not null)

 --Se insertan dos registros de prueba
 insert into Tarea values('2020-08-14 15:44:23.000','Realizar API','Desarrollar una API de Agenda',1)
 insert into Tarea values('2020-08-14 15:55:23.000','Continuar API','Desarrollar una API de Agenda',1)