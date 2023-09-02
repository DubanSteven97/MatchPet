'*Server=localhost;Database=master;Trusted_Connection=True;*'

Scaffold-DbContext "Server=(local); DataBase=DBMatchpet; Trusted_Connection=True; TrustServerCertificate=True;" Microsoft.EntityFrameworkCore.SqlServer -OutPutDir Models

Update-DataBase -Context NombreContexto


CREATE DATABASE DBMatchpet;

USE DBMatchpet;

drop table Organizacion;

create table Organizacion(
idOrganizacion int primary key identity,
nombre varchar(50),
activo bit not null,
borrado bit not null 
)

create table Usuario(
idUsuario int primary key identity,
nombres varchar(50),
apellidos varchar(50),
activo bit not null,
borrado bit not null 
)

insert into Organizacion values ('Sebastian',1,0);
select * from Organizacion;