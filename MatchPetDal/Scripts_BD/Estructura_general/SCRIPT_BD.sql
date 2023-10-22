-- =============================================
-- Author:		<Duban Steven Estupi�an Parra>
-- Create date: <20-Sept-2023>
-- Description:	<Se crea script para la creaci�n
-- de la base de datos>
-- =============================================

DROP DATABASE DBMatchpet;

CREATE DATABASE DBMatchpet;

USE DBMatchpet;

--=============================================
-- Tablas parametricas
---============================================
CREATE TABLE Estado(
	idEstado INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(20) NOT NULL
)

INSERT INTO Estado VALUES ('Activo');
INSERT INTO Estado VALUES ('Inactivo');
INSERT INTO Estado VALUES ('Borrado');

CREATE TABLE TipoAnimal(
	idTipoAnimal INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(20) NOT NULL,
	estado INT NOT NULL
)

INSERT INTO TipoAnimal Values ('Perros',1);
INSERT INTO TipoAnimal Values ('Gatos',1);
INSERT INTO TipoAnimal Values ('Aves',1);

CREATE TABLE Usuario(
	idUsuario INT PRIMARY KEY IDENTITY,
	nombres VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	estado INT NOT NULL
)

INSERT INTO Usuario Values ('Duban','Estupinan',1);
INSERT INTO Usuario Values ('Juan','Benavides',1);
INSERT INTO Usuario Values ('Daniel','Puentes',1);


CREATE TABLE TipoPago(
	idTipoPago INT PRIMARY KEY IDENTITY,
	tipoPago VARCHAR(100) NOT NULL,
	descripcion VARCHAR(100),
	estado INT NOT NULL
)

INSERT INTO TipoPago Values ('Efectivo','Se registran pagos en efectivo',1);
INSERT INTO TipoPago Values ('Nequi','Donaciones hechas por nequi',1);
INSERT INTO TipoPago Values ('DaviPlata','Donaciones echas por Daviplata',1);


CREATE TABLE Modulo (
  idModulo INT PRIMARY KEY IDENTITY,
  titulo VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100),
  icono VARBINARY(MAX),
  ruta VARCHAR(100) NOT NULL,
  estado INT NOT NULL
) 


INSERT INTO Modulo VALUES ('Dashboard', 'Darhboard',NULL,'/Dashboard', 1);
INSERT INTO Modulo VALUES ('Usuarios', 'Usuarios del sistema',NULL,'/Usuarios', 1);
INSERT INTO Modulo VALUES ('Padrinos', 'Posibles padrinos de los animales',NULL,'/Padrinos', 1);
INSERT INTO Modulo VALUES ('Animales', 'Animales de la organizaci�n',NULL,'/Animales', 1);
INSERT INTO Modulo VALUES ('Adopciones', 'Procesos de adopci�n',NULL,'/Adopciones', 1);
INSERT INTO Modulo VALUES ('Donaciones', 'Donaciones de la organizaci�n',NULL,'/Donaciones', 1);
INSERT INTO Modulo VALUES ('Roles', 'Roles',NULL,'/Roles', 1);


CREATE TABLE Aplicacion (
  idAplicacion INT PRIMARY KEY IDENTITY,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(100) NOT NULL,
  correo_empresa VARCHAR(100) NOT NULL,
  correo_pedidos VARCHAR(100) NOT NULL,
  nombre_remitente VARCHAR(100) NOT NULL,
  correo_remitente VARCHAR(100) NOT NULL,
  nombre_empresa VARCHAR(100) NOT NULL,
  nombre_aplicacion VARCHAR(100) NOT NULL,
  sitio_web VARCHAR(200) NOT NULL,
  simbolo_moneda VARCHAR(10) NOT NULL,
  moneda VARCHAR(10) NOT NULL,
  divisa VARCHAR(10) NOT NULL,
  separador_decimales VARCHAR(10) NOT NULL,
  separador_miles_millones VARCHAR(10) NOT NULL,
  estado INT NOT NULL
) 



