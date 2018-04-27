USE [master]
GO
/****** Object:  Database [Assignment4]    Script Date: 27/04/2018 10:27:26 AM ******/
CREATE DATABASE [Assignment4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Assignment4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Assignment4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Assignment4] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment4] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment4] SET QUERY_STORE = OFF
GO
USE [Assignment4]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Assignment4]
GO
/****** Object:  User [ali]    Script Date: 27/04/2018 10:27:26 AM ******/
CREATE USER [ali] FOR LOGIN [ali] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 27/04/2018 10:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/04/2018 10:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[NIC] [varchar](20) NOT NULL,
	[DOB] [varchar](50) NOT NULL,
	[IsCricket] [bit] NOT NULL,
	[Hockey] [bit] NOT NULL,
	[Chess] [bit] NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[CreatedOn] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [AdminName], [Login], [Password]) VALUES (1, N'Ahsan', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Gender], [Address], [Age], [NIC], [DOB], [IsCricket], [Hockey], [Chess], [ImageName], [CreatedOn], [Email]) VALUES (31, N'kalash', N'kalah5485', N'1234', N'M', N'asdas', 30, N'1232584asasd523', N'1996-02-12', 1, 0, 1, N'10d0f10c-1455-407e-a19b-4a27258752c7.jpg', N'27/04/2018 09:14:25 AM', N'kalaash@live.com')
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Gender], [Address], [Age], [NIC], [DOB], [IsCricket], [Hockey], [Chess], [ImageName], [CreatedOn], [Email]) VALUES (32, N'oasd', N'asdmaksd', N'asdmk', N'M', N'bxsasaj', 0, N'asdckma', N'', 1, 1, 0, N'7d4df1d0-2322-47fa-9e5a-e799a901fc25.jpg', N'27/04/2018 10:04:35 AM', N'asmd')
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Gender], [Address], [Age], [NIC], [DOB], [IsCricket], [Hockey], [Chess], [ImageName], [CreatedOn], [Email]) VALUES (1006, N'tuseef', N'tusi12', N'12345', N'M', N'mkk', 25, N'123744445823', N'2018-04-11', 1, 0, 1, N'6cdb4020-9298-4664-b4d2-c7fceae54c71.jpg', N'27/04/2018 07:09:24 AM', N'tusi@yahoo.com')
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Gender], [Address], [Age], [NIC], [DOB], [IsCricket], [Hockey], [Chess], [ImageName], [CreatedOn], [Email]) VALUES (1007, N'hammad84', N'hammad665', N'12345', N'M', N'sdasnb', 4, N'1221', N'2018-04-17', 1, 1, 0, N'd37abc6c-1cc2-4d6b-b7af-44152e4b6a20.jpg', N'27/04/2018 09:14:36 AM', N'hammad85@live.com')
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Gender], [Address], [Age], [NIC], [DOB], [IsCricket], [Hockey], [Chess], [ImageName], [CreatedOn], [Email]) VALUES (1008, N'admin', N'admin', N'admin', N'M', N'xbahb', 0, N'312342351', N'', 0, 0, 0, N'', N'27/04/2018 09:14:42 AM', N'admin@gmail.com')
INSERT [dbo].[Users] ([UserID], [Name], [Login], [Password], [Gender], [Address], [Age], [NIC], [DOB], [IsCricket], [Hockey], [Chess], [ImageName], [CreatedOn], [Email]) VALUES (1009, N'bilal', N'bilaluu', N'1234', N'M', N'asdasdasdfsa', 56, N'237123108', N'2018-04-11', 0, 1, 1, N'eccd19c0-6a32-4405-bde4-a9567643b5fc.jpg', N'27/04/2018 10:08:32 AM', N'bilal@yahoo.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [Assignment4] SET  READ_WRITE 
GO
