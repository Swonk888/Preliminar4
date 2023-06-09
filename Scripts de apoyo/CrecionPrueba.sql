USE [master]
GO
/****** Object:  Database [caso3]    Script Date: 5/9/2023 8:23:43 PM ******/
CREATE DATABASE [caso3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'caso3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\caso3.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'caso3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\caso3_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [caso3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [caso3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [caso3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [caso3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [caso3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [caso3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [caso3] SET ARITHABORT OFF 
GO
ALTER DATABASE [caso3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [caso3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [caso3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [caso3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [caso3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [caso3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [caso3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [caso3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [caso3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [caso3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [caso3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [caso3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [caso3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [caso3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [caso3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [caso3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [caso3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [caso3] SET RECOVERY FULL 
GO
ALTER DATABASE [caso3] SET  MULTI_USER 
GO
ALTER DATABASE [caso3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [caso3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [caso3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [caso3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [caso3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [caso3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'caso3', N'ON'
GO
ALTER DATABASE [caso3] SET QUERY_STORE = ON
GO
ALTER DATABASE [caso3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [caso3]
GO
/****** Object:  Schema [caso3]    Script Date: 5/9/2023 8:23:43 PM ******/
CREATE SCHEMA [caso3]
GO
/****** Object:  UserDefinedTableType [dbo].[ProductosProducidos]    Script Date: 5/9/2023 8:23:43 PM ******/
CREATE TYPE [dbo].[ProductosProducidos] AS TABLE(
	[producto_mat_id] [smallint] NULL,
	[cantidad] [int] NULL,
	[posttime] [datetime] NULL,
	[computer] [varchar](20) NULL,
	[user] [varchar](20) NULL,
	[producto_id] [smallint] NULL
)
GO
/****** Object:  Table [dbo].[contrato]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato](
	[contrato_id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[recolector_id] [smallint] NULL,
	[ubicacion_id] [smallint] NOT NULL,
 CONSTRAINT [PK_contrato] PRIMARY KEY CLUSTERED 
(
	[contrato_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desecho_movimientos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desecho_movimientos](
	[posttime] [datetime] NOT NULL,
	[responsible_name] [varchar](20) NOT NULL,
	[signImage] [varbinary](50) NULL,
	[ubicacion_id] [smallint] NOT NULL,
	[recolector_id] [smallint] NULL,
	[productor_id] [smallint] NULL,
	[ev_id] [int] NULL,
	[tipomov_id] [smallint] NOT NULL,
	[tiporec_id] [smallint] NOT NULL,
	[reci_desecho_cantidad] [decimal](10, 2) NOT NULL,
	[user_id] [smallint] NOT NULL,
	[chacksum] [varbinary](50) NULL,
	[computer] [varchar](20) NOT NULL,
	[user] [varchar](20) NOT NULL,
	[w_mov_id] [smallint] IDENTITY(1,1) NOT NULL,
	[proceso_id] [smallint] NOT NULL,
 CONSTRAINT [PK_desecho_movimientos] PRIMARY KEY CLUSTERED 
(
	[w_mov_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[pais_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[estado_id] [smallint] NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[pais_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proceso]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proceso](
	[proceso_id] [smallint] IDENTITY(1,1) NOT NULL,
	[volumen] [decimal](8, 2) NOT NULL,
	[clasificacion] [bit] NOT NULL,
	[ev_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[costo] [decimal](10, 2) NOT NULL,
	[contrato_id] [smallint] NOT NULL,
 CONSTRAINT [PK_proceso] PRIMARY KEY CLUSTERED 
(
	[proceso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productores_residuos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productores_residuos](
	[productor_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[horario] [time](7) NOT NULL,
	[donacion_id] [smallint] NULL,
	[porcentaje_carbon] [decimal](12, 3) NOT NULL,
	[balance] [decimal](10, 2) NOT NULL,
	[ubicaicon_id] [smallint] NOT NULL,
	[contacto_id] [int] NOT NULL,
 CONSTRAINT [PK_productores_residuos] PRIMARY KEY CLUSTERED 
(
	[productor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicaciones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicaciones](
	[ubicacion_id] [smallint] IDENTITY(1,1) NOT NULL,
	[pais_id] [smallint] NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ubicaciones_1] PRIMARY KEY CLUSTERED 
(
	[ubicacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista] AS
SELECT dbo.contrato.descripcion, dbo.proceso.proceso_id, dbo.proceso.clasificacion, dbo.desecho_movimientos.posttime, dbo.desecho_movimientos.responsible_name, dbo.desecho_movimientos.reci_desecho_cantidad, 
                  dbo.ubicaciones.descripcion AS Expr1, dbo.paises.nombre, dbo.productores_residuos.nombre AS Expr2, dbo.productores_residuos.porcentaje_carbon, dbo.productores_residuos.balance
FROM     dbo.contrato INNER JOIN
                  dbo.proceso ON dbo.contrato.contrato_id = dbo.proceso.contrato_id INNER JOIN
                  dbo.desecho_movimientos ON dbo.proceso.proceso_id = dbo.desecho_movimientos.proceso_id INNER JOIN
                  dbo.ubicaciones ON dbo.contrato.ubicacion_id = dbo.ubicaciones.ubicacion_id AND dbo.desecho_movimientos.ubicacion_id = dbo.ubicaciones.ubicacion_id INNER JOIN
                  dbo.paises ON dbo.ubicaciones.pais_id = dbo.paises.pais_id INNER JOIN
                  dbo.productores_residuos ON dbo.desecho_movimientos.productor_id = dbo.productores_residuos.productor_id AND dbo.ubicaciones.ubicacion_id = dbo.productores_residuos.ubicaicon_id
				  Where dbo.contrato.contrato_id < 12
GO
/****** Object:  View [dbo].[dinamico]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[dinamico] AS SELECT TOP 100 PERCENT dbo.contrato.descripcion, dbo.proceso.proceso_id, dbo.proceso.clasificacion, dbo.desecho_movimientos.posttime, dbo.desecho_movimientos.responsible_name, dbo.desecho_movimientos.reci_desecho_cantidad, dbo.ubicaciones.descripcion AS Expr1, dbo.paises.nombre, dbo.productores_residuos.nombre AS Expr2, dbo.productores_residuos.porcentaje_carbon, dbo.productores_residuos.balanceFROM dbo.contratoINNER JOIN dbo.proceso ON dbo.contrato.contrato_id = dbo.proceso.contrato_idINNER JOIN dbo.desecho_movimientos ON dbo.proceso.proceso_id = dbo.desecho_movimientos.proceso_idINNER JOIN dbo.ubicaciones ON dbo.contrato.ubicacion_id = dbo.ubicaciones.ubicacion_id AND dbo.desecho_movimientos.ubicacion_id = dbo.ubicaciones.ubicacion_idINNER JOIN dbo.paises ON dbo.ubicaciones.pais_id = dbo.paises.pais_idINNER JOIN dbo.productores_residuos ON dbo.desecho_movimientos.productor_id = dbo.productores_residuos.productor_id AND dbo.ubicaciones.ubicacion_id = dbo.productores_residuos.ubicaicon_idWHERE dbo.contrato.contrato_id < 12ORDER BY dbo.productores_residuos.balance
GO
/****** Object:  View [dbo].[indexado]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Indexed View
CREATE VIEW [dbo].[indexado]
WITH SCHEMABINDING
AS
    SELECT dbo.contrato.descripcion, dbo.proceso.proceso_id, dbo.proceso.clasificacion, dbo.desecho_movimientos.posttime, dbo.desecho_movimientos.responsible_name, dbo.desecho_movimientos.reci_desecho_cantidad, 
                  dbo.ubicaciones.descripcion AS Expr1, dbo.paises.nombre, dbo.productores_residuos.nombre AS Expr2, dbo.productores_residuos.porcentaje_carbon, dbo.productores_residuos.balance
    FROM     dbo.contrato INNER JOIN
                  dbo.proceso ON dbo.contrato.contrato_id = dbo.proceso.contrato_id INNER JOIN
                  dbo.desecho_movimientos ON dbo.proceso.proceso_id = dbo.desecho_movimientos.proceso_id INNER JOIN
                  dbo.ubicaciones ON dbo.contrato.ubicacion_id = dbo.ubicaciones.ubicacion_id AND dbo.desecho_movimientos.ubicacion_id = dbo.ubicaciones.ubicacion_id INNER JOIN
                  dbo.paises ON dbo.ubicaciones.pais_id = dbo.paises.pais_id INNER JOIN
                  dbo.productores_residuos ON dbo.desecho_movimientos.productor_id = dbo.productores_residuos.productor_id AND dbo.ubicaciones.ubicacion_id = dbo.productores_residuos.ubicaicon_id
    WHERE dbo.contrato.contrato_id < 12

GO
/****** Object:  Table [caso3].[flyway_schema_history]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [caso3].[flyway_schema_history](
	[installed_rank] [int] NOT NULL,
	[version] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
	[type] [nvarchar](20) NOT NULL,
	[script] [nvarchar](1000) NOT NULL,
	[checksum] [int] NULL,
	[installed_by] [nvarchar](100) NOT NULL,
	[installed_on] [datetime] NOT NULL,
	[execution_time] [int] NOT NULL,
	[success] [bit] NOT NULL,
 CONSTRAINT [flyway_schema_history_pk] PRIMARY KEY CLUSTERED 
(
	[installed_rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actores]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actores](
	[actor_id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[region_id] [smallint] NOT NULL,
 CONSTRAINT [PK_actores] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actores_x_contrato]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actores_x_contrato](
	[actor_id] [smallint] NOT NULL,
	[contrato_id] [smallint] NOT NULL,
	[porcentaje] [decimal](5, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[camiones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[camiones](
	[camion_id] [int] IDENTITY(1,1) NOT NULL,
	[placa] [nchar](10) NOT NULL,
 CONSTRAINT [PK_camiones] PRIMARY KEY CLUSTERED 
(
	[camion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificacion_x_productores]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificacion_x_productores](
	[cer_x_prod_id] [smallint] NOT NULL,
	[certificacion_id] [int] NOT NULL,
	[productor_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificaciones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificaciones](
	[certificacion_id] [int] IDENTITY(1,1) NOT NULL,
	[certificacion_nombre] [varchar](65) NOT NULL,
	[enabled] [binary](1) NOT NULL,
 CONSTRAINT [PK_certificaciones] PRIMARY KEY CLUSTERED 
(
	[certificacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[ciudad_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[zipcode] [varchar](15) NOT NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[ciudad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacto_value]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto_value](
	[tipo_id] [smallint] NOT NULL,
	[value] [varchar](150) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[enable] [bit] NULL,
	[contacto_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_contacto_value] PRIMARY KEY CLUSTERED 
(
	[contacto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacto_x_actor]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto_x_actor](
	[actor_id] [smallint] NOT NULL,
	[contacto_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[costo_proceso_historial]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costo_proceso_historial](
	[historial_id] [int] IDENTITY(1,1) NOT NULL,
	[costo] [decimal](10, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[enable] [bit] NULL,
	[checksum] [varbinary](50) NOT NULL,
	[costo_x_pais_id] [smallint] NOT NULL,
 CONSTRAINT [PK_costo_proceso_historial] PRIMARY KEY CLUSTERED 
(
	[historial_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[costo_proceso_x_pais]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costo_proceso_x_pais](
	[costo] [decimal](10, 2) NOT NULL,
	[pais_id] [int] NOT NULL,
	[proceso_id] [smallint] NOT NULL,
	[enable] [bit] NULL,
	[costo_x_pais_id] [smallint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_costo_proceso_x_pais] PRIMARY KEY CLUSTERED 
(
	[costo_x_pais_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desecho_x_recipientes]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desecho_x_recipientes](
	[tiporec_id] [smallint] NOT NULL,
	[tipodes_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechos](
	[desecho_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[unidad] [varchar](10) NOT NULL,
	[tipodes_id] [smallint] NOT NULL,
 CONSTRAINT [PK_desechos] PRIMARY KEY CLUSTERED 
(
	[desecho_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donaciones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donaciones](
	[donacion_id] [smallint] IDENTITY(1,1) NOT NULL,
	[monto] [float] NOT NULL,
	[empresa] [varchar](20) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[sponsor_id] [smallint] NOT NULL,
 CONSTRAINT [PK_donaciones] PRIMARY KEY CLUSTERED 
(
	[donacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[estado_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[ciudad_id] [smallint] NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[estado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evento_log]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento_log](
	[evento_id] [int] NOT NULL,
	[descripcion] [nchar](200) NOT NULL,
	[id_referencia1] [bigint] NOT NULL,
	[Id_referencia2] [bigint] NOT NULL,
	[valor1] [nchar](50) NOT NULL,
	[valor2] [nchar](50) NOT NULL,
	[creado] [datetime] NOT NULL,
	[computer] [nchar](100) NOT NULL,
	[usuario] [nchar](150) NOT NULL,
	[checksum] [varbinary](50) NULL,
	[fuente_id] [int] NOT NULL,
	[tipo_evento_id] [int] NOT NULL,
	[nivel_id] [int] NOT NULL,
	[tipo_objeto_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flyway_schema_history]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flyway_schema_history](
	[installed_rank] [int] NOT NULL,
	[version] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
	[type] [nvarchar](20) NOT NULL,
	[script] [nvarchar](1000) NOT NULL,
	[checksum] [int] NULL,
	[installed_by] [nvarchar](100) NOT NULL,
	[installed_on] [datetime] NOT NULL,
	[execution_time] [int] NOT NULL,
	[success] [bit] NOT NULL,
 CONSTRAINT [flyway_schema_history_pk] PRIMARY KEY CLUSTERED 
(
	[installed_rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fuentes]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fuentes](
	[fuete_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](45) NOT NULL,
 CONSTRAINT [PK_fuentes] PRIMARY KEY CLUSTERED 
(
	[fuete_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomas]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomas](
	[idioma_id] [smallint] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[cultura] [varchar](20) NOT NULL,
	[ubicacion_id] [smallint] NOT NULL,
	[default] [int] NOT NULL,
 CONSTRAINT [PK_idiomas] PRIMARY KEY CLUSTERED 
(
	[idioma_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[fecha_limite] [date] NOT NULL,
	[productor_id] [smallint] NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[impuesto] [decimal](3, 1) NOT NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[local_ev]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[local_ev](
	[ev_id] [int] IDENTITY(1,1) NOT NULL,
	[telefono] [int] NOT NULL,
	[ubicacion_id] [smallint] NOT NULL,
 CONSTRAINT [PK_local_ev] PRIMARY KEY CLUSTERED 
(
	[ev_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiales_para_producto]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materiales_para_producto](
	[materialpp_id] [smallint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[cantidad] [decimal](10, 2) NOT NULL,
	[recurso_id] [smallint] NOT NULL,
	[medida] [varchar](20) NOT NULL,
	[w_mov_id] [smallint] NOT NULL,
 CONSTRAINT [PK_materiales_para_producto] PRIMARY KEY CLUSTERED 
(
	[materialpp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monedas]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedas](
	[moneda_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[simbolo] [nchar](1) NOT NULL,
	[default] [int] NOT NULL,
	[acronimo] [varchar](50) NOT NULL,
	[tipo_cambio_actual] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[moneda_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nivel]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivel](
	[nivel_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](45) NOT NULL,
 CONSTRAINT [PK_nivel] PRIMARY KEY CLUSTERED 
(
	[nivel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[pago_id] [smallint] IDENTITY(1,1) NOT NULL,
	[invoice_id] [int] NOT NULL,
	[tipo_pago] [varchar](10) NOT NULL,
	[transaccion_id] [smallint] NOT NULL,
 CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED 
(
	[pago_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productores_sponsor]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productores_sponsor](
	[sponsor_id] [smallint] IDENTITY(1,1) NOT NULL,
	[ubicacion_id] [smallint] NOT NULL,
	[pais_id] [smallint] NULL,
	[ciudad_id] [smallint] NULL,
	[region_id] [smallint] NULL,
	[estado_id] [smallint] NULL,
	[contrato_id] [smallint] NOT NULL,
	[porcentaje] [decimal](10, 2) NOT NULL,
	[tipodes_id] [smallint] NOT NULL,
 CONSTRAINT [PK_productores_sponsor] PRIMARY KEY CLUSTERED 
(
	[sponsor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[producto_id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[precio] [decimal](10, 3) NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos_producidos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos_producidos](
	[cantidad] [int] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[user_id] [smallint] NOT NULL,
	[producto_mat_id] [smallint] IDENTITY(1,1) NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[user] [varchar](20) NOT NULL,
	[checksum] [varbinary](50) NULL,
	[producto_id] [smallint] NOT NULL,
 CONSTRAINT [PK_productos_producidos] PRIMARY KEY CLUSTERED 
(
	[producto_mat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos_x_materiales]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos_x_materiales](
	[materialpp_id] [smallint] NOT NULL,
	[producto_mat_id] [smallint] NOT NULL,
	[cantidad] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipiente_proceso]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipiente_proceso](
	[recipiente_id] [int] NOT NULL,
	[tipo_proceso] [tinyint] NOT NULL,
	[horario] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipiente_x_movimiento]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipiente_x_movimiento](
	[recipiente_id] [int] NOT NULL,
	[estado] [varchar](30) NOT NULL,
	[w_mov_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipientes]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipientes](
	[recipiente_id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[tiporec_id] [smallint] NOT NULL,
	[capacidad] [decimal](10, 2) NOT NULL,
	[persona_entrega] [varchar](25) NOT NULL,
	[ev_id] [int] NULL,
	[recolector_id] [smallint] NULL,
	[productor_id] [smallint] NULL,
	[firma] [image] NOT NULL,
	[checksum] [varbinary](50) NULL,
	[recoleccion_id] [int] NOT NULL,
	[contrato_id] [smallint] NOT NULL,
 CONSTRAINT [PK_recipientes] PRIMARY KEY CLUSTERED 
(
	[recipiente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recoleccion]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recoleccion](
	[recoleccion_id] [int] IDENTITY(1,1) NOT NULL,
	[recolector_id] [smallint] NULL,
	[productor_id] [smallint] NOT NULL,
	[tiporec_id] [smallint] NOT NULL,
	[ev_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cantidad] [int] NOT NULL,
	[camion_id] [int] NULL,
	[recipiente_id] [int] NOT NULL,
 CONSTRAINT [PK_recoleccion] PRIMARY KEY CLUSTERED 
(
	[recoleccion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recolectores]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recolectores](
	[recolector_id] [smallint] IDENTITY(1,1) NOT NULL,
	[productor_id] [smallint] NOT NULL,
	[ubicacion_id] [smallint] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_recolectores] PRIMARY KEY CLUSTERED 
(
	[recolector_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recursos_materiales]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recursos_materiales](
	[recurso_id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_recursos_materiales] PRIMARY KEY CLUSTERED 
(
	[recurso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regiones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regiones](
	[region_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[ciudad_id] [smallint] NULL,
	[estado_id] [smallint] NULL,
	[pais_id] [smallint] NULL,
 CONSTRAINT [PK_regiones] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_cambio]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_cambio](
	[tipo_cambio_id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_final] [datetime] NOT NULL,
	[moneda_id] [smallint] NOT NULL,
	[default] [decimal](10, 2) NOT NULL,
	[tipo_cambio] [decimal](10, 4) NOT NULL,
	[username] [nchar](50) NOT NULL,
	[computer] [nchar](50) NOT NULL,
	[checksum] [varbinary](50) NULL,
 CONSTRAINT [PK_tipo_cambio] PRIMARY KEY CLUSTERED 
(
	[tipo_cambio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_contactos]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_contactos](
	[tipo_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_contactos] PRIMARY KEY CLUSTERED 
(
	[tipo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_desecho]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_desecho](
	[tipodes_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[reciclable] [bit] NOT NULL,
 CONSTRAINT [PK_tipo_desecho] PRIMARY KEY CLUSTERED 
(
	[tipodes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_evento]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_evento](
	[tipo_evento_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](45) NOT NULL,
 CONSTRAINT [PK_tipo_evento] PRIMARY KEY CLUSTERED 
(
	[tipo_evento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_movimiento]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_movimiento](
	[tipomov_id] [smallint] IDENTITY(1,1) NOT NULL,
	[mov_tipo] [int] NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
 CONSTRAINT [PK_tipo_movimiento] PRIMARY KEY CLUSTERED 
(
	[tipomov_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_objeto]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_objeto](
	[tipo_objeto_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](45) NOT NULL,
 CONSTRAINT [PK_tipo_objeto] PRIMARY KEY CLUSTERED 
(
	[tipo_objeto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_recipientes]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_recipientes](
	[tiporec_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](50) NOT NULL,
	[capacidad] [decimal](10, 2) NOT NULL,
	[medida] [varchar](20) NOT NULL,
	[marca] [varchar](25) NOT NULL,
	[modelo] [varchar](30) NOT NULL,
	[cant_uso] [int] NOT NULL,
	[cant_out] [int] NOT NULL,
	[cant_reparacion] [int] NOT NULL,
	[cant_disponible] [int] NOT NULL,
 CONSTRAINT [PK_tipo_recipientes] PRIMARY KEY CLUSTERED 
(
	[tiporec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_transacciones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_transacciones](
	[tipotran_id] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NOT NULL,
 CONSTRAINT [PK_tipo_transacciones] PRIMARY KEY CLUSTERED 
(
	[tipotran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipodes_x_certificacion]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipodes_x_certificacion](
	[t_x_c_id] [smallint] IDENTITY(1,1) NOT NULL,
	[tipodes_id] [smallint] NOT NULL,
	[certificacion_id] [int] NOT NULL,
 CONSTRAINT [PK_tipodes_x_certificacion] PRIMARY KEY CLUSTERED 
(
	[t_x_c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traduccion](
	[trad_id] [smallint] IDENTITY(1,1) NOT NULL,
	[label] [varchar](25) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[idioma_id] [smallint] NOT NULL,
	[tipo_objecto_id] [int] NOT NULL,
 CONSTRAINT [PK_traduccion] PRIMARY KEY CLUSTERED 
(
	[trad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transacciones]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacciones](
	[transaccion_id] [smallint] IDENTITY(1,1) NOT NULL,
	[tipotran_id] [smallint] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_transacciones] PRIMARY KEY CLUSTERED 
(
	[transaccion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[user_id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[apellido2] [varchar](20) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[profile_pic] [image] NULL,
	[checksum] [varbinary](50) NULL,
	[enable] [bit] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[venta_id] [int] IDENTITY(1,1) NOT NULL,
	[producto_id] [smallint] NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[moneda_id] [smallint] NOT NULL,
	[tipo_cambio_id] [int] NOT NULL,
	[tipo_cambio] [decimal](10, 4) NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[venta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [flyway_schema_history_s_idx]    Script Date: 5/9/2023 8:23:43 PM ******/
CREATE NONCLUSTERED INDEX [flyway_schema_history_s_idx] ON [caso3].[flyway_schema_history]
(
	[success] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [flyway_schema_history_s_idx]    Script Date: 5/9/2023 8:23:43 PM ******/
CREATE NONCLUSTERED INDEX [flyway_schema_history_s_idx] ON [dbo].[flyway_schema_history]
(
	[success] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [caso3].[flyway_schema_history] ADD  DEFAULT (getdate()) FOR [installed_on]
GO
ALTER TABLE [dbo].[flyway_schema_history] ADD  DEFAULT (getdate()) FOR [installed_on]
GO
ALTER TABLE [dbo].[actores_x_contrato]  WITH CHECK ADD  CONSTRAINT [FK_actores_x_contrato_actores] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actores] ([actor_id])
GO
ALTER TABLE [dbo].[actores_x_contrato] CHECK CONSTRAINT [FK_actores_x_contrato_actores]
GO
ALTER TABLE [dbo].[actores_x_contrato]  WITH CHECK ADD  CONSTRAINT [FK_actores_x_contrato_contrato] FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([contrato_id])
GO
ALTER TABLE [dbo].[actores_x_contrato] CHECK CONSTRAINT [FK_actores_x_contrato_contrato]
GO
ALTER TABLE [dbo].[certificacion_x_productores]  WITH CHECK ADD  CONSTRAINT [FK_certificacion_x_productores_certificaciones] FOREIGN KEY([certificacion_id])
REFERENCES [dbo].[certificaciones] ([certificacion_id])
GO
ALTER TABLE [dbo].[certificacion_x_productores] CHECK CONSTRAINT [FK_certificacion_x_productores_certificaciones]
GO
ALTER TABLE [dbo].[certificacion_x_productores]  WITH CHECK ADD  CONSTRAINT [FK_certificacion_x_productores_productores_residuos] FOREIGN KEY([productor_id])
REFERENCES [dbo].[productores_residuos] ([productor_id])
GO
ALTER TABLE [dbo].[certificacion_x_productores] CHECK CONSTRAINT [FK_certificacion_x_productores_productores_residuos]
GO
ALTER TABLE [dbo].[contacto_value]  WITH CHECK ADD  CONSTRAINT [FK_contacto_value_tipo_contactos] FOREIGN KEY([tipo_id])
REFERENCES [dbo].[tipo_contactos] ([tipo_id])
GO
ALTER TABLE [dbo].[contacto_value] CHECK CONSTRAINT [FK_contacto_value_tipo_contactos]
GO
ALTER TABLE [dbo].[contacto_x_actor]  WITH CHECK ADD  CONSTRAINT [FK_contacto_x_actor_actores] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actores] ([actor_id])
GO
ALTER TABLE [dbo].[contacto_x_actor] CHECK CONSTRAINT [FK_contacto_x_actor_actores]
GO
ALTER TABLE [dbo].[contacto_x_actor]  WITH CHECK ADD  CONSTRAINT [FK_contacto_x_actor_contacto_value] FOREIGN KEY([contacto_id])
REFERENCES [dbo].[contacto_value] ([contacto_id])
GO
ALTER TABLE [dbo].[contacto_x_actor] CHECK CONSTRAINT [FK_contacto_x_actor_contacto_value]
GO
ALTER TABLE [dbo].[contrato]  WITH CHECK ADD  CONSTRAINT [FK_contrato_recolectores] FOREIGN KEY([recolector_id])
REFERENCES [dbo].[recolectores] ([recolector_id])
GO
ALTER TABLE [dbo].[contrato] CHECK CONSTRAINT [FK_contrato_recolectores]
GO
ALTER TABLE [dbo].[contrato]  WITH CHECK ADD  CONSTRAINT [FK_contrato_ubicaciones] FOREIGN KEY([ubicacion_id])
REFERENCES [dbo].[ubicaciones] ([ubicacion_id])
GO
ALTER TABLE [dbo].[contrato] CHECK CONSTRAINT [FK_contrato_ubicaciones]
GO
ALTER TABLE [dbo].[costo_proceso_historial]  WITH CHECK ADD  CONSTRAINT [FK_costo_proceso_historial_costo_proceso_x_pais] FOREIGN KEY([costo_x_pais_id])
REFERENCES [dbo].[costo_proceso_x_pais] ([costo_x_pais_id])
GO
ALTER TABLE [dbo].[costo_proceso_historial] CHECK CONSTRAINT [FK_costo_proceso_historial_costo_proceso_x_pais]
GO
ALTER TABLE [dbo].[costo_proceso_x_pais]  WITH CHECK ADD  CONSTRAINT [FK_costo_proceso_x_pais_proceso] FOREIGN KEY([proceso_id])
REFERENCES [dbo].[proceso] ([proceso_id])
GO
ALTER TABLE [dbo].[costo_proceso_x_pais] CHECK CONSTRAINT [FK_costo_proceso_x_pais_proceso]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_local_ev] FOREIGN KEY([ev_id])
REFERENCES [dbo].[local_ev] ([ev_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_local_ev]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_proceso] FOREIGN KEY([proceso_id])
REFERENCES [dbo].[proceso] ([proceso_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_proceso]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_productores_residuos] FOREIGN KEY([productor_id])
REFERENCES [dbo].[productores_residuos] ([productor_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_productores_residuos]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_recolectores] FOREIGN KEY([recolector_id])
REFERENCES [dbo].[recolectores] ([recolector_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_recolectores]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_tipo_movimiento] FOREIGN KEY([tipomov_id])
REFERENCES [dbo].[tipo_movimiento] ([tipomov_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_tipo_movimiento]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_tipo_recipientes] FOREIGN KEY([tiporec_id])
REFERENCES [dbo].[tipo_recipientes] ([tiporec_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_tipo_recipientes]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_ubicaciones] FOREIGN KEY([ubicacion_id])
REFERENCES [dbo].[ubicaciones] ([ubicacion_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_ubicaciones]
GO
ALTER TABLE [dbo].[desecho_movimientos]  WITH CHECK ADD  CONSTRAINT [FK_desecho_movimientos_usuarios] FOREIGN KEY([user_id])
REFERENCES [dbo].[usuarios] ([user_id])
GO
ALTER TABLE [dbo].[desecho_movimientos] CHECK CONSTRAINT [FK_desecho_movimientos_usuarios]
GO
ALTER TABLE [dbo].[desecho_x_recipientes]  WITH CHECK ADD  CONSTRAINT [FK_desecho_x_recipientes_tipo_desecho] FOREIGN KEY([tipodes_id])
REFERENCES [dbo].[tipo_desecho] ([tipodes_id])
GO
ALTER TABLE [dbo].[desecho_x_recipientes] CHECK CONSTRAINT [FK_desecho_x_recipientes_tipo_desecho]
GO
ALTER TABLE [dbo].[desecho_x_recipientes]  WITH CHECK ADD  CONSTRAINT [FK_desecho_x_recipientes_tipo_recipientes] FOREIGN KEY([tiporec_id])
REFERENCES [dbo].[tipo_recipientes] ([tiporec_id])
GO
ALTER TABLE [dbo].[desecho_x_recipientes] CHECK CONSTRAINT [FK_desecho_x_recipientes_tipo_recipientes]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desechos_tipo_desecho] FOREIGN KEY([tipodes_id])
REFERENCES [dbo].[tipo_desecho] ([tipodes_id])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desechos_tipo_desecho]
GO
ALTER TABLE [dbo].[donaciones]  WITH CHECK ADD  CONSTRAINT [FK_donaciones_productores_sponsor] FOREIGN KEY([sponsor_id])
REFERENCES [dbo].[productores_sponsor] ([sponsor_id])
GO
ALTER TABLE [dbo].[donaciones] CHECK CONSTRAINT [FK_donaciones_productores_sponsor]
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD  CONSTRAINT [FK_Estado_ciudades] FOREIGN KEY([ciudad_id])
REFERENCES [dbo].[ciudades] ([ciudad_id])
GO
ALTER TABLE [dbo].[Estado] CHECK CONSTRAINT [FK_Estado_ciudades]
GO
ALTER TABLE [dbo].[evento_log]  WITH CHECK ADD  CONSTRAINT [FK_evento_log_fuentes] FOREIGN KEY([fuente_id])
REFERENCES [dbo].[fuentes] ([fuete_id])
GO
ALTER TABLE [dbo].[evento_log] CHECK CONSTRAINT [FK_evento_log_fuentes]
GO
ALTER TABLE [dbo].[evento_log]  WITH CHECK ADD  CONSTRAINT [FK_evento_log_nivel] FOREIGN KEY([nivel_id])
REFERENCES [dbo].[nivel] ([nivel_id])
GO
ALTER TABLE [dbo].[evento_log] CHECK CONSTRAINT [FK_evento_log_nivel]
GO
ALTER TABLE [dbo].[evento_log]  WITH CHECK ADD  CONSTRAINT [FK_evento_log_tipo_evento] FOREIGN KEY([tipo_evento_id])
REFERENCES [dbo].[tipo_evento] ([tipo_evento_id])
GO
ALTER TABLE [dbo].[evento_log] CHECK CONSTRAINT [FK_evento_log_tipo_evento]
GO
ALTER TABLE [dbo].[evento_log]  WITH CHECK ADD  CONSTRAINT [FK_evento_log_tipo_objeto] FOREIGN KEY([tipo_objeto_id])
REFERENCES [dbo].[tipo_objeto] ([tipo_objeto_id])
GO
ALTER TABLE [dbo].[evento_log] CHECK CONSTRAINT [FK_evento_log_tipo_objeto]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_productores_residuos] FOREIGN KEY([productor_id])
REFERENCES [dbo].[productores_residuos] ([productor_id])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_productores_residuos]
GO
ALTER TABLE [dbo].[local_ev]  WITH CHECK ADD  CONSTRAINT [FK_local_ev_ubicaciones] FOREIGN KEY([ubicacion_id])
REFERENCES [dbo].[ubicaciones] ([ubicacion_id])
GO
ALTER TABLE [dbo].[local_ev] CHECK CONSTRAINT [FK_local_ev_ubicaciones]
GO
ALTER TABLE [dbo].[materiales_para_producto]  WITH CHECK ADD  CONSTRAINT [FK_materiales_para_producto_desecho_movimientos] FOREIGN KEY([w_mov_id])
REFERENCES [dbo].[desecho_movimientos] ([w_mov_id])
GO
ALTER TABLE [dbo].[materiales_para_producto] CHECK CONSTRAINT [FK_materiales_para_producto_desecho_movimientos]
GO
ALTER TABLE [dbo].[materiales_para_producto]  WITH CHECK ADD  CONSTRAINT [FK_materiales_para_producto_recursos_materiales] FOREIGN KEY([recurso_id])
REFERENCES [dbo].[recursos_materiales] ([recurso_id])
GO
ALTER TABLE [dbo].[materiales_para_producto] CHECK CONSTRAINT [FK_materiales_para_producto_recursos_materiales]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_invoice] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[invoice] ([invoice_id])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [FK_pagos_invoice]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_transacciones] FOREIGN KEY([transaccion_id])
REFERENCES [dbo].[transacciones] ([transaccion_id])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [FK_pagos_transacciones]
GO
ALTER TABLE [dbo].[paises]  WITH CHECK ADD  CONSTRAINT [FK_paises_Estado] FOREIGN KEY([estado_id])
REFERENCES [dbo].[Estado] ([estado_id])
GO
ALTER TABLE [dbo].[paises] CHECK CONSTRAINT [FK_paises_Estado]
GO
ALTER TABLE [dbo].[proceso]  WITH CHECK ADD  CONSTRAINT [FK_proceso_contrato] FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([contrato_id])
GO
ALTER TABLE [dbo].[proceso] CHECK CONSTRAINT [FK_proceso_contrato]
GO
ALTER TABLE [dbo].[proceso]  WITH CHECK ADD  CONSTRAINT [FK_proceso_local_ev] FOREIGN KEY([ev_id])
REFERENCES [dbo].[local_ev] ([ev_id])
GO
ALTER TABLE [dbo].[proceso] CHECK CONSTRAINT [FK_proceso_local_ev]
GO
ALTER TABLE [dbo].[productores_residuos]  WITH CHECK ADD  CONSTRAINT [FK_productores_residuos_contacto_value] FOREIGN KEY([contacto_id])
REFERENCES [dbo].[contacto_value] ([contacto_id])
GO
ALTER TABLE [dbo].[productores_residuos] CHECK CONSTRAINT [FK_productores_residuos_contacto_value]
GO
ALTER TABLE [dbo].[productores_residuos]  WITH CHECK ADD  CONSTRAINT [FK_productores_residuos_donaciones] FOREIGN KEY([donacion_id])
REFERENCES [dbo].[donaciones] ([donacion_id])
GO
ALTER TABLE [dbo].[productores_residuos] CHECK CONSTRAINT [FK_productores_residuos_donaciones]
GO
ALTER TABLE [dbo].[productores_residuos]  WITH CHECK ADD  CONSTRAINT [FK_productores_residuos_ubicaciones] FOREIGN KEY([ubicaicon_id])
REFERENCES [dbo].[ubicaciones] ([ubicacion_id])
GO
ALTER TABLE [dbo].[productores_residuos] CHECK CONSTRAINT [FK_productores_residuos_ubicaciones]
GO
ALTER TABLE [dbo].[productores_sponsor]  WITH CHECK ADD  CONSTRAINT [FK_productores_sponsor_ciudades] FOREIGN KEY([ciudad_id])
REFERENCES [dbo].[ciudades] ([ciudad_id])
GO
ALTER TABLE [dbo].[productores_sponsor] CHECK CONSTRAINT [FK_productores_sponsor_ciudades]
GO
ALTER TABLE [dbo].[productores_sponsor]  WITH CHECK ADD  CONSTRAINT [FK_productores_sponsor_contrato] FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([contrato_id])
GO
ALTER TABLE [dbo].[productores_sponsor] CHECK CONSTRAINT [FK_productores_sponsor_contrato]
GO
ALTER TABLE [dbo].[productores_sponsor]  WITH CHECK ADD  CONSTRAINT [FK_productores_sponsor_Estado] FOREIGN KEY([estado_id])
REFERENCES [dbo].[Estado] ([estado_id])
GO
ALTER TABLE [dbo].[productores_sponsor] CHECK CONSTRAINT [FK_productores_sponsor_Estado]
GO
ALTER TABLE [dbo].[productores_sponsor]  WITH CHECK ADD  CONSTRAINT [FK_productores_sponsor_paises] FOREIGN KEY([pais_id])
REFERENCES [dbo].[paises] ([pais_id])
GO
ALTER TABLE [dbo].[productores_sponsor] CHECK CONSTRAINT [FK_productores_sponsor_paises]
GO
ALTER TABLE [dbo].[productores_sponsor]  WITH CHECK ADD  CONSTRAINT [FK_productores_sponsor_regiones] FOREIGN KEY([region_id])
REFERENCES [dbo].[regiones] ([region_id])
GO
ALTER TABLE [dbo].[productores_sponsor] CHECK CONSTRAINT [FK_productores_sponsor_regiones]
GO
ALTER TABLE [dbo].[productores_sponsor]  WITH CHECK ADD  CONSTRAINT [FK_productores_sponsor_tipo_desecho] FOREIGN KEY([tipodes_id])
REFERENCES [dbo].[tipo_desecho] ([tipodes_id])
GO
ALTER TABLE [dbo].[productores_sponsor] CHECK CONSTRAINT [FK_productores_sponsor_tipo_desecho]
GO
ALTER TABLE [dbo].[productos_producidos]  WITH CHECK ADD  CONSTRAINT [FK_productos_producidos_productos] FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([producto_id])
GO
ALTER TABLE [dbo].[productos_producidos] CHECK CONSTRAINT [FK_productos_producidos_productos]
GO
ALTER TABLE [dbo].[productos_producidos]  WITH CHECK ADD  CONSTRAINT [FK_productos_producidos_usuarios] FOREIGN KEY([user_id])
REFERENCES [dbo].[usuarios] ([user_id])
GO
ALTER TABLE [dbo].[productos_producidos] CHECK CONSTRAINT [FK_productos_producidos_usuarios]
GO
ALTER TABLE [dbo].[productos_x_materiales]  WITH CHECK ADD  CONSTRAINT [FK_productos_x_materiales_materiales_para_producto] FOREIGN KEY([materialpp_id])
REFERENCES [dbo].[materiales_para_producto] ([materialpp_id])
GO
ALTER TABLE [dbo].[productos_x_materiales] CHECK CONSTRAINT [FK_productos_x_materiales_materiales_para_producto]
GO
ALTER TABLE [dbo].[productos_x_materiales]  WITH CHECK ADD  CONSTRAINT [FK_productos_x_materiales_productos_producidos] FOREIGN KEY([producto_mat_id])
REFERENCES [dbo].[productos_producidos] ([producto_mat_id])
GO
ALTER TABLE [dbo].[productos_x_materiales] CHECK CONSTRAINT [FK_productos_x_materiales_productos_producidos]
GO
ALTER TABLE [dbo].[recipiente_proceso]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_proceso_recipientes] FOREIGN KEY([recipiente_id])
REFERENCES [dbo].[recipientes] ([recipiente_id])
GO
ALTER TABLE [dbo].[recipiente_proceso] CHECK CONSTRAINT [FK_recipiente_proceso_recipientes]
GO
ALTER TABLE [dbo].[recipiente_x_movimiento]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_x_movimiento_desecho_movimientos] FOREIGN KEY([w_mov_id])
REFERENCES [dbo].[desecho_movimientos] ([w_mov_id])
GO
ALTER TABLE [dbo].[recipiente_x_movimiento] CHECK CONSTRAINT [FK_recipiente_x_movimiento_desecho_movimientos]
GO
ALTER TABLE [dbo].[recipiente_x_movimiento]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_x_movimiento_recipientes] FOREIGN KEY([recipiente_id])
REFERENCES [dbo].[recipientes] ([recipiente_id])
GO
ALTER TABLE [dbo].[recipiente_x_movimiento] CHECK CONSTRAINT [FK_recipiente_x_movimiento_recipientes]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipientes_recoleccion] FOREIGN KEY([recoleccion_id])
REFERENCES [dbo].[recoleccion] ([recoleccion_id])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipientes_recoleccion]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipientes_tipo_recipientes] FOREIGN KEY([tiporec_id])
REFERENCES [dbo].[tipo_recipientes] ([tiporec_id])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipientes_tipo_recipientes]
GO
ALTER TABLE [dbo].[recoleccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccion_camiones] FOREIGN KEY([camion_id])
REFERENCES [dbo].[camiones] ([camion_id])
GO
ALTER TABLE [dbo].[recoleccion] CHECK CONSTRAINT [FK_recoleccion_camiones]
GO
ALTER TABLE [dbo].[recoleccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccion_local_ev] FOREIGN KEY([ev_id])
REFERENCES [dbo].[local_ev] ([ev_id])
GO
ALTER TABLE [dbo].[recoleccion] CHECK CONSTRAINT [FK_recoleccion_local_ev]
GO
ALTER TABLE [dbo].[recoleccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccion_productores_residuos] FOREIGN KEY([productor_id])
REFERENCES [dbo].[productores_residuos] ([productor_id])
GO
ALTER TABLE [dbo].[recoleccion] CHECK CONSTRAINT [FK_recoleccion_productores_residuos]
GO
ALTER TABLE [dbo].[recoleccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccion_recipientes] FOREIGN KEY([recipiente_id])
REFERENCES [dbo].[recipientes] ([recipiente_id])
GO
ALTER TABLE [dbo].[recoleccion] CHECK CONSTRAINT [FK_recoleccion_recipientes]
GO
ALTER TABLE [dbo].[recoleccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccion_recolectores] FOREIGN KEY([recolector_id])
REFERENCES [dbo].[recolectores] ([recolector_id])
GO
ALTER TABLE [dbo].[recoleccion] CHECK CONSTRAINT [FK_recoleccion_recolectores]
GO
ALTER TABLE [dbo].[recoleccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccion_tipo_recipientes] FOREIGN KEY([tiporec_id])
REFERENCES [dbo].[tipo_recipientes] ([tiporec_id])
GO
ALTER TABLE [dbo].[recoleccion] CHECK CONSTRAINT [FK_recoleccion_tipo_recipientes]
GO
ALTER TABLE [dbo].[recolectores]  WITH CHECK ADD  CONSTRAINT [FK_recolectores_productores_residuos1] FOREIGN KEY([productor_id])
REFERENCES [dbo].[productores_residuos] ([productor_id])
GO
ALTER TABLE [dbo].[recolectores] CHECK CONSTRAINT [FK_recolectores_productores_residuos1]
GO
ALTER TABLE [dbo].[recolectores]  WITH CHECK ADD  CONSTRAINT [FK_recolectores_ubicaciones] FOREIGN KEY([ubicacion_id])
REFERENCES [dbo].[ubicaciones] ([ubicacion_id])
GO
ALTER TABLE [dbo].[recolectores] CHECK CONSTRAINT [FK_recolectores_ubicaciones]
GO
ALTER TABLE [dbo].[regiones]  WITH CHECK ADD  CONSTRAINT [FK_regiones_ciudades] FOREIGN KEY([ciudad_id])
REFERENCES [dbo].[ciudades] ([ciudad_id])
GO
ALTER TABLE [dbo].[regiones] CHECK CONSTRAINT [FK_regiones_ciudades]
GO
ALTER TABLE [dbo].[regiones]  WITH CHECK ADD  CONSTRAINT [FK_regiones_Estado] FOREIGN KEY([estado_id])
REFERENCES [dbo].[Estado] ([estado_id])
GO
ALTER TABLE [dbo].[regiones] CHECK CONSTRAINT [FK_regiones_Estado]
GO
ALTER TABLE [dbo].[regiones]  WITH CHECK ADD  CONSTRAINT [FK_regiones_paises] FOREIGN KEY([pais_id])
REFERENCES [dbo].[paises] ([pais_id])
GO
ALTER TABLE [dbo].[regiones] CHECK CONSTRAINT [FK_regiones_paises]
GO
ALTER TABLE [dbo].[tipo_cambio]  WITH CHECK ADD  CONSTRAINT [FK_tipo_cambio_monedas] FOREIGN KEY([moneda_id])
REFERENCES [dbo].[monedas] ([moneda_id])
GO
ALTER TABLE [dbo].[tipo_cambio] CHECK CONSTRAINT [FK_tipo_cambio_monedas]
GO
ALTER TABLE [dbo].[tipodes_x_certificacion]  WITH CHECK ADD  CONSTRAINT [FK_tipodes_x_certificacion_certificaciones] FOREIGN KEY([certificacion_id])
REFERENCES [dbo].[certificaciones] ([certificacion_id])
GO
ALTER TABLE [dbo].[tipodes_x_certificacion] CHECK CONSTRAINT [FK_tipodes_x_certificacion_certificaciones]
GO
ALTER TABLE [dbo].[tipodes_x_certificacion]  WITH CHECK ADD  CONSTRAINT [FK_tipodes_x_certificacion_tipo_desecho] FOREIGN KEY([tipodes_id])
REFERENCES [dbo].[tipo_desecho] ([tipodes_id])
GO
ALTER TABLE [dbo].[tipodes_x_certificacion] CHECK CONSTRAINT [FK_tipodes_x_certificacion_tipo_desecho]
GO
ALTER TABLE [dbo].[traduccion]  WITH CHECK ADD  CONSTRAINT [FK_traduccion_idiomas] FOREIGN KEY([idioma_id])
REFERENCES [dbo].[idiomas] ([idioma_id])
GO
ALTER TABLE [dbo].[traduccion] CHECK CONSTRAINT [FK_traduccion_idiomas]
GO
ALTER TABLE [dbo].[traduccion]  WITH CHECK ADD  CONSTRAINT [FK_traduccion_tipo_objeto] FOREIGN KEY([tipo_objecto_id])
REFERENCES [dbo].[tipo_objeto] ([tipo_objeto_id])
GO
ALTER TABLE [dbo].[traduccion] CHECK CONSTRAINT [FK_traduccion_tipo_objeto]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_tipo_transacciones] FOREIGN KEY([tipotran_id])
REFERENCES [dbo].[tipo_transacciones] ([tipotran_id])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_tipo_transacciones]
GO
ALTER TABLE [dbo].[ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_ubicaciones_paises1] FOREIGN KEY([pais_id])
REFERENCES [dbo].[paises] ([pais_id])
GO
ALTER TABLE [dbo].[ubicaciones] CHECK CONSTRAINT [FK_ubicaciones_paises1]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_monedas] FOREIGN KEY([moneda_id])
REFERENCES [dbo].[monedas] ([moneda_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_monedas]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_productos] FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([producto_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_productos]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_tipo_cambio] FOREIGN KEY([tipo_cambio_id])
REFERENCES [dbo].[tipo_cambio] ([tipo_cambio_id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_tipo_cambio]
GO
/****** Object:  StoredProcedure [dbo].[InsertarMov]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarMov]
	@datos INT,
	@responsible_name1 Varchar(20)

AS
BEGIN
	SET NOCOUNT ON;
	WHILE @datos > 0 
		BEGIN
			DECLARE @posttime datetime, @ubicacion_id smallint, @recolector_id smallint, @productor_id smallint, @responsible_name Varchar(20) ;
			DECLARE @ev_id int, @tipomov_id smallint, @tiporec_id smallint, @reci_desecho_cantidad decimal(10,2), @user_id smallint, @computer varchar(20);
			DECLARE @user varchar(20), @proceso_id smallint, @contrato smallint;

			SET @posttime = DATEADD(day, ABS(CHECKSUM(NEWID())) % 244, '2023-05-01');
			
			DECLARE @firstName VARCHAR(20), @lastName VARCHAR(20)
			SET @responsible_name =  @responsible_name1 + CAST(@datos AS VARCHAR(5));

			SELECT TOP 1 @ubicacion_id = ubicacion_id FROM ubicaciones ORDER BY NEWID();
			SELECT TOP 1 @recolector_id = recolector_id FROM recolectores where recolectores.ubicacion_id = @ubicacion_id ORDER BY NEWID();
			SELECT TOP 1 @productor_id = productor_id FROM productores_residuos where productores_residuos.ubicaicon_id = @ubicacion_id ORDER BY NEWID();
			SELECT TOP 1 @ev_id = ev_id FROM local_ev where local_ev.ubicacion_id = @ubicacion_id ORDER BY NEWID();
			SELECT TOP 1 @tipomov_id =  tipomov_id FROM tipo_movimiento ORDER BY NEWID();
			SELECT TOP 1 @tiporec_id =  tiporec_id FROM tipo_recipientes ORDER BY NEWID();
			SET @reci_desecho_cantidad = RAND()*100;
			SELECT TOP 1 @user_id = user_id FROM usuarios ORDER BY NEWID();
			SET @computer = 'localhost';
			SET @user = 'root';
			SELECT TOP 1 @contrato = contrato_id FROM contrato where contrato.ubicacion_id = @ubicacion_id ORDER BY NEWID();
			SELECT TOP 1 @proceso_id = proceso_id FROM proceso where proceso.contrato_id = @contrato ORDER BY NEWID();
			

			INSERT INTO desecho_movimientos (posttime, responsible_name, ubicacion_id, recolector_id, productor_id, ev_id, tipomov_id, tiporec_id, reci_desecho_cantidad, user_id, computer, [user], proceso_id)
			VALUES (@posttime, @responsible_name, @ubicacion_id, @recolector_id, @productor_id, @ev_id, @tipomov_id, @tiporec_id, @reci_desecho_cantidad, @user_id, @computer, @user, @proceso_id);
			SET @datos =  @datos - 1;;
		END
		
END
GO
/****** Object:  StoredProcedure [dbo].[MyDynamicView]    Script Date: 5/9/2023 8:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MyDynamicView]
AS
BEGIN
    SELECT dbo.contrato.descripcion, dbo.proceso.proceso_id, dbo.proceso.clasificacion, dbo.desecho_movimientos.posttime, dbo.desecho_movimientos.responsible_name, dbo.desecho_movimientos.reci_desecho_cantidad, 
                  dbo.ubicaciones.descripcion AS Expr1, dbo.paises.nombre, dbo.productores_residuos.nombre AS Expr2, dbo.productores_residuos.porcentaje_carbon, dbo.productores_residuos.balance
    FROM     dbo.contrato INNER JOIN
                  dbo.proceso ON dbo.contrato.contrato_id = dbo.proceso.contrato_id INNER JOIN
                  dbo.desecho_movimientos ON dbo.proceso.proceso_id = dbo.desecho_movimientos.proceso_id INNER JOIN
                  dbo.ubicaciones ON dbo.contrato.ubicacion_id = dbo.ubicaciones.ubicacion_id AND dbo.desecho_movimientos.ubicacion_id = dbo.ubicaciones.ubicacion_id INNER JOIN
                  dbo.paises ON dbo.ubicaciones.pais_id = dbo.paises.pais_id INNER JOIN
                  dbo.productores_residuos ON dbo.desecho_movimientos.productor_id = dbo.productores_residuos.productor_id AND dbo.ubicaciones.ubicacion_id = dbo.productores_residuos.ubicaicon_id
    WHERE dbo.contrato.contrato_id < 12
END

EXEC dbo.MyDynamicView
GO
USE [master]
GO
ALTER DATABASE [caso3] SET  READ_WRITE 
GO
