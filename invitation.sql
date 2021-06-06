USE [master]
GO
/****** Object:  Database [Invitation]    Script Date: 6.06.2021 18:56:23 ******/
CREATE DATABASE [Invitation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Invitation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Invitation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Invitation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Invitation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Invitation] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Invitation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Invitation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Invitation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Invitation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Invitation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Invitation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Invitation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Invitation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Invitation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Invitation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Invitation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Invitation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Invitation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Invitation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Invitation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Invitation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Invitation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Invitation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Invitation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Invitation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Invitation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Invitation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Invitation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Invitation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Invitation] SET  MULTI_USER 
GO
ALTER DATABASE [Invitation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Invitation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Invitation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Invitation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Invitation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Invitation] SET QUERY_STORE = OFF
GO
USE [Invitation]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 6.06.2021 18:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfos]    Script Date: 6.06.2021 18:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfos](
	[Id] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[PhoneNumber] [char](11) NULL,
	[EmailAddress] [varchar](100) NULL,
	[MailAddress] [varchar](100) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_ContactInfos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataSources]    Script Date: 6.06.2021 18:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSources](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DataSources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 6.06.2021 18:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 6.06.2021 18:56:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[ContactInfoId] [int] NOT NULL,
	[DataSourceId] [int] NOT NULL,
	[DeliveryMethodId] [int] NOT NULL,
	[IsReady] [bit] NOT NULL,
	[IsGiven] [bit] NOT NULL,
	[IsBoarding] [bit] NOT NULL,
	[IsInvitedToTheParty] [bit] NULL,
 CONSTRAINT [PK_Guests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactInfos]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfos_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[ContactInfos] CHECK CONSTRAINT [FK_ContactInfos_Cities]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK_Guests_ContactInfos] FOREIGN KEY([ContactInfoId])
REFERENCES [dbo].[ContactInfos] ([Id])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK_Guests_ContactInfos]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK_Guests_DataSources] FOREIGN KEY([DataSourceId])
REFERENCES [dbo].[DataSources] ([Id])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK_Guests_DataSources]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK_Guests_DeliveryMethods] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DeliveryMethods] ([Id])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK_Guests_DeliveryMethods]
GO
USE [master]
GO
ALTER DATABASE [Invitation] SET  READ_WRITE 
GO
