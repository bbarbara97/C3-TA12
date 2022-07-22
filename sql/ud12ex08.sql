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

create table Tarjetas_de_Credito ( 
Num_Tarjeta varchar(16) PRIMARY KEY, 
DNI_Clientes varchar(9),
CONSTRAINT FK_ClientesCredito FOREIGN KEY (DNI_Clientes) REFERENCES Clientes(DNI)
ON DELETE CASCADE ON UPDATE CASCADE
);

create table Tarjetas_Embarque (
id int auto_increment,
PRIMARY KEY (id),
DNI_Clientes varchar(9),
CONSTRAINT FK_ClientesEmbarque FOREIGN KEY (DNI_Clientes) REFERENCES Clientes(DNI)
ON DELETE CASCADE ON UPDATE CASCADE
);

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

create table Aeropuertos (
codigo varchar(9) PRIMARY KEY,
Nombre varchar(25) NOT NULL,
Localidad varchar(25) NOT NULL,
Pais varchar(25) NOT NULL
);

create table Aviones (
codigo varchar(9) PRIMARY KEY,
Num_Plazas int NOT NULL,
codigo_aero varchar(9),
CONSTRAINT FK_AeroAviones FOREIGN KEY (codigo_aero) REFERENCES Aeropuertos(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

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

create table Vuelos (
codigo varchar(9) PRIMARY KEY,
Fecha_Salida date NOT NULL,
Hora_Salida date NOT NULL,
Fecha_Llegada date NOT NULL,
Hora_Llegada date NOT NULL,
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