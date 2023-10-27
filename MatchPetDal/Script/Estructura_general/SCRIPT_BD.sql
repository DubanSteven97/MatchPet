
USE [DBMatchpet]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[idAnimal] [int] IDENTITY(1,1) NOT NULL,
	[idOrganizacion] [int] NOT NULL,
	[idTipoAnimal] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[genero] [varchar](100) NOT NULL,
	[fecha_nacimiento] [date] NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAnimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apadrinamiento]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apadrinamiento](
	[idApadrinamiento] [int] IDENTITY(1,1) NOT NULL,
	[idOrganizacion] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idAnimal] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idApadrinamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aplicacion]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aplicacion](
	[idAplicacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[usuario] [varchar](100) NOT NULL,
	[clave] [varchar](100) NOT NULL,
	[estado] [int] NOT NULL,
	[token] [text] NULL,
	[creacion_token] [datetime] NULL,
	[expires_token] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aplication]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aplication](
	[idAplicacion] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](100) NOT NULL,
	[correo_empresa] [varchar](100) NOT NULL,
	[correo_pedidos] [varchar](100) NOT NULL,
	[nombre_remitente] [varchar](100) NOT NULL,
	[correo_remitente] [varchar](100) NOT NULL,
	[nombre_empresa] [varchar](100) NOT NULL,
	[nombre_aplicacion] [varchar](100) NOT NULL,
	[sitio_web] [varchar](200) NOT NULL,
	[simbolo_moneda] [varchar](10) NOT NULL,
	[moneda] [varchar](10) NOT NULL,
	[divisa] [varchar](10) NOT NULL,
	[separador_decimales] [varchar](10) NOT NULL,
	[separador_miles_millones] [varchar](10) NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[idContacto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[mensaje] [varchar](255) NOT NULL,
	[ip] [varchar](255) NOT NULL,
	[dispositivo] [varchar](255) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donacion]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donacion](
	[idDonacion] [int] IDENTITY(1,1) NOT NULL,
	[idOrganizacion] [int] NOT NULL,
	[idTipoPago] [int] NOT NULL,
	[referenciaCobro] [varchar](255) NULL,
	[idtransaccion] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [bigint] NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDonacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulo](
	[idModulo] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[icono] [varchar](250) NULL,
	[ruta] [varchar](100) NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizacion]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizacion](
	[idOrganizacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[telefono] [varchar](100) NULL,
	[direccion] [varchar](100) NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrganizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[idPermiso] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NOT NULL,
	[idModulo] [int] NOT NULL,
	[r] [int] NOT NULL,
	[w] [int] NOT NULL,
	[u] [int] NOT NULL,
	[d] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[idOrganizacion] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[numero_identificacion] [varchar](20) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](200) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[nit] [varchar](200) NULL,
	[nombreFiscal] [varchar](200) NULL,
	[direccionFiscal] [varchar](200) NULL,
	[token] [varchar](200) NULL,
	[estado] [int] NOT NULL,
	[fecha_creacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcesoAdopcion]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcesoAdopcion](
	[idProcesoAdopcion] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idAnimal] [int] NOT NULL,
	[idOrganizacion] [int] NOT NULL,
	[fecha_solicitud] [date] NOT NULL,
	[requisitos] [varchar](500) NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProcesoAdopcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[idPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](255) NOT NULL,
	[contenido] [varchar](255) NOT NULL,
	[portada] [varchar](255) NOT NULL,
	[ruta] [varchar](255) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[idOrganizacion] [int] NULL,
	[nombreRol] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suscripcion]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suscripcion](
	[idSuscripcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSuscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAnimal]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAnimal](
	[idTipoAnimal] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoAnimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[tipoPago] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (1, 1, 1, N'SIZU', N'MACHO', CAST(N'2023-07-14' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (2, 1, 2, N'LOLA', N'HEMBRA', CAST(N'2023-04-05' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (3, 1, 3, N'PACA', N'MACHO', CAST(N'2022-06-09' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (4, 2, 1, N'MAX', N'MACHO', CAST(N'2023-07-14' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (5, 2, 2, N'VANESSA', N'HEMBRA', CAST(N'2023-04-05' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (6, 2, 3, N'ROBERTO', N'MACHO', CAST(N'2022-06-09' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (7, 3, 1, N'SEUZ', N'MACHO', CAST(N'2023-07-14' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (8, 3, 2, N'LULU', N'HEMBRA', CAST(N'2023-04-05' AS Date), 1)
GO
INSERT [dbo].[Animal] ([idAnimal], [idOrganizacion], [idTipoAnimal], [nombre], [genero], [fecha_nacimiento], [estado]) VALUES (9, 3, 3, N'ROBERTO', N'MACHO', CAST(N'2022-06-09' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Apadrinamiento] ON 
GO
INSERT [dbo].[Apadrinamiento] ([idApadrinamiento], [idOrganizacion], [idPersona], [idAnimal], [fecha], [estado]) VALUES (1, 1, 1, 1, CAST(N'2023-10-22T00:33:17.290' AS DateTime), 1)
GO
INSERT [dbo].[Apadrinamiento] ([idApadrinamiento], [idOrganizacion], [idPersona], [idAnimal], [fecha], [estado]) VALUES (2, 2, 3, 4, CAST(N'2023-10-22T00:33:17.290' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Apadrinamiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Aplicacion] ON 
GO
INSERT [dbo].[Aplicacion] ([idAplicacion], [nombre], [descripcion], [usuario], [clave], [estado], [token], [creacion_token], [expires_token]) VALUES (1, N'MatchpetWeb', N'Aplicacion habitual', N'webmatchpet', N'654321', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Aplicacion] ([idAplicacion], [nombre], [descripcion], [usuario], [clave], [estado], [token], [creacion_token], [expires_token]) VALUES (2, N'MatchpetAPP', N'Aplicación nueva realizada en android', N'appmatchpet', N'123456', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Aplicacion] ([idAplicacion], [nombre], [descripcion], [usuario], [clave], [estado], [token], [creacion_token], [expires_token]) VALUES (3, N'MatchpetDEV', N'Aplicaicón para desarrollar, probar', N'devmatchpet', N'147852', 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJCYXNlV2ViQXBpIiwianRpIjoiZWJmOTk2YTgtNzk1YS00YWM1LWJlODAtZjNjMTIzMWZjNTgyIiwiaWF0IjoiMjcvMTAvMjAyMyA3OjQ1OjMxIHAuwqBtLiIsImlkIjoiTWF0Y2hwZXRERVYiLCJleHAiOjE2OTg0MzYyMzEsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcxNzYvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3Ni8ifQ.GqHezSQQ1y92-OZhVBjD4Ji0TNLLPS2R3KFPA5aLQFw', CAST(N'2023-10-27T14:45:32.150' AS DateTime), CAST(N'2023-10-27T14:50:31.827' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Aplicacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Aplication] ON 
GO
INSERT [dbo].[Aplication] ([idAplicacion], [direccion], [telefono], [correo_empresa], [correo_pedidos], [nombre_remitente], [correo_remitente], [nombre_empresa], [nombre_aplicacion], [sitio_web], [simbolo_moneda], [moneda], [divisa], [separador_decimales], [separador_miles_millones], [estado]) VALUES (1, N'Calle Siempre Viva 123, Cali, Colombia', N'573125515174', N'Empresa@MatchPet.com', N'Empresa@MatchPet.com', N'MatchPet', N'Info@MatchPet.com', N'MatchPet', N'MatchPet', N'Www.MatchPet.com', N'$', N'COP', N'USD', N',', N'.', 1)
GO
SET IDENTITY_INSERT [dbo].[Aplication] OFF
GO
SET IDENTITY_INSERT [dbo].[Donacion] ON 
GO
INSERT [dbo].[Donacion] ([idDonacion], [idOrganizacion], [idTipoPago], [referenciaCobro], [idtransaccion], [fecha], [monto], [estado]) VALUES (1, 1, 1, N'Para la comida del perrito', 123654, CAST(N'2023-10-22T00:33:17.283' AS DateTime), 50000, 1)
GO
INSERT [dbo].[Donacion] ([idDonacion], [idOrganizacion], [idTipoPago], [referenciaCobro], [idtransaccion], [fecha], [monto], [estado]) VALUES (2, 2, 2, N'Para la comida del gato', 456789, CAST(N'2023-10-22T00:33:17.283' AS DateTime), 10000, 1)
GO
INSERT [dbo].[Donacion] ([idDonacion], [idOrganizacion], [idTipoPago], [referenciaCobro], [idtransaccion], [fecha], [monto], [estado]) VALUES (3, 3, 3, N'Para la comida del loro', 145697, CAST(N'2023-10-22T00:33:17.287' AS DateTime), 140000, 1)
GO
SET IDENTITY_INSERT [dbo].[Donacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 
GO
INSERT [dbo].[Estado] ([idEstado], [nombre]) VALUES (1, N'Activo')
GO
INSERT [dbo].[Estado] ([idEstado], [nombre]) VALUES (2, N'Inactivo')
GO
INSERT [dbo].[Estado] ([idEstado], [nombre]) VALUES (3, N'Borrado')
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Modulo] ON 
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (1, N'Dashboard', N'Darhboard', N'app-menu__icon fa fa-dashboard', N'Dashboard', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (2, N'Modulos', N'Módulos administrativos del sistema', N'app-menu__icon fa-solid fa-boxes-stacked', N'Modulos', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (3, N'Roles', N'Roles del sistema', N'app-menu__icon Icon fa fa-key', N'Roles', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (4, N'Usuarios', N'Usuarios del sistemas', N'app-menu__icon icon fa fa-users', N'Usuarios', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (5, N'Padrinos', N'Posibles Padrinos De Los Animales', N'app-menu__icon fa-solid fa-people-arrows', N'Padrinos', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (6, N'Animales', N'Animales De La Organización', N'app-menu__icon fa-solid fa-paw', N'Animales', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (7, N'Adopciones', N'Procesos De Adopción', N'app-menu__icon fa-solid fa-microchip', N'Adopciones', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (8, N'Donaciones', N'Donaciones De La Organización', N'app-menu__icon fa-solid fa-hand-holding-heart', N'Donaciones', 1)
GO
INSERT [dbo].[Modulo] ([idModulo], [titulo], [descripcion], [icono], [ruta], [estado]) VALUES (9, N'Paginas', N'Administración De Páginas Del Sitio Web -', N'app-menu__icon fas fa-file-alt', N'Paginas', 1)
GO
SET IDENTITY_INSERT [dbo].[Modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Organizacion] ON 
GO
INSERT [dbo].[Organizacion] ([idOrganizacion], [nombre], [descripcion], [telefono], [direccion], [estado]) VALUES (1, N'Mundo Felino', N'Esta organizaci?n solo rescata gastos', N'2001246', N'carrera 8 # 89 c 69 sur', 1)
GO
INSERT [dbo].[Organizacion] ([idOrganizacion], [nombre], [descripcion], [telefono], [direccion], [estado]) VALUES (2, N'Amigos peludos', N'Esta organizaci?n solo rescata animales peludos', N'2114569', N'carrera 8 # 89 - 2', 1)
GO
INSERT [dbo].[Organizacion] ([idOrganizacion], [nombre], [descripcion], [telefono], [direccion], [estado]) VALUES (3, N'Duban Estupi?an', N'ESoy una persona que ayuda a los animales', N'22114596', N'carrera 8 # 89 c 69 sur', 1)
GO
SET IDENTITY_INSERT [dbo].[Organizacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Permiso] ON 
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (8, 2, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (9, 2, 2, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (10, 2, 3, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (11, 2, 4, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (12, 2, 5, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (13, 2, 6, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (14, 2, 7, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (15, 3, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (16, 3, 2, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (17, 3, 3, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (18, 3, 4, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (19, 3, 5, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (20, 3, 6, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (21, 3, 7, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (62, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (63, 1, 2, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (64, 1, 3, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (65, 1, 4, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (66, 1, 5, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (67, 1, 6, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (68, 1, 7, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (69, 1, 8, 1, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([idPermiso], [idRol], [idModulo], [r], [w], [u], [d]) VALUES (70, 1, 9, 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Permiso] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (1, 1, 1, N'1023025848', N'Duban Steven', N'Estupi?an Parra', 2001478, N'admin@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'1023025848', N'Duban Steven Estupi?an Parra', N'Carrera 8 # 89 c 69 sur', N'', 1, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (2, 1, 5, N'1023025846', N'Derly Catherine', N'Vargas Tamara', 2114598, N'derly.catherine@ugmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'1023025846', N'Derly Catherine Vargas Tamara', N'Carrera 9 # 89 - 69', N'', 0, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (3, 2, 5, N'15623587', N'Juan', N'Benavides', 5447896, N'jbenavidesm1@ucentral.edu.co', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'15623587', N'juan sebastian benavides martinez', N'Carrera 10 # 89 c 69 sur', N'', 1, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (4, 2, 5, N'14569875', N'Daniel', N'Puentes Actualizado', 5478956, N'dpuentesf1@ucentral.edu.co', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'14569875', N'daniel enrique', N'Carrera 10 # 89 - 69', N'', 0, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (5, 3, 7, N'1014798463', N'Carlos', N'Tovar', 57489, N'ctovar@ucentral.edu.co', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'1023025848', N'Carlos Tovar', N'Carrera 4 # 89 c 69 sur', N'', 1, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (6, 3, 7, N'10234', N'Pedro ', N'Vargas', 9517899, N'pvargas@ucentral.edu.co', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'14569875', N'Pedro Vargas', N'Carrera 5 # 89 - 69', N'', 0, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (11, 1, 1, N'1023547', N'Yenny', N'Parra', 2001246, N'duban@gmail.com', N'52f1476494897c64f417deb7ef7cd690f1cea9edce638746c420f1240d3d39dc', NULL, NULL, NULL, NULL, 0, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (12, 1, 1, N'1524789', N'Yenny', N'Parra', 2001246, N'prueba_1@gmail.com', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', NULL, NULL, NULL, NULL, 0, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (13, 2, 1, N'1257891', N'Prueba', N'Duban', 2001245, N'prueba@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 1, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (14, 2, 1, N'456789', N'Daniel', N'Fernandez', 2001246, N'daniel@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 0, CAST(N'2023-10-22' AS Date))
GO
INSERT [dbo].[Persona] ([idPersona], [idOrganizacion], [idRol], [numero_identificacion], [nombres], [apellidos], [telefono], [email], [password], [nit], [nombreFiscal], [direccionFiscal], [token], [estado], [fecha_creacion]) VALUES (15, 1, 1, N'8475147', N'QA', N'QA', 2001246, N'qa@gmail.com', N'9387dad42b0069f8946fe26d2c9b4d7ac7a14a3f443317384afae30198a10bda', NULL, NULL, NULL, NULL, 0, CAST(N'2023-10-22' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcesoAdopcion] ON 
GO
INSERT [dbo].[ProcesoAdopcion] ([idProcesoAdopcion], [idPersona], [idAnimal], [idOrganizacion], [fecha_solicitud], [requisitos], [estado]) VALUES (1, 1, 1, 1, CAST(N'2023-10-22' AS Date), N'Debe darle aamor y purina', 1)
GO
INSERT [dbo].[ProcesoAdopcion] ([idProcesoAdopcion], [idPersona], [idAnimal], [idOrganizacion], [fecha_solicitud], [requisitos], [estado]) VALUES (2, 3, 4, 2, CAST(N'2023-10-22' AS Date), N'Debe darle aamor y purina', 1)
GO
SET IDENTITY_INSERT [dbo].[ProcesoAdopcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (1, 1, N'Administrador', N'Administrador del sistema actualizo', 1)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (2, 1, N'Administrador organizaci?n', N'Administrador de la organizaci?n', 0)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (3, 2, N'Administrador organizaci?n', N'Administrador de la organizaci?n', 0)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (4, 3, N'Administrador organizaci?n', N'Administrador de la organizaci?n', 0)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (5, 1, N'Padrino', N'Padrino de la organizaci?n', 1)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (6, 2, N'Padrino', N'Padrino de la organizaci?n', 1)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (7, 3, N'Padrino', N'Padrino de la organizaci?n', 1)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (8, 1, N'Prueba', N'Duban', 0)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (9, 1, N'Prueba 2', N'sddfjlksjdfl', 0)
GO
INSERT [dbo].[Rol] ([idRol], [idOrganizacion], [nombreRol], [descripcion], [estado]) VALUES (10, 1, N'Prueba 3', N'asdasd', 0)
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Suscripcion] ON 
GO
INSERT [dbo].[Suscripcion] ([idSuscripcion], [nombre], [email], [fecha], [estado]) VALUES (1, N'Gestor Principiante', N'principiante@gmail.com', CAST(N'2023-10-22T00:33:17.297' AS DateTime), 1)
GO
INSERT [dbo].[Suscripcion] ([idSuscripcion], [nombre], [email], [fecha], [estado]) VALUES (2, N'Gestor Veterano', N'Veterano@gmail.com', CAST(N'2023-10-22T00:33:17.297' AS DateTime), 1)
GO
INSERT [dbo].[Suscripcion] ([idSuscripcion], [nombre], [email], [fecha], [estado]) VALUES (3, N'Gestor ?lite ', N'elite@gmail.com', CAST(N'2023-10-22T00:33:17.297' AS DateTime), 1)
GO
INSERT [dbo].[Suscripcion] ([idSuscripcion], [nombre], [email], [fecha], [estado]) VALUES (4, N'Gestor Maestro ', N'Maestro@gmail.com', CAST(N'2023-10-22T00:33:17.297' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Suscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoAnimal] ON 
GO
INSERT [dbo].[TipoAnimal] ([idTipoAnimal], [nombre], [estado]) VALUES (1, N'Perros', 1)
GO
INSERT [dbo].[TipoAnimal] ([idTipoAnimal], [nombre], [estado]) VALUES (2, N'Gatos', 1)
GO
INSERT [dbo].[TipoAnimal] ([idTipoAnimal], [nombre], [estado]) VALUES (3, N'Aves', 1)
GO
SET IDENTITY_INSERT [dbo].[TipoAnimal] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoPago] ON 
GO
INSERT [dbo].[TipoPago] ([idTipoPago], [tipoPago], [descripcion], [estado]) VALUES (1, N'Efectivo', N'Se registran pagos en efectivo', 1)
GO
INSERT [dbo].[TipoPago] ([idTipoPago], [tipoPago], [descripcion], [estado]) VALUES (2, N'Nequi', N'Donaciones hechas por nequi', 1)
GO
INSERT [dbo].[TipoPago] ([idTipoPago], [tipoPago], [descripcion], [estado]) VALUES (3, N'DaviPlata', N'Donaciones echas por Daviplata', 1)
GO
SET IDENTITY_INSERT [dbo].[TipoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombres], [apellidos], [estado]) VALUES (1, N'Duban', N'Estupinan', 1)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombres], [apellidos], [estado]) VALUES (2, N'Juan', N'Benavides', 1)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombres], [apellidos], [estado]) VALUES (3, N'Daniel', N'Puentes', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizacion] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD FOREIGN KEY([idTipoAnimal])
REFERENCES [dbo].[TipoAnimal] ([idTipoAnimal])
GO
ALTER TABLE [dbo].[Apadrinamiento]  WITH CHECK ADD FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([idAnimal])
GO
ALTER TABLE [dbo].[Apadrinamiento]  WITH CHECK ADD FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizacion] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Apadrinamiento]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Donacion]  WITH CHECK ADD FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizacion] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Donacion]  WITH CHECK ADD FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD FOREIGN KEY([idModulo])
REFERENCES [dbo].[Modulo] ([idModulo])
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizacion] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[ProcesoAdopcion]  WITH CHECK ADD FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([idAnimal])
GO
ALTER TABLE [dbo].[ProcesoAdopcion]  WITH CHECK ADD FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizacion] ([idOrganizacion])
GO
ALTER TABLE [dbo].[ProcesoAdopcion]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Rol]  WITH CHECK ADD FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizacion] ([idOrganizacion])
GO
/****** Object:  StoredProcedure [dbo].[spGetAnimales]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Juan Benavides>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de Animales>
-- Consulta de animales activos (por defecto)
-- =============================================

CREATE   PROCEDURE [dbo].[spGetAnimales]
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	a.idAnimal,
			o.Nombre as organizacion,
			ta.nombre as tipoAnimal,
			a.nombre,
			a.genero,
			a.fecha_nacimiento,
			a.estado
	FROM	dbo.Animal a,
			dbo.TipoAnimal ta,
			dbo.Organizacion o
	WHERE	a.idTipoAnimal = ta.idTipoAnimal
	AND		a.idOrganizacion = o.idOrganizacion
	AND		a.estado = 1 
	
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetModulos]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Juan Benavides>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de Animales>
-- Consulta de animales activos (por defecto)
-- =============================================

CREATE   PROCEDURE [dbo].[spGetModulos]
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT m.idmodulo, m.titulo, m.descripcion, m.icono, m.ruta, m.estado FROM modulo m WHERE m.estado != 0
	
END;
GO
/****** Object:  StoredProcedure [dbo].[spSetTokenApp]    Script Date: 27/10/2023 3:49:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Juan Benavides>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de Animales>
-- Consulta de animales activos (por defecto)
-- =============================================

CREATE   PROCEDURE [dbo].[spSetTokenApp]

	@p_idAplicacion INT,
	@p_token TEXT,
	@p_expire DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE aplicacion
	SET token = @p_token,
	creacion_token = GETDATE(),
	expires_token = @p_expire
	WHERE	idAplicacion = @p_idAplicacion;

	return @@ROWCOUNT;
	
END;
GO
USE [master]
GO
ALTER DATABASE [DBMatchpet] SET  READ_WRITE 
GO
