-- =============================================
-- Author:		<Duban Steven Estupiñan Parra>
-- Create date: <20-Sept-2023>
-- Description:	<Se crea script para la creación
-- de la base de datos>
-- =============================================

DROP DATABASE DBMatchpet;

CREATE DATABASE DBMatchpet;

USE DBMatchpet;

CREATE TABLE TipoAnimal(
	idTipoAnimal INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(20) NOT NULL,
	estado INT NOT NULL
)

INSERT INTO TipoAnimal Values ('Perros',1);
INSERT INTO TipoAnimal Values ('Gatos',1);
INSERT INTO TipoAnimal Values ('Aves',1);


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
  icono VARCHAR(250),
  ruta VARCHAR(100) NOT NULL,
  estado INT NOT NULL
) 




INSERT INTO Modulo VALUES ('Dashboard', 'Darhboard','<i class=\"app-menu__icon fa fa-dashboard\"></i>','Dashboard', 1);
INSERT INTO Modulo VALUES ('Modulos', 'Módulos administrativos del sistema', '<i class=\"app-menu__icon fa-solid fa-boxes-stacked\"></i>','Modulos', 1);
INSERT INTO Modulo VALUES ('Roles', 'Roles', '<i Class=\"app-menu__icon Icon fa fa-key\" Aria-hidden=\"true\"></i>', 'Roles', 1);
INSERT INTO Modulo VALUES ('Usuarios', 'Usuarios del sistema', '<i class=\"app-menu__icon icon fa fa-users\"></i>', 'Usuarios', 1);
INSERT INTO Modulo VALUES ('Padrinos', 'Posibles padrinos de los animales',NULL,'Padrinos', 1);
INSERT INTO Modulo VALUES ('Animales', 'Animales de la organización',NULL,'Animales', 1);
INSERT INTO Modulo VALUES ('Adopciones', 'Procesos de adopción',NULL,'Adopciones', 1);
INSERT INTO Modulo VALUES ('Donaciones', 'Donaciones de la organización',NULL,'Donaciones', 1);





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

INSERT INTO Organizacion VALUES ('Mundo Felino','Esta organización solo rescata gastos', '2001246', 'carrera 8 # 89 c 69 sur', 1);
INSERT INTO Organizacion VALUES ('Amigos peludos','Esta organización solo rescata animales peludos', '2114569', 'carrera 8 # 89 - 2', 1);
INSERT INTO Organizacion VALUES ('Duban Estupiñan','ESoy una persona que ayuda a los animales', '22114596', 'carrera 8 # 89 c 69 sur', 1);


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
  nombreRol VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100),
  estado INT NOT NULL

) 


INSERT INTO Rol VALUES ('Administrador', 'Administrador del sistema', 1);
INSERT INTO Rol VALUES ('Administrador organización', 'Administrador de la organización', 1);
INSERT INTO Rol VALUES ('Usuario', 'Usuario que tendrá transacciones en la organización', 1);


CREATE TABLE Permiso (
  idPermiso INT PRIMARY KEY IDENTITY,
  idRol INT NOT NULL,
  idModulo INT NOT NULL,
  r INT NOT NULL,
  w INT NOT NULL,
  u INT NOT NULL,
  d INT NOT NULL

  FOREIGN KEY (idRol) REFERENCES Rol(idRol),
  FOREIGN KEY (idModulo) REFERENCES Modulo(idModulo)
) ;




