USE [master]
GO
/****** Object:  Database [academico]    Script Date: 13/12/2020 19:32:18 ******/
CREATE DATABASE [academico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'academico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\academico.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'academico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\academico_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [academico] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [academico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [academico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [academico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [academico] SET ARITHABORT OFF 
GO
ALTER DATABASE [academico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [academico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [academico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [academico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [academico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [academico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [academico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [academico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [academico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [academico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [academico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [academico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [academico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [academico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [academico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [academico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [academico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [academico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [academico] SET  MULTI_USER 
GO
ALTER DATABASE [academico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [academico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [academico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [academico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [academico] SET DELAYED_DURABILITY = DISABLED 
GO
USE [academico]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 13/12/2020 19:32:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Fecha_nacimiento] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 13/12/2020 19:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Id] [char](8) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 13/12/2020 19:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[IdAsignatura] [char](8) NOT NULL,
	[IdAlumno] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Fecha_nacimiento]) VALUES (1, N'DAVID', N'SOLANO PANIAGUA', N'12-02-91')
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Fecha_nacimiento]) VALUES (2, N'ELIZABETH', N'SOLANO PANIAGUA', N'22-09-98')
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Fecha_nacimiento]) VALUES (3, N'ELMAN NOEL', N'TOVAR PEREZ', N'03-08-94')
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Fecha_nacimiento]) VALUES (4, N'VIVIANA GABRIELA', N'TRUJILLO INFANTES', N'03-05-92')
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Fecha_nacimiento]) VALUES (5, N'ROXANA', N'VALER GONZALES', N'03-05-95')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-314 ', N'Auditoría Informática')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-324 ', N'Programación Multimedial')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-325 ', N'Programación Virtual')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-328 ', N'Comparación de Lenguajes')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-329 ', N'Idiomas II')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-332 ', N'Economía')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'INF-391 ', N'Simulación de Sistemas')
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-391 ', 1)
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-314 ', 1)
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-324 ', 2)
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-325 ', 3)
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-328 ', 4)
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-329 ', 4)
GO
INSERT [dbo].[Inscripcion] ([IdAsignatura], [IdAlumno]) VALUES (N'INF-332 ', 1)
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [fk_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumnos] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [fk_Alumno]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [fk_Asignatura] FOREIGN KEY([IdAsignatura])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [fk_Asignatura]
GO
USE [master]
GO
ALTER DATABASE [academico] SET  READ_WRITE 
GO
