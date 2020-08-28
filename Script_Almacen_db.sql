--Script para generar la base de datos Almacén; que tiene como responsabilidad de mantener la informacion del invetario de existencias en un almacén

--Descomentar la linea para generar la base de datos Almacen_db
--If Not Exists (select * from sys.databases where name = 'Almacen_db') Create DataBase Almacen_db

--Se crea la tabla tarea dentro de la base de datos Almacen_db
Use Almacen_db

Create Table Categoria(
id_categoria int identity(1,1) primary key,
nombreCategoria varchar(50) Not Null,
descripcionCategoria varchar(200))

Create Table Producto(
id_producto int identity(1,1) primary key,
nombreProducto varchar(100) not null,
descripcionProducto varchar (250),
presentacionProducto varchar(150),
marcaProducto varchar(100),
codigoProducto varchar(200)not null,
precioCosto decimal(16,4) not null,
cantidadExistencia decimal(16,4)not null,
id_categoria int not null Foreign key (id_categoria) references Categoria (id_categoria))