INSERT INTO Permiso VALUES (1,1,1,1,1,1);
INSERT INTO Permiso VALUES (1,2,1,1,1,1);
INSERT INTO Permiso VALUES (1,3,1,1,1,1);
INSERT INTO Permiso VALUES (1,4,1,1,1,1);
INSERT INTO Permiso VALUES (1,5,1,1,1,1);
INSERT INTO Permiso VALUES (1,6,1,1,1,1);
INSERT INTO Permiso VALUES (1,7,1,1,1,1);
INSERT INTO Permiso VALUES (2,1,1,1,1,1);
INSERT INTO Permiso VALUES (2,2,1,1,1,1);
INSERT INTO Permiso VALUES (2,3,1,1,1,1);
INSERT INTO Permiso VALUES (2,4,1,1,1,1);
INSERT INTO Permiso VALUES (2,5,1,1,1,1);
INSERT INTO Permiso VALUES (2,6,1,1,1,1);
INSERT INTO Permiso VALUES (2,7,1,1,1,1);
INSERT INTO Permiso VALUES (3,1,1,1,1,1);
INSERT INTO Permiso VALUES (3,2,1,1,1,1);
INSERT INTO Permiso VALUES (3,3,1,1,1,1);
INSERT INTO Permiso VALUES (3,4,1,1,1,1);
INSERT INTO Permiso VALUES (3,5,1,1,1,1);
INSERT INTO Permiso VALUES (3,6,1,1,1,1);
INSERT INTO Permiso VALUES (3,7,1,1,1,1);



CREATE TABLE Persona(
	idPersona INT PRIMARY KEY IDENTITY,
	idOrganizacion INT,
	idRol INT NOT NULL,
	numero_identificacion VARCHAR(20) NOT NULL,
	nombres VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	telefono INT NOT NULL,
	email VARCHAR(200) NOT NULL,
	nit VARCHAR(200),
	nombreFiscal VARCHAR(200),
	direccionFiscal VARCHAR(200),
	token VARCHAR(200),
	fecha_creacion DATE NOT NULL,
	estado INT NOT NULL

	FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion),
	FOREIGN KEY (idRol) REFERENCES Rol(idRol)
)



INSERT INTO Persona VALUES (NULL,1,'1023025848','Duban Steven', 'Estupiñan Parra', '2001478', 'destupinanp@ucentral.edu.co', '1023025848', 'Duban Steven Estupiñan Parra', 'Carrera 8 # 89 c 69 sur', '',GETDATE(),1);
INSERT INTO Persona VALUES (1,3,'1023025846','Derly Catherine', 'Vargas Tamara', '2114598', 'derly.catherine@ugmail.com', '1023025846', 'Derly Catherine Vargas Tamara', 'Carrera 9 # 89 - 69','' ,GETDATE(),1);
INSERT INTO Persona VALUES (2,2,'15623587','Juan', 'Benavides', '5447896', 'jbenavidesm1@ucentral.edu.co', '15623587', 'juan sebastian benavides martinez', 'Carrera 10 # 89 c 69 sur', '',GETDATE(),1);
INSERT INTO Persona VALUES (2,3,'14569875','Daniel ', 'Puentes', '2114598', 'dpuentesf1@ucentral.edu.co', '14569875', 'daniel enrique', 'Carrera 10 # 89 - 69','' ,GETDATE(),1);
INSERT INTO Persona VALUES (3,1,'1023025848','Carlos', 'Tovar', '2665489', 'ctovar@ucentral.edu.co', '1023025848', 'Carlos Tovar', 'Carrera 4 # 89 c 69 sur', '',GETDATE(),1);
INSERT INTO Persona VALUES (3,3,'14569875','Pedro ', 'Vargas', '2114569', 'pvargas@ucentral.edu.co', '14569875', 'Pedro Vargas', 'Carrera 5 # 89 - 69','' ,GETDATE(),1);



CREATE TABLE Aplicacion(
	idAplicacion INT PRIMARY KEY IDENTITY,
	nombre VARCHAR (50) NOT NULL,
	descripcion VARCHAR(100),
	usuario VARCHAR(100) NOT NULL,
	clave VARCHAR(100) NOT NULL,
	estado INT NOT NULL,
	token TEXT,
	creacion_token DATETIME,
	expires_token DATETIME
)

INSERT INTO Aplicacion Values 
('MatchpetWeb', 'Aplicacion habitual', 'webmatchpet','654321',1, null, NULL, NULL),
('MatchpetAPP', 'Aplicación nueva realizada en android','appmatchpet','123456',1, null, NULL, NULL),
('MatchpetDEV', 'Aplicaicón para desarrollar, probar','devmatchpet','147852',1, null, NULL, NULL);




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
INSERT INTO Suscripcion VALUES ('Gestor Élite ','elite@gmail.com',GETDATE(),1);
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