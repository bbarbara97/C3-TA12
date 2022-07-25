show databases;

create database ud12ex09;

use ud12ex9;

create table Platos (
id int auto_increment,
nombre VARCHAR(25),
primary key(id)
);

insert into Platos (nombre) values 
('Macarrones'),
('Helado de chocolate'),
('Crepes'),
('Zumo de naranja'),
('Filete Ternera');

create table Recetas(
id int auto_increment,
tiempo int,
cantidad_personas int,
dificultad int,
id_plato int,
primary key(id),
constraint FK_PlatoRecetas foreign key(id_plato) references Platos(id)
on delete cascade on update cascade
);

insert into Recetas (tiempo, cantidad_personas, dificultad, id_plato) values 
(30, 4, 1, 1),
(180, 2, 5, 2),
(30, 5, 3, 3),
(5, 1, 2, 4),
(10, 1, 2, 5);


create table Utensilios(
id int auto_increment,
nombre varchar(25),
primary key(id)
);

insert into Utensilios (nombre) values
('Batidora'),
('Sartén'),
('Espátula');

create table Ingredientes(
id int auto_increment,
nombre varchar(25),
calorias double,
primary key(id)
);

insert into Ingredientes (nombre, calorias) values
('Naranja', 30.0),
('Huevos', 70.0),
('Harina', 364.0),
('Aceite de Oliva', 884.0),
('Macarrones', 370.0),
('Chocolate', 546.0),
('Leche', 42.0),
('Ternera', 250.0);

create table Utilizar(
id_utensilios int,
id_recetas int,
constraint FK_UtensiliosUtilizar foreign key(id_utensilios) references Utensilios(id)
on delete cascade on update cascade,
constraint FK_RecetasUtilizar foreign key(id_recetas) references Recetas(id)
on delete cascade on update cascade,
primary key(id_utensilios, id_recetas)
);

insert into Utilizar (id_utensilios, id_recetas) values
(1, 7),
(1, 8),
(2, 6),
(2, 8),
(2, 10);

create table Contener(
id_recetas int,
id_ingredientes int,
cantidad int,
constraint FK_RecetasContener foreign key(id_recetas) references Recetas(id)
on delete cascade on update cascade,
constraint FK_IngredientesContener foreign key(id_ingredientes) references Ingredientes(id)
on delete cascade on update cascade,
primary key(id_recetas, id_ingredientes)
);

insert into Contener (id_recetas, id_ingredientes, cantidad) values 
(9, 1, 2),
(8, 2, 3),
(8, 3, 150),
(8, 4, 15),
(10, 4, 15),
(7, 6, 100),
(7, 7, 150),
(8, 7, 150),
(10, 8, 300),
(6, 5, 150);




drop table Platos;
drop table Recetas;
drop table Utensilios;
drop table Ingredientes;
drop table Utilizar;
drop table Contener;