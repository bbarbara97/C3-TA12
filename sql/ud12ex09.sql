show databases;

create database ud12ex9;

use ud12ex9;

create table Platos (
id int auto_increment,
nombre VARCHAR(25),
primary key(id)
);

create table Recetas(
id int auto_increment,
tiempo Date,
cantidad_personas int,
dificultad int,
id_plato int,
primary key(id),
constraint FK_PlatoRecetas foreign key(id_plato) references Platos(id)
on delete cascade on update cascade
);

create table Utensilios(
id int auto_increment,
nombre varchar(25),
primary key(id)
);

create table Ingredientes(
id int auto_increment,
nombre varchar(25),
cantidad int,
calorias double,
primary key(id)
);

create table Utilizar(
id_utensilios int,
id_recetas int,
constraint FK_UtensiliosUtilizar foreign key(id_utensilios) references Utensilios(id)
on delete cascade on update cascade,
constraint FK_RecetasUtilizar foreign key(id_recetas) references Recetas(id)
on delete cascade on update cascade,
primary key(id_utensilios, id_recetas)
);

create table Contener(
id_recetas int,
id_ingredientes int,
constraint FK_RecetasContener foreign key(id_recetas) references Recetas(id)
on delete cascade on update cascade,
constraint FK_IngredientesContener foreign key(id_ingredientes) references Ingredientes(id)
on delete cascade on update cascade,
primary key(id_recetas, id_ingredientes)
);