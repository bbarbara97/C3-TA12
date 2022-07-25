show databases;
create database ud12ex8;
use ud12ex8;

create table Clientes (
DNI varchar(9) PRIMARY KEY, 
Nombre varchar(25) NOT NULL,
Apellidos varchar(50) NOT NULL,
Direccion varchar(100) NOT NULL,
Telefono varchar(12) NOT NULL
);

insert into Clientes values ('28764085U','Barbara','Broto','Calle Cambrils', '694257385');
insert into Clientes values ('48234750E','Oriol','Andreazini','Calle Martin', '734462045');
insert into Clientes values ('38423401G','Pau','Besora','Avenida Diputacion', '649285023');
insert into Clientes values ('38452034H','Fernando','Alonso','Calle Felicidad', '639401246');
insert into Clientes values ('39945620G','Rafael','Nadal','Calle Independencia', '732345613');

select * from Clientes;

create table Tarjetas_de_Credito ( 
Num_Tarjeta varchar(16) PRIMARY KEY, 
DNI_Clientes varchar(9),
CONSTRAINT FK_ClientesCredito FOREIGN KEY (DNI_Clientes) REFERENCES Clientes(DNI)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Tarjetas_de_Credito values ('1234567890123456','28764085U');
insert into Tarjetas_de_Credito values ('0987654321098765','48234750E');
insert into Tarjetas_de_Credito values ('7549234012483451','38423401G');
insert into Tarjetas_de_Credito values ('7542344157849563','38452034H');
insert into Tarjetas_de_Credito values ('7549586772394856','39945620G');

select * from Tarjetas_de_Credito;

create table Tarjetas_Embarque (
id int auto_increment,
PRIMARY KEY (id),
DNI_Clientes varchar(9),
CONSTRAINT FK_ClientesEmbarque FOREIGN KEY (DNI_Clientes) REFERENCES Clientes(DNI)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Tarjetas_Embarque (DNI_Clientes) values ('28764085U'), ('48234750E') , ('38423401G') , ('38452034H'), ('39945620G');
select * from Tarjetas_Embarque;

create table Reservas (
id int auto_increment,
Num_Asientos int NOT NULL,
Fecha date NOT NULL,
DNI_Clientes varchar(9),
id_Embarque int,
PRIMARY KEY(id),
CONSTRAINT FK_ClientesReservas FOREIGN KEY (DNI_Clientes) REFERENCES Clientes(DNI)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_EmbarqueReservas FOREIGN KEY (id_Embarque) REFERENCES Tarjetas_Embarque(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Reservas (Num_Asientos,Fecha, DNI_Clientes, id_Embarque) values (2,date '2022/08/01', '28764085U', 1);
insert into Reservas (Num_Asientos,Fecha, DNI_Clientes, id_Embarque) values (1,date '2022/07/20', '48234750E', 2);
insert into Reservas (Num_Asientos,Fecha, DNI_Clientes, id_Embarque) values (5,date '2022/05/05', '38423401G', 3);
insert into Reservas (Num_Asientos,Fecha, DNI_Clientes, id_Embarque) values (4,date '2022/07/16', '38452034H', 4);
insert into Reservas (Num_Asientos,Fecha, DNI_Clientes, id_Embarque) values (2,date '2022/07/13', '39945620G', 5);

select * from Reservas;

create table Aeropuertos (
codigo varchar(9) PRIMARY KEY,
Nombre varchar(25) NOT NULL,
Localidad varchar(25) NOT NULL,
Pais varchar(25) NOT NULL
);

insert into Aeropuertos values ('123456789', 'Aeropuerto de Reus', 'Reus', 'España');
insert into Aeropuertos values ('987654321', 'Aeropuerto El Prat', 'Barcelona', 'España');
select * from Aeropuertos;

create table Aviones (
codigo varchar(9) PRIMARY KEY,
Num_Plazas int NOT NULL,
codigo_aero varchar(9),
CONSTRAINT FK_AeroAviones FOREIGN KEY (codigo_aero) REFERENCES Aeropuertos(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Aviones values ('123123123',40, '123456789');
insert into Aviones values ('123456123',20, '123456789');
insert into Aviones values ('876543214',25, '123456789');
insert into Aviones values ('987604534',40, '987654321');
insert into Aviones values ('654823412',10, '987654321');
select * from Aviones;

create table Asientos (
id varchar(3),
columna varchar(2) NOT NULL,
fila varchar(2) NOT NULL,
planta int NOT NULL,
id_embarque int,
codigo_avion varchar(9),
PRIMARY KEY (id),
CONSTRAINT FK_EmbarqueAsiento FOREIGN KEY (id_embarque) REFERENCES Tarjetas_Embarque(id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_AvionesAsiento FOREIGN KEY (codigo_avion) REFERENCES Aviones(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Asientos values ('12B','1V', '1D',1,1,'123123123');
insert into Asientos values ('10B','1V', '1D',1,2,'123456123');
insert into Asientos values ('11C','3A', '2J',1,3,'876543214');
insert into Asientos values ('28G','4B', '1H',1,4,'987604534');
insert into Asientos values ('12F','5A', '1A',1,5,'654823412');
select * from Asientos;

create table Vuelos (
codigo varchar(9) PRIMARY KEY,
Fecha_Salida date NOT NULL,
Hora_Salida time NOT NULL,
Fecha_Llegada date NOT NULL,
Hora_Llegada time NOT NULL,
codigo_aero_llegada varchar(9),
codigo_aero_salida varchar(9),
codigo_avion varchar(9),
CONSTRAINT FK_AeroVuelosLlegada FOREIGN KEY (codigo_aero_llegada) REFERENCES Aeropuertos(codigo)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_AeroVuelosSalida FOREIGN KEY (codigo_aero_salida) REFERENCES Aeropuertos(codigo)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_AvionVuelos FOREIGN KEY (codigo_avion) REFERENCES Aviones(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Vuelos values ('123412123',date '2022/08/01', time '11:00', date '2022/08/01', time '20:45', '123456789','987654321', '123123123');
insert into Vuelos values ('123412124',date '2022/09/30', time '10:30', date '2022/10/01', time '02:00', '123456789','987654321', '123456123');
insert into Vuelos values ('123412125',date '2022/09/01', time '21:00', date '2022/09/01', time '22:45', '987654321','123456789', '876543214');
insert into Vuelos values ('123412126',date '2022/10/05', time '15:00', date '2022/10/05', time '26:00', '987654321','123456789', '987604534');
insert into Vuelos values ('123412127',date '2022/10/12', time '12:00', date '2022/10/12', time '12:45', '987654321', '123456789', '654823412');

select * from Vuelos;