INSERT INTO Aplicacion VALUES
('Calle Siempre Viva 123, Cali, Colombia', '573125515174', 'Empresa@MatchPet.com', 'Empresa@MatchPet.com', 'MatchPet', 'Info@MatchPet.com', 'MatchPet', 'MatchPet PRI', 'Www.MatchPet.com', '$', 'COP', 'USD', ',', '.', 1);

--

--=============================================
-- Tablas Transaccionales
---============================================


CREATE TABLE Organizacion(
	idOrganizacion INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(100),
	telefono VARCHAR(100)  NULL,
	direccion VARCHAR(100)  NULL,
	estado INT NOT NULL
	--FOREIGN KEY (estado) REFERENCES Estado(idEstado)
)

INSERT INTO Organizacion VALUES ('Mundo Felino','Esta organizaci�n solo rescata gastos', '2001246', 'carrera 8 # 89 c 69 sur', 1);
INSERT INTO Organizacion VALUES ('Amigos peludos','Esta organizaci�n solo rescata animales peludos', '2114569', 'carrera 8 # 89 - 2', 1);
INSERT INTO Organizacion VALUES ('Duban Estupi�an','ESoy una persona que ayuda a los animales', '22114596', 'carrera 8 # 89 c 69 sur', 1);


CREATE TABLE Animal(
	idAnimal INT PRIMARY KEY IDENTITY,
	idOrganizacion INT NOT NULL,
	idTipoAnimal INT NOT NULL,
	nombre VARCHAR(100)NOT NULL,
	genero VARCHAR(100)NOT NULL,
	fecha_nacimiento DATE,
	estado INT NOT NULL
	
	
	FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
	FOREIGN KEY (idTipoAnimal) REFERENCES TipoAnimal(idTipoAnimal)
)

INSERT INTO Animal VALUES (1,1,'SIZU','MACHO', GETDATE() -  100, 1);
INSERT INTO Animal VALUES (1,2,'LOLA','HEMBRA', GETDATE() -  200, 1);
INSERT INTO Animal VALUES (1,3,'PACA','MACHO', GETDATE() -  500, 1);
INSERT INTO Animal VALUES (2,1,'MAX','MACHO', GETDATE() -  100, 1);
INSERT INTO Animal VALUES (2,2,'VANESSA','HEMBRA', GETDATE() -  200, 1);
INSERT INTO Animal VALUES (2,3,'ROBERTO','MACHO', GETDATE() -  500, 1);
INSERT INTO Animal VALUES (3,1,'SEUZ','MACHO', GETDATE() -  100, 1);
INSERT INTO Animal VALUES (3,2,'LULU','HEMBRA', GETDATE() -  200, 1);
INSERT INTO Animal VALUES (3,3,'ROBERTO','MACHO', GETDATE() -  500, 1);


CREATE TABLE Rol (
  idRol INT PRIMARY KEY IDENTITY,
  idOrganizacion INT,
  nombreRol VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100),
  estado INT NOT NULL

  FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion)
) 



INSERT INTO Rol VALUES(NULL, 'Administrador', 'Administrador del sistema', 1);
INSERT INTO Rol VALUES (1, 'Administrador organizaci�n', 'Administrador de la organizaci�n', 1);
INSERT INTO Rol VALUES (2, 'Administrador organizaci�n', 'Administrador de la organizaci�n', 1);
INSERT INTO Rol VALUES (3, 'Administrador organizaci�n', 'Administrador de la organizaci�n', 1);
INSERT INTO Rol VALUES(1, 'Padrino', 'Padrino de la organizaci�n', 1);
INSERT INTO Rol VALUES(2, 'Padrino', 'Padrino de la organizaci�n', 1);
INSERT INTO Rol VALUES(3, 'Padrino', 'Padrino de la organizaci�n', 1);


