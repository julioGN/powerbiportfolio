USE [master]
GO
/****** Object:  Database [ac]    Script Date: 5/24/2024 11:49:46 PM ******/
CREATE DATABASE [ac]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ac', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ac.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ac_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ac_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ac] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ac].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ac] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ac] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ac] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ac] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ac] SET ARITHABORT OFF 
GO
ALTER DATABASE [ac] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ac] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ac] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ac] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ac] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ac] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ac] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ac] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ac] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ac] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ac] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ac] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ac] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ac] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ac] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ac] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ac] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ac] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ac] SET  MULTI_USER 
GO
ALTER DATABASE [ac] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ac] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ac] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ac] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ac] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ac] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ac', N'ON'
GO
ALTER DATABASE [ac] SET QUERY_STORE = OFF
GO
USE [ac]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 5/24/2024 11:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] NOT NULL,
	[Location] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 5/24/2024 11:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[SPID] [int] NOT NULL,
	[Salesperson] [nvarchar](50) NULL,
	[Team] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[SPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/24/2024 11:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[PID] [int] NOT NULL,
	[Product] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[UnitCost] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 5/24/2024 11:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SPID] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[PID] [int] NOT NULL,
	[SaleDate] [datetime] NULL,
	[Amount] [int] NULL,
	[Customers] [int] NULL,
	[Units] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Location]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_People] FOREIGN KEY([SPID])
REFERENCES [dbo].[People] ([SPID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_People]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([PID])
REFERENCES [dbo].[Products] ([PID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
USE [master]
GO
ALTER DATABASE [ac] SET  READ_WRITE 
GO
