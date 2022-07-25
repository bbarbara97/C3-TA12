show databases;

create database ud12ex15;

use ud12ex15;

create table Platos (
Nombre varchar(30), 
Descripcion varchar(150) NOT NULL,
Tipo varchar(20),
PRIMARY KEY (Nombre)
);

insert into Platos values ('Espaguetis a la Boloñesa','Esta deliciosa receta contiene carne, pasta y verduras','Primer Plato');
insert into Platos values ('Crepes de Chocolate','Unos deliciosos crepes de chocolate ','Postre');
insert into Platos values ('Helado Chocolate','El helado de chocolate es un clásico entre los más clásicos','Postre');
insert into Platos values ('Ensalada caprese','Tan sencilla como tremendamente deliciosa y apetecible, la clásica ensalada italiana','Primer Plato');
insert into Platos values ('Entrecot a la brasa','La carne a la brasa tiene un sabor especial, como esta receta de entrecot de ternera a la brasa','Segundo Plato');

select * from Platos; 

create table Menus (
id int auto_increment,
Fecha_Comida date NOT NULL,
PRIMARY KEY (id)
);

insert into Menus (Fecha_Comida) values (date '2022/08/01');
insert into Menus (Fecha_Comida) values (date '2022/08/08');
insert into Menus (Fecha_Comida) values (date '2022/08/15');
insert into Menus (Fecha_Comida) values (date '2022/08/22');
insert into Menus (Fecha_Comida) values (date '2022/08/29');

select * from Menus; 

create table Contener (
id_Menu int,
nombre_plato varchar(30),
CONSTRAINT FK_ContenerMenu FOREIGN KEY (id_Menu) REFERENCES Menus(id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_ContenerPlato FOREIGN KEY (nombre_plato) REFERENCES Platos(Nombre)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Contener values ('1','Espaguetis a la Boloñesa');
insert into Contener values ('2','Crepes de Chocolate');
insert into Contener values ('3','Helado Chocolate');
insert into Contener values ('4','Ensalada caprese');
insert into Contener values ('5','Entrecot a la brasa');

select * from Contener; 

create table Dias (
id int,
temperatura double,
PRIMARY KEY (id)
);

insert into Dias values (1, 25.8);
insert into Dias values (2, 18.5);
insert into Dias values (3, 30.4);
insert into Dias values (4, 15.2);
insert into Dias values (5, 20.8);

select * from Dias;

create table Servir (
id_dia int,
id_Plato varchar(30),
cantidad int,
CONSTRAINT FK_ServirDia FOREIGN KEY (id_dia) REFERENCES Dias(id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_ServirPlato FOREIGN KEY (id_Plato) REFERENCES Platos(Nombre)
ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id_dia, id_Plato)
);

insert into Servir values (1, 'Espaguetis a la Boloñesa', 15);
insert into Servir values (2,'Crepes de Chocolate', 10);
insert into Servir values (3,'Helado Chocolate', 10);
insert into Servir values (4, 'Ensalada caprese', 15);
insert into Servir values (5, 'Entrecot a la brasa', 15);

select * from Servir;

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

insert into Ofrecer values (1, 1, 25);
insert into Ofrecer values (2,2, 20);
insert into Ofrecer values (3,3, 30);
insert into Ofrecer values (4, 4, 15);
insert into Ofrecer values (5, 5, 25);

select * from Ofrecer;