CREATE TABLE Permiso (
  idPermiso INT PRIMARY KEY IDENTITY,
  idRol INT NOT NULL,
  idModulo INT NOT NULL,
  idOrganizacion INT,
  r INT NOT NULL,
  w INT NOT NULL,
  u INT NOT NULL,
  d INT NOT NULL

  FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
  FOREIGN KEY (idRol) REFERENCES Rol(idRol),
  FOREIGN KEY (idModulo) REFERENCES Modulo(idModulo)
) ;


SELECT * FROM Permiso;



INSERT INTO Permiso VALUES (1,1,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (1,2,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (1,3,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (1,4,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (1,5,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (1,6,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (1,7,NULL,1,1,1,1);
INSERT INTO Permiso VALUES (2,1,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,2,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,3,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,4,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,5,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,6,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,7,1,1,1,1,1);
INSERT INTO Permiso VALUES (3,1,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,2,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,3,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,4,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,5,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,6,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,7,2,1,1,1,1);
INSERT INTO Permiso VALUES (4,1,3,1,1,1,1);
INSERT INTO Permiso VALUES (4,2,3,1,1,1,1);
INSERT INTO Permiso VALUES (4,3,3,1,1,1,1);
INSERT INTO Permiso VALUES (4,4,3,1,1,1,1);
INSERT INTO Permiso VALUES (4,5,3,1,1,1,1);
INSERT INTO Permiso VALUES (4,6,3,1,1,1,1);
INSERT INTO Permiso VALUES (4,7,3,1,1,1,1);

INSERT INTO Permiso VALUES (5,5,1,1,0,0,0);
INSERT INTO Permiso VALUES (6,5,2,1,0,0,0);
INSERT INTO Permiso VALUES (7,5,3,1,0,0,0);



CREATE TABLE Persona(
	idPersona INT PRIMARY KEY IDENTITY,
	idOrganizacion INT NOT NULL,
	idRol INT NOT NULL,
	numero_identificacion VARCHAR(20) NOT NULL,
	nombres VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	telefono INT NOT NULL,
	email VARCHAR(200) NOT NULL,
	password varchar(200)NOT NULL,
	nit VARCHAR(200),
	nombreFiscal VARCHAR(200),
	direccionFiscal VARCHAR(200),
	token VARCHAR(200),
	fecha_creacion DATE NOT NULL,
	estado INT NOT NULL

	FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
	FOREIGN KEY (idRol) REFERENCES Rol(idRol)
)



INSERT INTO Persona VALUES (1,5,'1023025848','Duban Steven', 'Estupi�an Parra', '2001478', 'destupinanp@ucentral.edu.co','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1023025848', 'Duban Steven Estupi�an Parra', 'Carrera 8 # 89 c 69 sur', '',GETDATE(),1);
INSERT INTO Persona VALUES (1,5,'1023025846','Derly Catherine', 'Vargas Tamara', '2114598', 'derly.catherine@ugmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1023025846', 'Derly Catherine Vargas Tamara', 'Carrera 9 # 89 - 69','' ,GETDATE(),1);
INSERT INTO Persona VALUES (2,6,'15623587','Juan', 'Benavidez', '5447896', 'jbenavidesm1@ucentral.edu.co','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '15623587', 'juan sebastian benavides martinez', 'Carrera 10 # 89 c 69 sur', '',GETDATE(),1);
INSERT INTO Persona VALUES (2,6,'14569875','Daniel ', 'Puentes', '2114598', 'dpuentesf1@ucentral.edu.co','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '14569875', 'daniel enrique', 'Carrera 10 # 89 - 69','' ,GETDATE(),1);
INSERT INTO Persona VALUES (3,7,'1023025848','Carlos', 'Tovar', '2665489', 'ctovar@ucentral.edu.co','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1023025848', 'Carlos Tovar', 'Carrera 4 # 89 c 69 sur', '',GETDATE(),1);
INSERT INTO Persona VALUES (3,7,'14569875','Pedro ', 'Vargas', '2114569', 'pvargas@ucentral.edu.co','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92' , '14569875', 'Pedro Vargas', 'Carrera 5 # 89 - 69','' ,GETDATE(),1);



CREATE TABLE ProcesoAdopcion(
	idProcesoAdopcion INT PRIMARY KEY IDENTITY,
	idPersona INT NOT NULL,
	idAnimal INT NOT NULL,
	idOrganizacion INT NOT NULL,
	fecha_solicitud DATE NOT NULL,
	requisitos VARCHAR(500) NOT NULL,
	estado INT NOT NULL

	FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
	FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal),
	FOREIGN KEY (idPersona) REFERENCES Persona(idPersona)
)

INSERT INTO ProcesoAdopcion VALUES (1,1,1,GETDATE(),'Debe darle aamor y purina',1);
INSERT INTO ProcesoAdopcion VALUES (3,4,2,GETDATE(),'Debe darle aamor y purina',1);

CREATE TABLE Donacion(
	idDonacion INT PRIMARY KEY IDENTITY,
	idOrganizacion INT NOT NULL,
	idTipoPago INT NOT NULL,
	referenciaCobro VARCHAR(255),
	idtransaccion INT,
	fecha DATETIME NOT NULL,
	monto BIGINT,
	estado INT NOT NULL



	FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
	FOREIGN KEY (idTipoPago) REFERENCES TipoPago(idTipoPago)

)

INSERT INTO Donacion VALUES(1,1,'Para la comida del perrito', 123654, GETDATE(), 50000,1);
INSERT INTO Donacion VALUES(2,2,'Para la comida del gato', 456789, GETDATE(), 10000,1);
INSERT INTO Donacion VALUES(3,3,'Para la comida del loro', 145697, GETDATE(), 140000,1);


CREATE TABLE Apadrinamiento(
	idApadrinamiento INT PRIMARY KEY IDENTITY,
	idOrganizacion INT NOT NULL,
	idPersona INT NOT NULL,
	idAnimal INT NOT NULL,
	fecha DATETIME NOT NULL,
	estado INT NOT NULL



	FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
	FOREIGN KEY (idPersona) REFERENCES Persona(idPersona),
	FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal)

)

INSERT INTO Apadrinamiento VALUES (1,1,1,GETDATE(),1);
INSERT INTO Apadrinamiento VALUES (2,3,4,GETDATE(),1);



--=============================================
-- Tablas sin relaciones
---============================================



CREATE TABLE Suscripcion(
	idSuscripcion INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(255),
	email VARCHAR(255),
	fecha DATETIME NOT NULL,
	estado INT NOT NULL

)


INSERT INTO Suscripcion VALUES ('Gestor Principiante','principiante@gmail.com',GETDATE(),1);
INSERT INTO Suscripcion VALUES ('Gestor Veterano','Veterano@gmail.com',GETDATE(),1);
INSERT INTO Suscripcion VALUES ('Gestor �lite ','elite@gmail.com',GETDATE(),1);
INSERT INTO Suscripcion VALUES ('Gestor Maestro ','Maestro@gmail.com',GETDATE(),1);



CREATE TABLE Contacto(
	idContacto INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	mensaje VARCHAR(255) NOT NULL,
	ip VARCHAR(255) NOT NULL,
	dispositivo VARCHAR(255) NOT NULL,
	fecha DATETIME NOT NULL,
	estado INT NOT NULL

)


CREATE TABLE Publicacion(
	idPublicacion INT PRIMARY KEY IDENTITY,
	titulo VARCHAR(255) NOT NULL,
	contenido VARCHAR(255) NOT NULL,
	portada VARCHAR(255) NOT NULL,
	ruta VARCHAR(255) NOT NULL,
	fecha DATETIME NOT NULL,
	estado INT NOT NULL

)