show databases;

create database ud12ex15;

use ud12ex15;

create table Platos (
Nombre varchar(15), 
Descripcion varchar(150) NOT NULL,
Tipo varchar(20),
PRIMARY KEY (Nombre)
);

create table Menus (
id int auto_increment,
Fecha_Comida date NOT NULL,
PRIMARY KEY (id)
);

create table Contener (
id_Menu int,
nombre_plato varchar(15),
CONSTRAINT FK_ContenerMenu FOREIGN KEY (id_Menu) REFERENCES Menus(id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_ContenerPlato FOREIGN KEY (nombre_plato) REFERENCES Platos(Nombre)
ON DELETE CASCADE ON UPDATE CASCADE
);

create table Dias (
id int,
temperatura double,
PRIMARY KEY (id)
);

create table Servir (
id_dia int,
id_Plato varchar(15),
cantidad int,
CONSTRAINT FK_ServirDia FOREIGN KEY (id_dia) REFERENCES Dias(id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_ServirPlato FOREIGN KEY (id_Plato) REFERENCES Platos(Nombre)
ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id_dia, id_Plato)
);

create table Ofrecer (
id_dia int,
id_menu int,
numero_personas int,
CONSTRAINT FK_DiaServir FOREIGN KEY (id_dia) REFERENCES Dias(id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_ServirMenu FOREIGN KEY (id_menu) REFERENCES Menus(id)
ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id_dia, id_menu)
);
