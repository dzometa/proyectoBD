create database biblioteca;
go
use biblioteca;
go

create table  usuarios(
codigo varchar(10)  not null,
nombre varchar(30) not null,
apellido varchar(30) not null,
cargo varchar (25) not null,
estado char(1) not null,
constraint PK_USUARIOS primary key(	codigo)
);
go
create table cliente(
cod_cliente varchar(10)  not null,
nombre_client varchar(30)not null,
apellido_client varchar(30)not null,
document_client  int not null,
estado_client char(1) not null,
cant_libro int not null,

constraint PK_CLIENTE primary key(cod_cliente),
);
go


create table libro(
id_libro int identity not null,
nombre_lib varchar(50) not null,
descripcion text not null,
paginas int not null,
constraint PK_LIBRO primary key(id_libro),

);
go

create table autor(
id_autor int  identity not null,
nombre_autor varchar (50),
fecha_naci  date,
fecha_muerte  date,

constraint PK_AUTOR primary key(id_autor),
);
go

create table categoria_libro(
id_categoria_libro int primary key identity,
id_ext_libro_autor int  ,
nombre_cat_libro varchar(50) not null,



);
go

create table existencia_libro_autor(
id_ext_libro_autor  int identity,
id_autor int,
id_libro int,
id_categoria_libro int,
existencia int not null,
estado char(1) not null,


constraint PK_EXISTENCIA_LIBROS_AUTOR primary key(id_ext_libro_autor),
constraint FK_AUTOR foreign key(id_autor) references autor(id_autor),
constraint FK_LIBRO foreign key(id_libro) references libro(id_libro),
constraint FK_CATEGORIA_LIBRO foreign key(id_categoria_libro) references categoria_libro(id_categoria_libro),


);
go


create table prestamo (
id_prestamo int identity,
codigo varchar(10),
cod_cliente varchar (10),
id_ext_libro_autor int,
tipo_prestamo varchar (30) ,
fecha_prestamo datetime not null,
feha_devolucion datetime not null,
estado_prestamo char(1) not null,
costo_mora int not null,

constraint PK_PRESTAMO  primary key(id_prestamo),
constraint PK_USUARIO foreign key(codigo) references usuarios(codigo),
constraint PK_CLIENTES foreign key(cod_cliente) references cliente(cod_cliente),
constraint PK_EXISTENCIA_LIBRO_AUTOR foreign key(id_ext_libro_autor) references existencia_libro_autor(id_ext_libro_autor),

);
go






