--Script para generar la base de datos Almacén; que tiene como responsabilidad de mantener 
--la informacion del invetario de existencias en un almacén

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

Create Table Usuario(
id_usuario int identity(1,1) primary key,
email varchar(100) Not Null,
password varchar(150) Not Null,
nombre varchar(100) Not Null)

Create Table Cliente(
id_cliente int identity(1,1) primary key,
nombre varchar(100) not null,
apellidoPaterno varchar(100) not null,
apellidoMaterno varchar(100),
email varchar(50),
telefono varchar(10))

Create Table Venta(
id_venta int identity(1,1) primary key,
fecha datetime not null,
id_cliente int not null Foreign key (id_cliente) references Cliente(id_cliente),
total decimal(16,4))

Create Table Concepto(
id_concepto int identity(1,1) primary key,
id_venta int not null Foreign key (id_venta) references Venta(id_venta),
cantidad int not null,
precioUnitario decimal(16,4) not Null,
importe decimal(16,4) not null,
id_producto int not null Foreign key (id_producto) references Producto(id_producto))

--Se insertan los primeros registros para la tabla Categoria
insert into Categoria values('Bebes y Niños','Productos para Bebes y Niños')
insert into Categoria values('Congelados','Productos Congelados')
insert into Categoria values('Despensa','Productos de Consumo embasados en botella, caja, lata, diversos')
insert into Categoria values('Higiene','Productos de Higiene personal')

insert into Usuario values('almacen@almacen.com','9d8cb2a3bec6cdb078ef56c799ea0fc81f3005f528ab08d446ebc14e800f6cbf','Supervisor Almacén')