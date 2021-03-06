USE [master]
GO
/****** Object:  Database [realtors01]    Script Date: 4/20/2021 4:05:21 AM ******/
CREATE DATABASE [realtors01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'realtors01', FILENAME = N'C:\Program Files\MSSQL15.SQLEXPRESS\MSSQL\DATA\realtors01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'realtors01_log', FILENAME = N'C:\Program Files\MSSQL15.SQLEXPRESS\MSSQL\DATA\realtors01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [realtors01] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [realtors01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [realtors01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [realtors01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [realtors01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [realtors01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [realtors01] SET ARITHABORT OFF 
GO
ALTER DATABASE [realtors01] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [realtors01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [realtors01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [realtors01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [realtors01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [realtors01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [realtors01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [realtors01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [realtors01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [realtors01] SET  ENABLE_BROKER 
GO
ALTER DATABASE [realtors01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [realtors01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [realtors01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [realtors01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [realtors01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [realtors01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [realtors01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [realtors01] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [realtors01] SET  MULTI_USER 
GO
ALTER DATABASE [realtors01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [realtors01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [realtors01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [realtors01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [realtors01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [realtors01] SET QUERY_STORE = OFF
GO
USE [realtors01]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Role] [nvarchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Are]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Are](
	[AreID] [int] IDENTITY(1,1) NOT NULL,
	[AreName] [nvarchar](100) NULL,
	[AreLetter] [nvarchar](1) NULL,
	[Avatar] [nvarchar](100) NULL,
	[DistrictID] [int] NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Are] PRIMARY KEY CLUSTERED 
(
	[AreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[CategoryTitle] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NULL,
	[CityLetter] [nvarchar](1) NULL,
	[Avatar] [nvarchar](100) NULL,
	[CountryID] [int] NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NULL,
	[CountryLetter] [nvarchar](1) NULL,
	[Avatar] [nvarchar](100) NULL,
	[LocationID] [int] NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](100) NULL,
	[DistrictLetter] [nvarchar](1) NULL,
	[Avatar] [nvarchar](100) NULL,
	[CityID] [int] NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageLib]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageLib](
	[ImageLibID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ImageLib] PRIMARY KEY CLUSTERED 
(
	[ImageLibID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](100) NULL,
	[LocationLetter] [nvarchar](1) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[PackageName] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[PackageTitle] [nvarchar](max) NULL,
	[PackageDesciption] [nvarchar](max) NULL,
	[Duration] [int] NOT NULL,
	[Active] [int] NOT NULL,
	[TypeDuration] [nvarchar](max) NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackagePurchased]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackagePurchased](
	[ppID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NOT NULL,
	[UserID] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PackagePurchased] PRIMARY KEY CLUSTERED 
(
	[ppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ProjectName] [nvarchar](100) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [int] NOT NULL,
	[Country] [int] NOT NULL,
	[City] [int] NOT NULL,
	[District] [int] NOT NULL,
	[Are] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Sqft] [real] NOT NULL,
	[ImageBannerName] [nvarchar](max) NULL,
	[LevelActive] [int] NOT NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActiveAgent] [bit] NOT NULL,
	[AgentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/20/2021 4:05:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[NetWorkID] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Active] [int] NOT NULL,
	[PackageID] [int] NOT NULL,
	[ppID] [int] NOT NULL,
	[User_type] [nvarchar](max) NULL,
	[Are] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405020645_thinh', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405033421_realtors01', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405043029_id to ID', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405045235_add table roles', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405050413_add table roles again', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405051047_realtors01-01', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210406030227_update package', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210406061000_update table seller and agent', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210406061952_update table product', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210408032454_update user', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210409064732_update User Address', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210409065207_update User Address type', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210409090458_update comeback User Address type', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210409091133_update next User Address type', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210417140322_create db', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210418045213_utf8', N'5.0.4')
SET IDENTITY_INSERT [dbo].[Are] ON 

INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (2, N'Minh Phu', N'M', N'1618841744972AvatarDefault.jpg', 175, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (3, N'Loc Chau', N'L', N'1618841744972AvatarDefault.jpg', 406, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (4, N'Ham Ninh', N'H', N'1618841744972AvatarDefault.jpg', 641, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (5, N'Pham Van Hai', N'P', N'1618842630684AvatarDefault.jpg', 521, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (6, N'Loc Tan', N'L', N'1618862408224AvatarDefault.jpg', 79, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (7, N'Chon Thanh', N'C', N'1618842630684AvatarDefault.jpg', 549, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (8, N'Thien Nghiep', N'T', N'1618842630684AvatarDefault.jpg', 438, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (9, N'Ban Kengpayang', N'B', N'1618843478825AvatarDefault.jpg', 828, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (11, N'Hongsouphab', N'H', N'1618843478825AvatarDefault.jpg', 794, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (12, N'Phanom', N'P', N'1618843478825AvatarDefault.jpg', 758, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (13, N'Yen Nghia', N'Y', N'1618846269960AvatarDefault.jpg', 155, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (14, N'Sangweuy', N'S', N'1618846614276AvatarDefault.jpg', 825, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (15, N'Vattai Gnay Thong', N'V', N'1618846614276AvatarDefault.jpg', 823, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (16, N'Latkhuay', N'L', N'1618846614276AvatarDefault.jpg', 827, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (17, N'Nakhe', N'N', N'1618846614276AvatarDefault.jpg', 827, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (18, N'Tu Hiep', N'T', N'1618847810083AvatarDefault.jpg', 178, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (19, N'Ward 10', N'W', N'1618847810083AvatarDefault.jpg', 506, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (20, N'Phu My Hung', N'P', N'1618847810083AvatarDefault.jpg', 510, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (21, N'Ward 2', N'W', N'1618847810083AvatarDefault.jpg', 519, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (23, N'Phonsinouan', N'P', N'1618849459715AvatarDefault.jpg', 825, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (24, N'Nonghai Village', N'N', N'1618849459715AvatarDefault.jpg', 828, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (25, N'Louangphrabang', N'L', N'1618849980028AvatarDefault.jpg', 758, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (26, N'123 St.', N'1', N'1618851079592AvatarDefault.jpg', 738, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (27, N'Khue My', N'K', N'1618851350939AvatarDefault.jpg', 420, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (28, N'Cau Dien', N'K', N'1618851350939AvatarDefault.jpg', 160, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (30, N'Attapeu', N'A', N'1618853499471AvatarDefault.jpg', 824, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (31, N'Yen Nhan', N'Y', N'1618854374606AvatarDefault.jpg', 223, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (32, N'Huynh Tan Phat', N'H', N'1618854954528AvatarDefault.jpg', 510, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (33, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 1, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (34, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 2, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (35, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 3, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (36, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 4, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (37, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 5, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (38, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 6, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (39, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 7, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (40, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 8, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (41, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 9, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (42, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 10, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (43, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 11, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (44, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 12, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (45, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 13, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (46, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 14, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (47, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 15, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (48, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 16, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (49, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 17, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (50, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 18, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (51, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 19, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (52, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 20, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (53, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 21, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (54, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 22, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (55, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 23, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (56, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 24, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (57, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 25, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (58, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 26, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (59, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 27, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (60, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 28, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (61, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 29, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (62, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 30, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (63, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 31, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (64, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 32, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (65, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 33, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (66, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 34, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (67, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 35, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (68, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 36, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (69, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 37, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (70, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 38, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (71, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 39, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (72, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 40, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (73, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 41, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (74, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 42, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (75, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 43, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (76, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 44, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (77, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 45, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (78, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 46, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (79, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 47, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (80, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 48, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (81, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 49, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (82, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 50, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (83, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 51, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (84, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 52, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (85, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 53, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (86, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 54, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (87, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 55, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (88, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 56, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (89, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 57, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (90, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 58, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (91, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 59, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (92, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 60, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (93, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 61, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (94, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 62, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (95, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 63, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (96, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 64, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (97, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 65, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (98, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 66, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (99, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 67, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (100, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 68, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (101, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 69, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (102, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 70, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (103, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 71, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (104, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 72, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (105, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 73, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (127, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 95, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (128, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 96, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (129, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 97, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (130, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 98, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (131, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 99, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (132, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 100, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (133, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 101, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (142, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 88, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (143, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 89, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (144, N'12 St.', N'1', N'1618861589509AvatarDefault.jpg', 90, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (145, N'12 St.', N'L', N'1618862408224AvatarDefault.jpg', 102, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (146, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 103, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (147, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 104, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (148, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 105, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (149, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 106, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (150, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 107, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (151, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 108, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (152, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 109, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (153, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 110, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (154, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 111, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (155, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 112, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (156, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 113, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (157, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 114, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (158, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 115, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (159, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 116, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (160, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 117, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (161, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 118, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (162, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 119, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (163, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 120, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (164, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 121, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (165, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 122, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (166, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 123, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (167, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 124, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (168, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 125, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (169, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 126, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (170, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 127, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (171, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 128, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (172, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 129, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (173, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 130, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (174, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 131, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (175, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 132, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (176, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 133, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (177, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 134, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (178, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 135, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (179, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 136, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (180, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 137, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (181, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 138, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (182, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 139, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (183, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 140, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (184, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 141, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (185, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 142, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (186, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 143, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (187, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 144, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (188, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 145, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (189, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 146, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (190, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 147, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (191, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 148, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (192, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 149, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (193, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 150, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (194, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 151, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (195, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 152, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (196, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 153, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (197, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 154, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (198, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 155, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (199, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 156, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (200, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 157, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (201, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 158, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (202, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 159, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (203, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 160, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (204, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 161, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (205, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 162, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (206, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 163, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (207, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 164, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (208, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 165, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (209, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 166, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (210, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 167, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (211, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 168, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (212, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 169, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (213, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 170, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (214, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 171, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (215, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 172, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (216, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 173, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (217, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 174, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (218, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 175, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (219, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 176, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (220, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 177, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (221, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 178, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (222, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 179, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (223, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 180, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (224, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 181, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (225, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 182, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (226, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 183, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (227, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 184, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (228, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 185, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (229, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 186, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (230, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 187, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (231, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 188, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (232, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 189, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (233, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 190, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (234, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 191, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (235, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 192, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (236, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 193, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (237, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 194, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (238, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 195, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (239, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 196, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (240, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 197, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (241, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 198, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (242, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 199, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (243, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 200, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (244, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 201, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (245, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 202, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (246, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 203, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (247, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 204, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (248, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 205, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (249, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 206, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (250, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 207, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (251, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 208, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (252, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 209, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (253, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 210, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (254, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 211, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (255, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 212, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (256, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 213, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (257, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 214, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (258, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 215, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (259, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 216, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (260, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 217, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (261, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 218, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (262, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 219, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (263, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 220, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (264, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 221, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (265, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 222, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (266, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 223, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (267, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 224, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (268, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 225, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (269, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 226, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (270, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 227, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (271, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 228, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (272, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 229, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (273, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 230, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (274, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 231, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (275, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 232, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (276, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 233, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (277, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 234, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (278, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 235, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (279, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 236, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (280, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 237, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (281, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 238, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (282, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 239, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (283, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 240, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (284, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 241, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (285, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 242, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (286, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 243, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (287, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 244, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (288, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 245, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (289, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 246, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (290, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 247, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (291, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 248, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (292, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 249, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (293, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 250, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (294, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 251, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (295, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 252, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (296, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 253, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (297, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 254, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (298, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 255, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (299, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 256, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (300, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 257, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (301, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 258, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (302, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 259, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (303, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 260, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (304, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 261, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (305, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 262, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (306, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 263, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (307, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 264, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (308, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 265, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (309, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 266, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (310, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 267, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (311, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 268, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (312, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 269, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (313, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 270, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (314, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 271, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (315, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 272, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (316, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 273, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (317, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 274, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (318, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 275, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (319, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 276, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (320, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 277, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (321, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 278, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (322, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 279, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (323, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 280, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (324, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 281, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (325, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 282, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (326, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 283, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (327, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 284, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (328, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 285, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (329, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 286, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (330, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 287, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (331, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 288, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (332, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 289, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (333, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 290, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (334, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 291, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (335, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 292, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (336, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 293, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (337, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 294, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (338, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 295, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (339, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 296, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (340, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 297, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (341, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 298, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (342, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 299, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (343, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 300, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (344, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 301, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (345, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 302, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (346, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 303, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (347, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 304, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (348, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 305, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (349, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 306, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (350, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 307, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (351, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 308, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (352, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 309, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (353, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 310, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (354, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 311, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (355, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 312, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (356, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 313, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (357, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 314, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (358, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 315, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (359, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 316, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (360, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 317, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (361, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 318, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (362, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 319, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (363, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 320, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (364, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 321, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (365, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 322, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (366, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 323, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (367, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 324, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (368, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 325, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (369, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 326, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (370, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 327, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (371, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 328, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (372, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 329, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (373, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 330, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (374, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 331, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (375, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 332, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (376, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 333, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (377, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 334, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (378, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 335, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (379, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 336, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (380, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 337, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (381, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 338, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (382, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 339, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (383, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 340, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (384, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 341, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (385, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 342, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (386, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 343, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (387, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 344, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (388, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 345, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (389, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 346, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (390, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 347, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (391, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 348, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (392, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 349, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (393, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 350, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (394, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 351, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (395, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 352, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (396, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 353, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (397, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 354, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (398, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 355, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (399, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 356, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (400, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 357, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (401, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 358, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (402, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 359, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (403, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 360, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (404, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 361, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (405, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 362, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (406, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 363, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (407, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 364, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (408, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 365, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (409, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 366, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (410, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 367, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (411, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 368, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (412, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 369, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (413, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 370, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (414, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 371, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (415, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 372, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (416, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 373, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (417, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 374, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (418, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 375, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (419, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 376, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (420, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 377, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (421, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 378, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (422, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 379, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (423, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 380, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (424, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 381, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (425, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 382, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (426, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 383, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (427, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 384, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (428, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 385, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (429, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 386, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (430, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 387, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (431, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 388, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (432, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 389, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (433, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 390, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (434, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 391, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (435, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 392, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (436, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 393, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (437, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 394, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (438, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 395, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (439, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 396, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (440, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 397, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (441, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 398, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (442, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 399, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (443, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 400, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (444, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 401, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (445, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 402, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (446, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 403, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (447, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 404, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (448, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 405, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (449, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 406, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (450, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 407, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (451, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 408, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (452, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 409, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (453, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 410, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (454, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 411, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (455, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 412, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (456, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 413, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (457, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 414, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (458, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 415, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (459, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 416, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (460, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 417, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (461, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 418, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (462, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 419, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (463, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 420, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (464, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 421, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (465, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 422, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (466, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 423, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (467, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 424, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (468, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 425, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (469, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 426, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (470, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 427, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (471, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 428, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (472, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 429, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (473, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 430, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (474, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 431, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (475, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 432, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (476, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 433, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (477, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 434, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (478, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 435, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (479, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 438, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (480, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 439, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (481, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 440, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (482, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 441, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (483, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 442, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (484, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 443, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (485, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 444, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (486, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 445, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (487, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 446, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (488, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 447, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (489, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 448, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (490, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 449, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (491, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 450, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (492, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 451, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (493, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 452, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (494, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 453, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (495, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 454, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (496, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 455, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (497, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 456, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (498, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 457, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (499, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 458, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (500, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 459, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (501, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 460, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (502, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 461, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (503, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 462, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (504, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 463, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (505, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 464, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (506, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 465, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (507, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 466, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (508, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 467, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (509, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 468, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (510, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 469, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (511, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 470, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (512, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 471, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (513, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 472, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (514, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 473, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (515, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 474, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (516, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 475, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (517, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 476, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (518, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 477, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (519, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 478, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (520, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 479, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (521, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 480, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (522, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 481, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (523, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 482, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (524, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 483, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (525, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 484, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (526, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 485, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (527, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 486, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (528, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 487, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (529, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 488, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (530, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 489, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (531, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 490, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (532, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 491, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (533, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 492, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (534, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 493, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (535, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 494, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (536, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 495, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (537, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 496, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (538, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 497, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (539, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 498, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (540, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 499, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (541, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 500, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (542, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 501, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (543, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 502, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (544, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 503, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (545, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 504, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (546, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 505, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (547, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 506, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (548, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 507, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (549, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 508, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (550, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 509, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (551, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 510, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (552, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 511, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (553, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 512, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (554, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 513, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (555, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 514, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (556, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 515, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (557, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 516, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (558, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 517, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (559, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 518, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (560, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 519, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (561, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 520, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (562, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 521, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (563, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 522, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (564, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 523, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (565, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 524, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (566, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 525, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (567, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 526, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (568, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 527, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (569, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 528, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (570, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 529, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (571, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 530, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (572, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 531, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (573, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 532, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (574, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 533, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (575, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 534, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (576, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 535, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (577, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 536, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (578, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 537, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (579, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 538, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (580, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 539, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (581, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 540, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (582, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 541, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (583, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 542, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (584, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 543, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (585, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 544, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (586, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 545, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (587, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 546, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (588, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 547, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (589, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 548, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (590, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 549, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (591, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 550, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (592, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 551, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (593, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 552, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (594, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 553, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (595, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 554, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (596, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 555, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (597, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 556, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (598, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 557, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (599, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 558, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (600, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 559, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (601, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 560, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (602, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 561, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (603, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 562, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (604, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 563, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (605, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 564, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (606, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 565, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (607, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 566, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (608, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 567, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (609, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 568, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (610, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 569, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (611, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 570, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (612, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 571, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (613, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 572, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (614, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 573, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (615, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 574, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (616, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 575, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (617, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 576, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (618, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 577, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (619, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 578, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (620, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 579, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (621, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 580, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (622, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 581, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (623, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 582, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (624, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 583, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (625, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 584, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (626, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 585, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (627, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 586, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (628, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 587, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (629, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 588, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (630, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 589, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (631, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 590, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (632, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 591, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (633, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 592, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (634, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 593, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (635, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 594, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (636, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 595, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (637, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 596, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (638, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 597, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (639, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 599, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (640, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 600, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (641, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 601, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (642, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 602, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (643, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 603, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (644, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 604, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (645, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 605, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (646, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 606, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (647, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 607, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (648, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 608, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (649, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 609, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (650, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 610, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (651, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 611, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (652, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 612, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (653, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 613, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (654, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 614, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (655, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 615, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (656, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 616, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (657, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 617, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (658, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 618, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (659, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 619, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (660, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 620, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (661, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 621, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (662, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 622, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (663, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 623, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (664, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 624, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (665, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 625, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (666, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 626, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (667, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 627, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (668, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 628, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (669, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 629, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (670, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 630, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (671, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 631, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (672, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 632, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (673, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 634, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (674, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 635, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (675, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 636, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (676, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 637, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (677, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 638, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (678, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 639, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (679, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 640, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (680, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 641, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (681, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 642, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (682, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 643, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (683, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 644, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (684, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 645, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (685, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 646, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (686, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 647, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (687, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 648, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (688, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 649, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (689, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 650, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (690, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 651, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (691, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 652, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (692, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 653, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (693, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 654, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (694, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 655, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (695, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 656, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (696, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 657, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (697, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 658, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (698, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 659, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (699, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 660, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (700, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 661, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (701, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 662, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (702, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 663, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (703, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 664, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (704, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 665, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (705, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 666, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (706, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 667, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (707, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 667, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (708, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 668, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (709, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 669, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (710, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 670, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (711, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 671, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (712, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 672, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (713, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 673, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (714, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 674, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (715, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 675, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (716, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 676, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (717, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 677, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (718, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 678, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (719, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 679, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (720, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 680, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (721, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 682, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (722, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 683, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (723, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 684, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (724, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 685, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (725, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 686, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (726, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 689, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (727, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 690, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (728, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 691, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (729, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 692, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (730, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 693, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (731, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 694, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (732, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 695, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (733, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 696, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (734, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 697, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (735, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 698, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (736, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 699, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (737, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 699, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (738, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 700, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (739, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 701, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (740, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 702, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (741, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 703, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (742, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 704, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (743, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 705, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (744, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 706, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (745, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 707, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (746, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 708, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (747, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 709, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (748, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 710, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (749, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 711, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (750, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 712, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (751, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 713, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (752, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 714, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (753, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 715, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (754, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 716, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (755, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 717, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (756, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 718, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (757, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 719, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (758, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 720, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (759, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 721, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (760, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 722, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (761, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 723, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (762, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 724, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (763, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 725, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (764, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 726, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (765, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 727, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (766, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 728, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (767, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 729, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (768, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 730, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (769, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 731, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (770, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 732, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (771, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 733, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (772, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 734, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (773, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 735, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (774, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 736, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (775, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 737, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (776, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 738, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (777, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 739, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (778, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 740, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (779, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 741, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (780, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 742, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (781, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 743, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (782, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 744, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (783, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 745, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (784, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 746, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (785, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 747, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (786, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 748, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (787, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 749, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (788, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 750, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (789, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 751, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (790, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 752, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (791, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 753, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (792, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 754, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (793, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 755, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (794, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 756, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (795, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 757, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (796, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 758, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (797, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 759, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (798, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 760, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (799, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 761, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (800, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 762, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (801, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 763, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (802, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 764, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (803, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 765, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (804, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 766, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (805, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 767, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (806, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 768, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (807, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 769, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (808, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 770, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (809, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 771, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (810, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 772, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (811, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 773, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (812, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 774, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (813, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 775, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (814, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 776, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (815, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 777, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (816, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 778, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (817, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 779, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (818, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 780, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (819, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 781, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (820, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 782, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (821, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 783, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (822, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 784, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (823, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 785, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (824, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 786, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (825, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 787, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (826, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 788, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (827, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 789, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (828, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 790, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (829, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 791, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (830, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 792, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (831, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 793, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (832, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 794, 1)
GO
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (833, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 795, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (834, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 796, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (835, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 797, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (836, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 798, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (837, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 799, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (838, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 800, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (839, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 801, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (840, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 802, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (841, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 803, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (842, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 804, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (843, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 805, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (844, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 806, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (845, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 807, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (846, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 808, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (847, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 809, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (848, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 810, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (849, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 811, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (850, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 812, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (851, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 813, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (852, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 814, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (853, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 815, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (854, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 816, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (855, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 817, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (856, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 818, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (857, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 819, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (858, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 820, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (859, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 821, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (860, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 822, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (861, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 823, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (862, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 824, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (863, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 825, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (864, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 826, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (865, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 827, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (866, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 828, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (867, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 829, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (868, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 830, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (869, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 831, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (870, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 832, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (871, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 833, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (872, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 834, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (873, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 835, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (874, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 836, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (875, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 837, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (876, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 838, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (877, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 839, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (878, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 840, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (879, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 841, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (880, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 842, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (881, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 843, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (882, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 844, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (883, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 845, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (884, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 846, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (885, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 847, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (886, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 848, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (887, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 849, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (888, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 850, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (889, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 851, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (890, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 852, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (891, N'12 St.', N'1', N'1618862408224AvatarDefault.jpg', 853, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (892, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 1, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (893, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 2, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (894, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 3, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (895, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 11, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (896, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 12, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (897, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 13, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (898, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 21, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (899, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 22, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (900, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 23, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (901, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 707, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (902, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 708, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (903, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 709, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (904, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 712, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (905, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 713, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (906, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 714, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (907, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 717, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (908, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 718, 1)
INSERT [dbo].[Are] ([AreID], [AreName], [AreLetter], [Avatar], [DistrictID], [Active]) VALUES (909, N'34 St.', N'3', N'1618862408224AvatarDefault.jpg', 719, 1)
SET IDENTITY_INSERT [dbo].[Are] OFF
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0ad68e9c-faca-45fb-a51e-92bc6b94f12d', N'nero@gnail.com', N'NERO@GNAIL.COM', N'nero@gnail.com', N'NERO@GNAIL.COM', 0, N'AQAAAAEAACcQAAAAEBoI5bSoPlhsaJ+kmce4ju9mfytjY1SbckwppSjP6+nwODPw16ZO8Hq9QFcOa5zT0Q==', N'LQGK22WT5TTXDCY5PQ5SAOMBY7MT5TU7', N'4cfe39d9-caaf-424f-b954-c443fe5e84f6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1513f17e-1217-444e-8666-2f0860163f7d', N'seller1999@gmail.com', N'SELLER1999@GMAIL.COM', N'seller1999@gmail.com', N'SELLER1999@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEt1acXM/NXHrN0wKBBQ7oaz3NQGhz7QEsIoBAe09xtTlytdvQ4GIM8ZMCBOCZ1/HQ==', N'JOHXXJH3V36XWIALG4E3YTMWR4JXMRUM', N'2a606214-3b15-4549-90e5-126be164bd2a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1681bf69-bfa5-4ce1-ade7-995d17e69c5a', N'charlotte@gmail.com', N'CHARLOTTE@GMAIL.COM', N'charlotte@gmail.com', N'CHARLOTTE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAlGDVXZQxqBcSuYsmQ4AhbZ3fSadRqLLfsFoa0aJhdHtVnXwJAPujHdiS2DcJ2lDw==', N'ZFO6JUJ4VWWGZZ4EENVEXMOBHLEIHWQU', N'2bb7bff5-4e99-4369-8b71-97aaf9e2d267', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1df04c6b-7ab3-4fda-ae1a-3839da006e57', N'ThanhTung@gmail.com', N'THANHTUNG@GMAIL.COM', N'ThanhTung@gmail.com', N'THANHTUNG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEP0wgHw0f7Z7qGGdwWBqHqyP7joRyQ0veSTtJ23Cx9sw9JULEWWw69ZGMGbDp+ZCxA==', N'OFA45FD5ECY35VQZTVIPLDIRTUJ4DXES', N'508cfcc0-a27a-4b6d-9327-b60fd79bf4a5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1ee7bc03-15ea-4b9b-bebf-e7833b6ce8b1', N'anne@gmail.com', N'ANNE@GMAIL.COM', N'anne@gmail.com', N'ANNE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJVvjf1TOC3MihIdZoayCTuJihOMdiBRoKYYHOrRRzlxH2iF0Z2Duas/ftmqLxaWTg==', N'M5N7MFDCLONCBONYIKY2L2PSXS734VMP', N'f86a0097-546c-43a3-922b-0f67816d6511', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2e3d03ab-9929-444f-99c9-db03ab87b937', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEERiPFuJTOonr1zgCImnaNOEuJLvyNn8c4+0oIknv5sRR2yieHCYmyXbynPD5os3IA==', N'TYU3LWHWL2OQS6FODCAODSUK5UFCL56D', N'8a5c9d01-7001-4eec-b009-4cc7c8625def', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3240ba1d-37f5-45a9-a2b6-535235d598c6', N'nero9911@gmail.com', N'NERO9911@GMAIL.COM', N'nero9911@gmail.com', N'NERO9911@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEGCT+t+j5pKcnB6DM7UUn0hUW+V5cKn3/iS760lHFcikELGeJa+ZjwqbPWT2qCtdg==', N'WD3KB4Z5JWVMAUGSLO5VL4JU6J44UHWP', N'8363d38e-3542-44b1-8f8e-978428aefabc', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3cb3f590-802e-425a-a567-d9da4ff4a4d2', N'nero@gmail.com', N'NERO@GMAIL.COM', N'nero@gmail.com', N'NERO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISGfreD2iOxcsNeUo9vBeVCsql9/Mt1bTqpbBOrsUo/+g5Sj20GI5Jg4YZ2XJHVDg==', N'7BHCLYYYKFP6ELVZKZK52KWXHNR2GU25', N'072bee8f-4497-44af-ade9-0988256cf0cf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4a2f5175-4cd4-4366-b988-5e9fa41aadbc', N'neo9921@gmail.com', N'NEO9921@GMAIL.COM', N'neo9921@gmail.com', N'NEO9921@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKs0jsuntsMiUPU5wG9LiPqFQ3ARSoX5LdSUCYg5v9LKvnvvZLioLwQl7xE0IR3wHQ==', N'LFOW5UE6YIVJKRVYUHZYT3ZYJGKG6M2B', N'4fa181a3-e15a-4e72-aab8-e34ec13750db', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4a8de314-7678-4c3b-b3f3-1127cac49db7', N'tungneo92001@gmail.com', N'TUNGNEO92001@GMAIL.COM', N'tungneo92001@gmail.com', N'TUNGNEO92001@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENrkueuz3n9EmEmyU4ZlO7RoAd7IBm+39QJ/jSAPFrhJBePxp2cfoBl4jOzmEcOgDw==', N'SWM5MIYCC2HEODKE75YOHDO2H65TZ3JV', N'8db982e7-33c9-4bb9-b50d-3d4afb98ce29', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'577ccc5b-20b4-4af8-a8f1-78b71eaa35c0', N'Tung@gmail.com', N'TUNG@GMAIL.COM', N'Tung@gmail.com', N'TUNG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPPPViIxD9ksPNv7oz2G/Y55DmhklKcv+3VOwTvn0axrFBR7ocUCygo9znlKbfiiSA==', N'LUN56TPQS22JXNF2V7QFNQB3LVNH6MCU', N'6f64e81d-82bb-482a-8793-ebe56b012de9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'72e928bb-b985-4ef3-9a26-4989afd38912', N'mohini@gmail.com', N'MOHINI@GMAIL.COM', N'mohini@gmail.com', N'MOHINI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFdW+V5EGIIVpuD6aBrAOB82Y6AUAQb3UYaP2dVqQDGTrUaVSCQiYJDgrIJqZgzKnA==', N'VF3B6M74J5UAZ3ZLTXU52HQNJV2RIC2Y', N'f610a277-83f7-4897-8104-b3e1efff5285', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7be800f2-d5d3-4f1a-9d90-2bab35a87451', N'neo@gmail.com', N'NEO@GMAIL.COM', N'neo@gmail.com', N'NEO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOKpnvBZXW26APij/X0VjW+BcrO8/qMw6+MwizSmId7RRfVbWCTF8Al1JaQqzPLWSA==', N'T2L33Q3BJEUV2E2VYUWVH7OOSZDROPMX', N'5b75cbb8-7c16-4529-b276-cda93bb0a3b9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7e1bff8f-99d4-4710-b940-400a90b0eefe', N'lehuy123@gmail.com', N'LEHUY123@GMAIL.COM', N'lehuy123@gmail.com', N'LEHUY123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIEUIThAG+Azdhp+DHqdUGFtuoxZpc1+DAcJGE8XVGzIJv2GBP62OhIZN46Zv0wKQQ==', N'7MBNLJM3T5MOE7V3KBWU5JLXPNGUFALE', N'd6c1f550-3cb8-49af-b207-f3a9dfe4b1cd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'80d9ad3a-3493-4c83-9179-c56043f56d45', N'neo9911@gmail.com', N'NEO9911@GMAIL.COM', N'neo9911@gmail.com', N'NEO9911@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL8Cx6fCwxjKmzrXc70q0Qvo6GVi9vhzvhReP4P9vHjchEUfra2hKiciZqNKiU2aLQ==', N'FP2VBE2AXPBUBEZUD52MIBZ3C4FJB6NC', N'a10dbc65-4d23-4ba7-bf62-5d06551098db', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9124ca19-f4fb-4002-ab33-5287c804b16e', N'abc123@gmail.com', N'ABC123@GMAIL.COM', N'abc123@gmail.com', N'ABC123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIpcSdgL5lVhYaux7NrmSUJEL2E7El85zzE507LjF8BiEIj44/UE0AzHrPuzuFZMLw==', N'VQ4VJKLMXRPU4DEEX5IU272RGEISESM5', N'b126d2c4-7cee-402b-9e18-c04d9939b91a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a4ec0c31-8472-4d8f-859d-63820b27b020', N'davina@gmail.com', N'DAVINA@GMAIL.COM', N'davina@gmail.com', N'DAVINA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKXV+wPDDU25hld6C4h5z+k8CmKZg8mb8zcdhpt+NTxsqnLeaVwun9IovYvKZyXVAQ==', N'IJRL4XLNUZSU2QLWGYWAE7HMY3ZQHG7H', N'8e1c802e-ecf5-4304-abc1-5b9b924faeb2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a8f0b6f5-0329-4665-ba79-18850b896554', N'nero9921@gmail.com', N'NERO9921@GMAIL.COM', N'nero9921@gmail.com', N'NERO9921@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECsiEYCMyyydnAWNypTfbw3VtOmhT8SgO7Y8tornjVK/l+WtT4oAnAAj0Dxqedh8LA==', N'J2OBLMN462EHTFZCFMPPLD22EB6NKSJU', N'51d0852c-09f1-46d2-b62b-48f7717d6e4a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b1e90c33-4c35-4fe0-97ed-56a1153313d0', N'huy123@gmail.com', N'HUY123@GMAIL.COM', N'huy123@gmail.com', N'HUY123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED3JELAgE8XhH2Fd6qn5pqDLpEVzy8JoH2pECFx48I7Bt9d8GcbYyRaC9i26ZaWWrw==', N'VDZBG75V7ZVFEDGTPBIR5UEW5J5XQKIH', N'504836da-d912-46c9-beaa-802f6d96a45e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b4f9bd8b-c69b-46aa-be52-50cea2c27cef', N'tuan@gmail.com', N'TUAN@GMAIL.COM', N'tuan@gmail.com', N'TUAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEA3VGJg0RsabQ+PfScyJQmibuqrM+eo1KnSeHdNC5E5Q48QM08EHLsgH9K2Un6bodw==', N'NQORQS6SFICW4QRGPZK4HL6MS7ORMLHF', N'4601911a-e01b-4b38-9343-ae64837d78c5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c83d9445-d5e0-4b6f-86ad-57eba78a6de4', N'seller@gmail.com', N'SELLER@GMAIL.COM', N'seller@gmail.com', N'SELLER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBVrzEcx4lq94mmALxSp1ES5pqfxsed5KB5glLqH3lla8Iz1HSivhLWavSxEm7FtcA==', N'ZFRJVUT2PZLLW4JHQQDXKGYL3BMVZOLL', N'1f3b74ef-8d9f-4a40-868a-2b356573bbfc', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c989c905-2082-4cf1-af95-eb0a284bcb87', N'june@gmail.com', N'JUNE@GMAIL.COM', N'june@gmail.com', N'JUNE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPqYOnyWJlK/IBx+2hKMKiLvTwCggaqIXBdzInsPu8jCDOetQw6AOBIbLfhwGg5Q5A==', N'WZZ4ZQTPQCTYUBOQWGOS6HDAXLKNGVT4', N'33a831d7-05fc-473d-afed-634b713c7b34', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e061aac8-d513-42f9-a15e-2059f9ab7a9d', N'binh@gmail.com', N'BINH@GMAIL.COM', N'binh@gmail.com', N'BINH@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECLLfbv/2Q0Sz6h1975e3oujunf4J7RzLOBl+5GmUTLf/3sc1PRL0RJRCHC3yMt1UA==', N'RJCTB23PX3U2HSXDR7T63XJUEWR5HPQY', N'7ee50be2-603c-4fed-bcf4-0063399f4f0a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e3671476-9e7a-4be6-915b-4d6c6cc9fbcb', N'tungneo092001@gmail.com', N'TUNGNEO092001@GMAIL.COM', N'tungneo092001@gmail.com', N'TUNGNEO092001@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMwXX52rsqe+8Gu/kaEa7scPKhdhkb36uD6pTtDOHb0c1HHYunSDDP/7OZvvKXRlmw==', N'Y23MRHEQ7W363HJ4OZ2CMEDHLQJPCSAT', N'ec11b155-9d4e-40d3-ba1c-0c7b294e3d33', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'efd7efbb-d76e-4d00-b879-bfa437ff4eb7', N'seller2k1@gmail.com', N'SELLER2K1@GMAIL.COM', N'seller2k1@gmail.com', N'SELLER2K1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEN/HWdknh1th/Z4nSflnu1kRbU0jvr3UBdjujV3iFrlaEPlqgfdlZQWTqvBiOgyjQA==', N'REBZSQPJGNYY53A4QIVD5DRUKZA6MEJD', N'5759e0a0-172c-4687-88c5-0aa66ff1b1af', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f20d4de2-fcb7-45f3-8a9b-9074b95fe413', N'tungneo09092001@gmail.com', N'TUNGNEO09092001@GMAIL.COM', N'tungneo09092001@gmail.com', N'TUNGNEO09092001@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ4Qas6HfA7nHq0oV0ScAK4IKv7FaP1213Q7W2v5IFq9Z0jhfNuGuSg5HOOpZDiwSA==', N'LZ5AKMXNCIL7Y6VQIUBHW2ZS4YTE2RLW', N'58ca50fe-ebd1-45ba-b961-fc3112352e59', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fa6996e6-7c9b-4d5b-93df-dac475fe6995', N'dakshi@gmail.com', N'DAKSHI@GMAIL.COM', N'dakshi@gmail.com', N'DAKSHI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENctZSKsrthbxuVNsUjHIJ5ql+GkbZu/xSgxz/yS+bXPU8A5+ual8/UP8SBTEQcHwQ==', N'U34KZXALCA7BK52PIUWCFODGKYN7MSLM', N'2f43b849-51c3-4439-891a-b4f18503c8ff', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fb53333e-d17f-444f-bdd1-0cbb32e2252f', N'josie@gmail.com', N'JOSIE@GMAIL.COM', N'josie@gmail.com', N'JOSIE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHyQ0Y8NuI70PKrhQ4jKSFENJwLHznfh42fyBTzEW3/wUTI2TwybffGBXF+qrAipUw==', N'HT5RRTQKUD3OKUG4OR7KC7EB4W4U66BV', N'194a30c1-0148-4be3-8d7a-e28cb57354f3', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (1, N'House', N'House', N'1618836256707Residential.jpg', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (2, N'Rent', N'Rent', N'1618836245620Commercial.jpg', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (3, N'Industrial', N'Industrial', N'1618021891744Industrial.jpg', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (4, N'Apartment', N'Apartment', N'1618021939287Apartment.jfif', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (5, N'Land', N'Land', N'1618021981901Land.jfif', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (7, N'Communal land', N'Communal land', N'1618024471162Communal land.jpg', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1, N'Dien Bien', N'Đ', N'1618808585842DienBien.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (2, N'Hoa Binh', N'H', N'1618808595491HoaBinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (3, N'Lai Chau', N'L', N'1618808963558LaiChau.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (4, N'Lao Cai', N'L', N'https://localhost:44338/images/address/Cities/1618808971331LaoCai.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (5, N'Son La', N'S', N'1618809139840SonLa.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (6, N'Yen Bai', N'Y', N'1618831748195YenBai.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (7, N'Bac Giang', N'B', N'1618831754790BacGiang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (8, N'Bac Kan', N'B', N'1618831762434BacKan.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (9, N'Cao Bang', N'C', N'1618831768332CaoBang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (10, N'Ha Giang', N'H', N'1618831777318HaGiang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (11, N'Lang Son', N'L', N'1618831787183LangSon.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (12, N'Phu Tho', N'P', N'1618831793292PhuTho.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (13, N'Quang Ninh', N'Q', N'1618831801664QuangNinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (14, N'Thai Nguyen', N'T', N'1618831809199ThaiNguyen.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (15, N'Tuyen Quang', N'T', N'1618831814526TuyenQuang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (16, N'Ha Noi', N'H', N'1618831822982HaNoi.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (17, N'Hai Phong', N'H', N'1618831829519HaiPhong.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (18, N'Bac Ninh', N'B', N'1618831837058BacNinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (19, N'Ha Nam', N'H', N'1618831844692HaNam.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (20, N'Hai Duong', N'H', N'1618831854059HaiDuong.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (21, N'Hung Yen', N'H', N'1618831862575HungYen.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (22, N'Nam Dinh', N'N', N'1618831869546NamDinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (23, N'Ninh Binh', N'N', N'1618831877328NinhBinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (24, N'Thai Binh', N'T', N'1618831884418ThaiBinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (25, N'Vinh Phuc', N'V', N'1618831890861VinhPhuc.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (26, N'Ha Tinh', N'H', N'1618831903050HaTinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (27, N'Nghe An', N'N', N'1618831908598NgheAN.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (28, N'Quang Binh', N'Q', N'1618831914185QuangBinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (29, N'Quang Tri', N'Q', N'1618831921544QuangTri.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (30, N'Thanh Hoa', N'T', N'https://localhost:44338/images/address/Cities/1618831927467ThanhHoa.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (31, N'Thua Thien – Hue', N'T', N'1618831936671Hue.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (32, N'Dak Lak', N'Đ', N'1618831941678DakLak.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (33, N'Dak Nong', N'Đ', N'1618831947874DakNong.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (34, N'Gia Lai', N'G', N'1618831953994GiaLai.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (35, N'Kon Tum', N'K', N'1618831959618KonTum.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (36, N'Lam Dong', N'L', N'1618831971816LamDong.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (37, N'Da Nang', N'Đ', N'1618831980301DaNang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (38, N'Binh Dinh', N'B', N'1618831987567BinhDinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (39, N'Binh Thuan', N'B', N'1618831994912BinhThuan.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (40, N'Khanh Hoa', N'K', N'1618832003710KhanhHoa.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (41, N'Ninh Thuan', N'N', N'1618832012842NinhThuan.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (42, N'Phu Yen', N'P', N'1618832018014PhuYen.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (43, N'Quang Nam', N'Q', N'1618832025273QuangNam.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (44, N'Quang Ngai', N'Q', N'1618832031793QuangNgai.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (45, N'Ho Chi Minh City', N'T', N'1618832037516TPHCM.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (46, N'Ba Ria – Vung Tau', N'B', N'1618832046260BaRiaVungTau.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (47, N'Binh Duong', N'B', N'1618832051731BinhDuong.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (48, N'Binh Phuoc', N'B', N'1618832058293BinhPhuoc.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (49, N'Đong Nai', N'Đ', N'1618832065291DongNai.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (50, N'Tay Ninh', N'T', N'1618832071126TayNinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (51, N'Can Tho', N'C', N'1618832078621CanTho.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (52, N'An Giang', N'A', N'1618832083184AnGiang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (53, N'Bac Lieu', N'B', N'1618832090646BacLieu.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (54, N'Ben Tre', N'B', N'1618832096231BenTre.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (55, N'Ca Mau', N'C', N'1618832104478CaMau.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (56, N'Đong Thap', N'Đ', N'1618832113649DongThap.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (57, N'Hau Giang', N'H', N'1618832119098HauGiang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (58, N'Kien Giang', N'K', N'1618832124325KienGiang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (59, N'Long An', N'L', N'1618832129423LongAn.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (60, N'Soc Trang', N'S', N'1618832136051SocTrang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (61, N'Tien Giang', N'T', N'1618832146411TienGiang.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (62, N'Tra Vinh', N'T', N'1618832151605TraVinh.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (63, N'Vinh Long', N'V', N'1618832159479VinhLong.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (64, N'Attapeu', N'A', N'1618833037582Attapeu.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (65, N'Bokeo', N'B', N'1618833041773Bokeo.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (66, N'Bolikhamsai', N'B', N'1618833057351Bolikhamxai.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (67, N'Champasak', N'C', N'1618833068610Champasak.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (68, N'Huaphanh', N'H', N'1618833162213Huaphanh.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (69, N'Khammouane', N'K', N'1618833211288Khammouane.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (70, N'Luang Namtha', N'L', N'1618833223184Luang Namtha.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (71, N'Luang Prabang', N'L', N'1618833233332Luang Prabang.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (72, N'Oudomxay', N'	', N'1618833245645Oudomxay.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (73, N'Phongsaly', N'P', N'1618833259858Phongsaly.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (74, N'Sainyabuli', N'S', N'1618833645664Sainyabuli.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (75, N'Salavan', N'S', N'1618833685006Salavan.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (76, N'Savannakhet', N'S', N'1618833697697Savannakhet.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (77, N'Sekong', N'S', N'1618833710611Sekong.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (78, N'Vientiane Prefecture', N'V', N'1618833720511Vientiane Prefecture.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (79, N'Vientiane Province', N'V', N'1618833731073Vientiane Province.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (80, N'Xiengkhouang', N'X', N'1618833741036Xiengkhouang.png', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (81, N'Xaisomboun', N'X', N'1618833757561Xaisomboun.jpg', 2, 1)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (1, N'VietNam', N'V', N'1618806333315Vietnam.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (2, N'Laos', N'L', N'1618827429985Laos.jfif', 1, 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (1, N'Dien Bien Phu', N'D', N'https://localhost:44338/images/address/Districts/1618808371896DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (2, N'Muong Lay', N'M', N'1618808371896DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (3, N'Dien Bien', N'Đ', N'1618808408571DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (4, N'Dien Bien Dong', N'D', N'https://localhost:44338/images/address/Districts/1618808408571DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (5, N'Muong Ang', N'M', N'1618808408571DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (6, N'Muong Cha', N'M', N'1618808442851DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (7, N'Muong Nhe', N'M', N'1618808442851DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (8, N'Nam Po', N'N', N'1618808442851DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (9, N'Tua Chua', N'T', N'1618808442851DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (10, N'Tuan Giao', N'T', N'1618808442851DienBien.jpg', 1, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (11, N'Hoa Binh City', N'H', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (12, N'Cao Phong', N'C', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (13, N'Da Bac', N'Đ', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (14, N'Kim Boi', N'K', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (15, N'Lac Son', N'L', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (16, N'Lac Thuy', N'L', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (17, N'Luong Son', N'L', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (18, N'Mai Chau', N'M', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (19, N'Tan Lac', N'T', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (20, N'Yen Thuy', N'Y', N'1618808507894HoaBinh.jpg', 2, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (21, N'Lai Chau City', N'L', N'1618808792213LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (22, N'Muong Te', N'M', N'1618808792213LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (23, N'Nam Nhun', N'N', N'1618808792213LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (24, N'Phong Tho', N'P', N'1618808854101LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (25, N'Sin Ho', N'S', N'1618808854101LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (26, N'Tam Duong', N'T', N'1618808854101LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (27, N'Tan Uyen', N'T', N'1618808854101LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (28, N'Than Uyen', N'T', N'1618808904362LaiChau.jpg', 3, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (29, N'Lao Cai City', N'L', N'1618808997987LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (30, N'Sa Pa', N'S', N'1618808997987LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (31, N'Bat Xat', N'B', N'1618808997987LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (32, N'Bao Thang', N'B', N'1618809037798LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (33, N'Bao Yen', N'B', N'1618809037798LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (34, N'Bac Ha', N'B', N'1618809037798LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (35, N'Muong Khuong', N'M', N'1618809037798LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (36, N'Si Ma Cai', N'S', N'1618809037798LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (37, N'Van Ban', N'V', N'1618809037798LaoCai.jpg', 4, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (38, N'Son La City', N'S', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (39, N'Bac Yen', N'B', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (40, N'Mai Son', N'M', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (41, N'Moc Chau', N'M', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (42, N'Muong La', N'M', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (43, N'Phu Yen', N'P', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (44, N'Quynh Nhai', N'Q', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (45, N'Ma River', N'M', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (46, N'Sop Cop', N'S', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (47, N'Thuan Chau', N'T', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (48, N'Van Ho', N'V', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (49, N'Yen Chau', N'Y', N'1618809161790SonLa.jpg', 5, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (50, N'Yen Bai City', N'Y', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (51, N'Nghia Lo', N'N', N'https://localhost:44338/images/address/Districts/1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (52, N'Luc Yen', N'L', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (53, N'Mu Cang Chai', N'M', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (54, N'Tram Tau', N'T', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (55, N'Tran Yen', N'T', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (56, N'Van Chan', N'V', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (57, N'Van Yen', N'V', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (58, N'Yen Binh', N'Y', N'1618809307100YenBai.jpg', 6, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (59, N'Bac Giang City', N'B', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (60, N'Hiep Hoa', N'H', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (61, N'Lang Giang', N'L', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (62, N'Luc Nam', N'L', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (63, N'Luc Ngan', N'L', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (64, N'Son Đong', N'S', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (65, N'Tan Yen', N'T', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (66, N'Viet Yen', N'V', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (67, N'Yen Dung', N'Y', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (68, N'Yen The', N'Y', N'1618809434549BacGiang.jpg', 7, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (69, N'Bac Kan City', N'B', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (70, N'Ba Be', N'B', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (71, N'Bach Thong', N'B', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (72, N'Don Market', N'C', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (73, N'Moi Market', N'C', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (74, N'Na Ri', N'N', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (75, N'Ngan Son', N'N', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (76, N'Pac Nam', N'P', N'1618809628953BacKan.jpg', 8, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (77, N'Cao Bang City', N'C', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (78, N'Bao Lac', N'B', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (79, N'Bao Lam', N'B', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (80, N'Ha Lang', N'H', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (81, N'Ha Quang', N'H', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (82, N'Hoa An', N'H', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (83, N'Nguyen Binh', N'N', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (84, N'Quang Hoa', N'Q', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (85, N'Thach An', N'T', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (86, N'Trung Khanh', N'T', N'1618809771148CaoBang.jpg', 9, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (87, N'Ha Giang City', N'H', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (88, N'Bac Me', N'B', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (89, N'Bac Quang', N'B', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (90, N'Đong Van', N'Đ', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (91, N'Hoang Su Phi', N'H', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (92, N'Meo Vac', N'M', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (93, N'Quan Ba', N'Q', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (94, N'Quang Binh', N'Q', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (95, N'Vi Xuyen', N'V', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (96, N'Xin Man', N'X', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (97, N'Yen Minh', N'Y', N'1618809899501HaGiang.jpg', 10, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (98, N'Lang Son City', N'L', N'1618810031793LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (99, N'Bac Son', N'B', N'1618810031793LangSon.jpg', 11, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (100, N'Binh Gia', N'B', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (101, N'Cao Loc', N'C', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (102, N'Chi Lang', N'C', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (103, N'Đinh Lap', N'Đ', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (104, N'Huu Lung', N'H', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (105, N'Loc Binh', N'L', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (106, N'Trang Đinh', N'T', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (107, N'Van Lang', N'V', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (108, N'Van Quan', N'V', N'1618810065435LangSon.jpg', 11, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (109, N'Viet Tri', N'V', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (110, N'Phu Tho', N'P', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (111, N' Cam Khe', N' ', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (112, N'Doan Hung', N'Đ', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (113, N'Ha Hoa', N'H', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (114, N'Lam Thao', N'L', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (115, N'Phu Ninh', N'P', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (116, N'Tam Nong', N'T', N'https://localhost:44338/images/address/Districts/1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (117, N'Tan Son', N'T', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (118, N'Thanh Ba', N'T', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (119, N'Thanh Son', N'T', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (120, N'Thanh Thuy', N'T', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (121, N'Yen Lap', N'Y', N'1618810183899PhuTho.jpg', 12, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (122, N'Ha Long', N'H', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (123, N'Cam Pha', N'C', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (124, N'Mong Cai', N'M', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (125, N'Uong Bi', N'U', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (126, N'Dong Trieu', N'Đ', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (127, N'Quang Yen', N'Q', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (128, N'Van Đon', N'V', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (129, N'Tien Yen', N'T', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (130, N'Hai Ha', N'H', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (131, N'Co To', N'C', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (132, N'Dam Ha', N'Đ', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (133, N'Binh Lieu', N'B', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (134, N'Ba Che', N'B', N'1618810331637QuangNinh.jpg', 13, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (135, N'Thai Nguyen City', N'T', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (136, N'Song Cong City', N'S', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (137, N'Pho Yen', N'P', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (138, N'Dai Tu', N'Đ', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (139, N'Dinh Hoa', N'Đ', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (140, N'Dong Hy', N'Đ', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (141, N'Phu Binh', N'P', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (142, N'Phu Luong', N'P', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (143, N'Vo Nhai', N'V', N'1618810496752ThaiNguyen.jpg', 14, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (144, N'Tuyen Quang City', N'T', N'1618810610745TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (145, N'Chiem Hoa', N'C', N'1618810610745TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (146, N'Ham Yen', N'H', N'1618810610745TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (147, N'Lam Binh', N'L', N'1618810656636TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (148, N'Na Hang', N'N', N'1618810656636TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (149, N'Son Duong', N'S', N'1618810656636TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (150, N'Yen Son', N'Y', N'1618810656636TuyenQuang.jpg', 15, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (151, N'Ba Dinh', N'B', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (152, N'Bac Tu Liem', N'B', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (153, N'Cau Giay', N'C', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (154, N'Dong Da', N'D', N'https://localhost:44338/images/address/Districts/1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (155, N'Ha Dong', N'H', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (156, N'Hai Ba Trung', N'H', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (157, N'Hoan Kiem', N'H', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (158, N'Hoang Mai', N'H', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (159, N'Long Bien', N'L', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (160, N'Nam Tu Liem', N'N', N'https://localhost:44338/images/address/Districts/1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (161, N'Tay Ho', N'T', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (162, N'Thanh Xuan', N'T', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (163, N'Son Tay', N'S', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (164, N'Ba Vi', N'B', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (165, N'Chuong My', N'C', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (166, N'Dan Phuong', N'Đ', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (167, N'Dong Anh', N'Đ', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (168, N'Gia Lam', N'G', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (169, N'Hoai Duc', N'H', N'https://localhost:44338/images/address/Districts/1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (170, N'Me Linh', N'M', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (171, N'My Duc', N'M', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (172, N'Phu Xuyen', N'P', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (173, N'Phuc Tho', N'P', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (174, N'Quoc Oai', N'Q', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (175, N'Soc Son', N'S', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (176, N'Thach That', N'T', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (177, N'Thanh Oai', N'T', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (178, N'Thanh Tri', N'T', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (179, N'Thuong Tin', N'T', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (180, N'Ung Hoa', N'Ứ', N'1618810749851HaNoi.jpg', 16, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (181, N'Do Son', N'Đ', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (182, N'Duong Kinh', N'D', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (183, N'Hai An', N'H', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (184, N'Hong Bang', N'H', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (185, N'Kien An', N'K', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (186, N'Le Chan', N'L', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (187, N'Ngo Quyen', N'N', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (188, N'An Duong', N'A', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (189, N'An Lao', N'A', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (190, N'Bach Long Vi', N'B', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (191, N'Cat Hai', N'C', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (192, N'Kien Thuy', N'K', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (193, N'Thuy Nguyen', N'T', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (194, N'Tien Lang', N'T', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (195, N'Vinh Bao', N'V', N'1618811005155HaiPhong.jpg', 17, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (196, N'Bac Ninh City', N'B', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (197, N'Tu Son', N'T', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (198, N'Gia Binh', N'G', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (199, N'Luong Tai', N'L', N'1618811189611BacNinh.jpg', 18, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (200, N'Que Vo', N'Q', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (201, N'Thuan Thanh', N'T', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (202, N'Tien Du', N'T', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (203, N'Yen Phong', N'Y', N'1618811189611BacNinh.jpg', 18, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (204, N'Phu Ly', N'P', N'1618811321002HaNam.jpg', 19, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (205, N'Duy Tien', N'D', N'1618811321002HaNam.jpg', 19, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (206, N'Binh Luc', N'B', N'1618811321002HaNam.jpg', 19, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (207, N'Kim Bang', N'K', N'1618811321002HaNam.jpg', 19, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (208, N'Ly Nhan', N'L', N'1618811321002HaNam.jpg', 19, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (209, N'Thanh Liem', N'T', N'1618811321002HaNam.jpg', 19, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (210, N'Hai Duong City', N'H', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (211, N'Chi Linh', N'C', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (212, N'Kinh Mon', N'K', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (213, N'Binh Giang', N'B', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (214, N'Cam Giang', N'C', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (215, N'Gia Loc', N'G', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (216, N'Kim Thanh', N'K', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (217, N'Nam Sach', N'N', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (218, N'Ninh Giang', N'N', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (219, N'Thanh Ha', N'T', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (220, N'Thanh Mien', N'T', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (221, N'Tu Ky', N'T', N'1618811452620HaiDuong.jpg', 20, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (222, N'Hung Yen City', N'H', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (223, N'My Hao', N'M', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (224, N'An Thi', N'Â', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (225, N'Khoai Chau', N'K', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (226, N'Kim Đong', N'K', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (227, N'Phu Cu', N'P', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (228, N'Tien Lu', N'T', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (229, N'Van Giang', N'V', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (230, N'Van Lam', N'V', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (231, N'Yen My', N'Y', N'1618811610554HungYen.jpg', 21, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (232, N'Nam Dinh', N'N', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (233, N' Giao Thuy', N' ', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (234, N'Hai Hau', N'H', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (235, N'My Loc', N'M', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (236, N'Nam Truc', N'N', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (237, N'Nghia Hung', N'N', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (238, N'Truc Ninh', N'T', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (239, N'Vu Ban', N'V', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (240, N'Xuan Truong', N'X', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (241, N'Y Yen', N'Ý', N'1618811744735NamDinh.jpg', 22, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (242, N'Ninh Binh City', N'N', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (243, N'Tam Diep City', N'T', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (244, N'Gia Vien', N'G', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (245, N'Hoa Lu', N'H', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (246, N'Kim Son', N'K', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (247, N'Nho Quan', N'N', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (248, N'Yen Khanh', N'Y', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (249, N'Yen Mo', N'Y', N'1618821594828NinhBinh.jpg', 23, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (250, N'Thai Binh City', N'T', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (251, N'Dong Hung', N'Đ', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (252, N'Hung Ha', N'H', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (253, N'Kien Xuong', N'K', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (254, N'Quynh Phu', N'Q', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (255, N'Thai Thuy', N'T', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (256, N'Tien Hai', N'T', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (257, N'Vu Thu', N'V', N'1618821698596ThaiBinh.jpg', 24, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (258, N'Vinh Yen', N'V', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (259, N'Phuc Yen', N'P', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (260, N'Binh Xuyen', N'B', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (261, N'Lap Thach', N'L', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (262, N'Lo River', N'S', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (263, N'Tam Dao', N'T', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (264, N'Tam Duong', N'T', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (265, N'Vinh Tuong', N'V', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (266, N'Yen Lac', N'Y', N'1618821788920VinhPhuc.jpg', 25, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (267, N'HaTinh City', N'H', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (268, N'Hong Linh', N'H', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (269, N'Ky Anh', N'K', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (270, N'Can Loc', N'C', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (271, N'Cam Xuyen', N'C', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (272, N'Duc Tho', N'Đ', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (273, N'Huong Khe', N'H', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (274, N'Huong Son', N'H', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (275, N'Ky Anh', N'K', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (276, N'Loc Ha', N'L', N'https://localhost:44338/images/address/Districts/1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (277, N'Nghi Xuan', N'N', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (278, N'Thach Ha', N'T', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (279, N'Vu Quang', N'V', N'1618821898428HaTinh.jpg', 26, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (280, N'Vinh', N'V', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (281, N'Cua Lo', N'C', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (282, N'Hoang Mai', N'H', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (283, N'Thai Hoa', N'T', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (284, N'Anh Son', N'A', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (285, N'Con Cuong', N'C', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (286, N'Dien Chau', N'D', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (287, N'Do Luong', N'Đ', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (288, N'Hung Nguyen', N'H', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (289, N'Ky Son', N'K', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (290, N'Nam Dan', N'N', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (291, N'Nghi Loc', N'N', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (292, N'Nghia Dan', N'N', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (293, N'Que Phong', N'Q', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (294, N'Quy Chau', N'Q', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (295, N'Quy Hop', N'Q', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (296, N'Quynh Luu', N'Q', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (297, N'Tan Ky', N'T', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (298, N'Thanh Chuong', N'T', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (299, N'Tuong Duong', N'T', N'1618822031298NgheAN.jpg', 27, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (300, N'Yen Thanh', N'Y', N'1618822031298NgheAN.jpg', 27, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (301, N'Dong Hoi', N'Đ', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (302, N'Ba Don', N'B', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (303, N'Bo Trach', N'B', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (304, N'Le Thuy', N'L', N'https://localhost:44338/images/address/Districts/1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (305, N'Minh Hoa', N'M', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (306, N'Quang Ninh', N'Q', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (307, N'Quang Trach', N'Q', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (308, N'Tuyen Hoa', N'T', N'1618822214323QuangBinh.jpg', 28, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (309, N'Dong Ha', N'D', N'https://localhost:44338/images/address/Districts/1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (310, N'Quang Tri', N'Q', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (311, N'Cam Lo', N'C', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (312, N'Con Co', N'C', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (313, N'Da Krong', N'Đ', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (314, N'Gio Linh', N'G', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (315, N'Hai Lang', N'H', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (316, N'Huong Hoa', N'H', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (317, N'Trieu Phong', N'T', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (318, N'Vinh Linh', N'V', N'1618822309168QuangTri.jpg', 29, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (319, N'Thanh Hoa City', N'T', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (320, N'Sam Son', N'S', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (321, N'Bim Son', N'B', N'https://localhost:44338/images/address/Districts/1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (322, N'Nghi Son', N'N', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (323, N'Ba Thuoc', N'B', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (324, N'Cam Thuy', N'C', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (325, N'Dong Son', N'Đ', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (326, N'Ha Trung', N'H', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (327, N'Hau Loc', N'H', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (328, N'Hoang Hoa', N'H', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (329, N'Lang Chanh', N'L', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (330, N'Muong Lat', N'M', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (331, N'Nga Son', N'N', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (332, N'Ngoc Lac', N'N', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (333, N'Nhu Thanh', N'N', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (334, N'Nhu Xuan', N'N', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (335, N'Nong Cong', N'N', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (336, N'Quan Hoa', N'Q', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (337, N'Quan Son', N'Q', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (338, N'Quang Xuong', N'Q', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (339, N'Thach Thanh', N'T', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (340, N'Thieu Hoa', N'T', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (341, N'Tho Xuan', N'T', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (342, N'Thuong Xuan', N'T', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (343, N'Trieu Son', N'T', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (344, N'Vinh Loc', N'V', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (345, N'Yen Dinh', N'Y', N'1618822425116ThanhHoa.jpg', 30, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (346, N'Hue', N'H', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (347, N'Huong Thuy', N'H', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (348, N'Huong Tra', N'H', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (349, N'A Luoi', N'A', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (350, N'Nam Dong', N'N', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (351, N'Phong Dien', N'P', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (352, N'Phu Loc', N'P', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (353, N'Phu Vang', N'P', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (354, N'Quang Dien', N'Q', N'1618822666917Hue.jpg', 31, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (355, N'Buon Ma Thuot', N'B', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (356, N'Buon Ho', N'B', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (357, N'Buon Don', N'B', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (358, N'Cu Kuin', N'C', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (359, N'Cu M''gar', N'C', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (360, N'Ea H''leo', N'E', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (361, N'Ea Kar', N'E', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (362, N'Ea Sup', N'E', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (363, N'Krong Ana', N'K', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (364, N'Krong Bong', N'K', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (365, N'Krong Buk', N'K', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (366, N'Krong Nang', N'K', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (367, N'Krong Pac', N'K', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (368, N'Lak', N'L', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (369, N'M''Đrak', N'M', N'1618822768956DakLak.jpg', 32, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (370, N'Gia Nghia', N'G', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (371, N'Cư Jut', N'C', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (372, N'Đak Glong', N'Đ', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (373, N'Đak Mil', N'Đ', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (374, N'Đak R''lap', N'Đ', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (375, N'Đak Song', N'Đ', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (376, N'Krong No', N'K', N'1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (377, N'Tuy Duc', N'T', N'https://localhost:44338/images/address/Districts/1618822930460DakNong.jpg', 33, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (378, N'Pleiku', N'P', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (379, N'An Khe', N'A', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (380, N'Ayun Pa', N'A', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (381, N'Chu Pah', N'C', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (382, N'Chu Prong', N'C', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (383, N'Chu Puh', N'C', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (384, N'Chu Se', N'C', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (385, N'Dak Doa', N'Đ', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (386, N'Dak Po', N'Đ', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (387, N'Duc Co', N'D', N'1618861008870GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (388, N'Ia Grai', N'I', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (389, N'Ia Pa', N'I', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (390, N'Kbang', N'K', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (391, N'Kong Chro', N'K', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (392, N'Krong Pa', N'K', N'https://localhost:44338/images/address/Districts/1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (393, N'Mang Yang', N'M', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (394, N'Phu Thien', N'P', N'1618823090886GiaLai.jpg', 34, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (395, N'Kon Tum', N'K', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (396, N'Dak Glei', N'Đ', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (397, N'Dak Ha', N'D', N'1618861022446KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (398, N'Dak To', N'Đ', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (399, N'Ia H''Drai', N'I', N'1618823241797KonTum.jpg', 35, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (400, N'Kon Plong', N'K', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (401, N'Kon Ray', N'K', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (402, N'Ngoc Hoi', N'N', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (403, N'Sa Thay', N'S', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (404, N'Tu Mo Rong', N'T', N'1618823241797KonTum.jpg', 35, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (405, N'Da Lat', N'Đ', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (406, N'Bao Loc', N'B', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (407, N'Bao Lam', N'B', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (408, N'Cat Tien', N'C', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (409, N'Di Linh', N'D', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (410, N'Da Huoai', N'Đ', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (411, N'Da Teh', N'D', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (412, N'Dam Rong', N'Đ', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (413, N'Don Duong', N'Đ', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (414, N'Duc Trong', N'Đ', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (415, N'Lac Duong', N'L', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (416, N'Lam Ha', N'L', N'1618823358199LamDong.jpg', 36, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (417, N'Cam Le', N'C', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (418, N'Hai Chau', N'H', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (419, N'Lien Chieu', N'L', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (420, N'Ngu Hanh Son', N'N', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (421, N'Son Tra', N'S', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (422, N'Thanh Khe', N'T', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (423, N'Hoa Vang', N'H', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (424, N'Hoang Sa', N'H', N'1618823486460DaNang.jpg', 37, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (425, N'Quy Nhon', N'Q', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (426, N'An Nhon', N'A', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (427, N'Hoai Nhon', N'H', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (428, N'An Lao', N'A', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (429, N'Hoai An', N'H', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (430, N'Phu Cat', N'P', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (431, N'Phu My', N'P', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (432, N'Tay Son', N'T', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (433, N'Tuy Phuoc', N'T', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (434, N'Van Canh', N'V', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (435, N'Vinh Thanh', N'V', N'1618823596485BinhDinh.jpg', 38, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (438, N'Phan Thiet', N'P', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (439, N'La Gi', N'L', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (440, N'Bac Binh', N'B', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (441, N'Duc Linh', N'Đ', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (442, N'Ham Tan', N'H', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (443, N'Ham Thuan Bac', N'H', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (444, N'Ham Thuan Nam', N'H', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (445, N'Phu Quy', N'P', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (446, N'Tanh Linh', N'T', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (447, N'Tuy Phong', N'T', N'1618823798358BinhThuan.jpg', 39, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (448, N'Nha Trang', N'N', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (449, N'Cam Ranh', N'C', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (450, N'Ninh Hoa', N'N', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (451, N'Van Ninh', N'V', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (452, N'Dien Khanh', N'D', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (453, N'Khanh Vinh', N'K', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (454, N'Khanh Son', N'K', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (455, N'Cam Lam', N'C', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (456, N'Truong Sa', N'T', N'1618823930046KhanhHoa.jpg', 40, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (457, N'Phan Rang – Thap Cham', N'P', N'https://localhost:44338/images/address/Districts/1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (458, N'Bac Ai', N'B', N'1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (459, N'Ninh Hai', N'N', N'1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (460, N'Ninh Phuoc', N'N', N'1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (461, N'Ninh Son', N'N', N'1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (462, N'Thuan Bac', N'T', N'1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (463, N'Thuan Nam', N'T', N'1618824042577NinhThuan.jpg', 41, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (464, N'Tuy Hoa', N'T', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (465, N'Dong Hoa', N'Đ', N'https://localhost:44338/images/address/Districts/1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (466, N'Song Cau', N'S', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (467, N'Dong Xuan', N'Đ', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (468, N'Phu Hoa', N'P', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (469, N'Son Hoa', N'S', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (470, N'Song Hinh', N'S', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (471, N'Tay Hoa', N'T', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (472, N'Tuy An', N'T', N'1618824137094PhuYen.jpg', 42, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (473, N'Tam Ky', N'T', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (474, N'Hoi An', N'H', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (475, N'Dien Ban', N'Đ', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (476, N'Bac Tra My', N'B', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (477, N'Dai Loc', N'Đ', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (478, N'Dong Giang', N'Đ', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (479, N'Duy Xuyen', N'D', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (480, N'Hiep Duc', N'H', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (481, N'Nam Giang', N'N', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (482, N'Nam Tra My', N'N', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (483, N'Nong Son', N'N', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (484, N'Nui Thanh', N'N', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (485, N'Phu Ninh', N'P', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (486, N'Phuoc Son', N'P', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (487, N'Que Son', N'Q', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (488, N'Tay Giang', N'T', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (489, N'Thang Binh', N'T', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (490, N'Tien Phuoc', N'T', N'1618824244522QuangNam.jpg', 43, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (491, N'Quang Ngai City', N'Q', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (492, N'Duc Pho', N'Đ', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (493, N'Ba To', N'B', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (494, N'Binh Son', N'B', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (495, N'Ly Son', N'L', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (496, N'Minh Long', N'M', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (497, N'Mo Duc', N'M', N'https://localhost:44338/images/address/Districts/1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (498, N'Nghia Hanh', N'N', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (499, N'Son Ha', N'S', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (500, N'Son Tay', N'S', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (501, N'Son Tinh', N'S', N'1618824532455QuangNgai.jpg', 44, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (502, N'Tra Bong', N'T', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (503, N'Tu Nghia', N'T', N'1618824532455QuangNgai.jpg', 44, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (504, N'Thu Duc', N'T', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (505, N'District 1', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (506, N'District 3', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (507, N'District 4', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (508, N'District 5', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (509, N'District 6', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (510, N'District 7', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (511, N'District 8', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (512, N'District 10', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (513, N'District 11', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (514, N'District 12', N'D', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (515, N'Binh Tan', N'B', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (516, N'Binh Thanh', N'B', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (517, N'Go Vap', N'G', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (518, N'Phu Nhuan', N'P', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (519, N'Tan Binh', N'T', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (520, N'Tan Phu', N'T', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (521, N'Binh Chanh', N'B', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (522, N'Can Gio', N'C', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (523, N'Cu Chi', N'C', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (524, N'Hooc Mon', N'H', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (525, N'Nha Be', N'N', N'1618824709052TPHCM.jpg', 45, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (526, N'Ba Ria City', N'B', N'https://localhost:44338/images/address/Districts/1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (527, N'Vung Tau City', N'V', N'1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (528, N'Phu My', N'P', N'1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (529, N'Chau Duc', N'C', N'1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (530, N'Côn Đảo', N'C', N'1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (531, N'Dat Do', N'Đ', N'1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (532, N'Long Dien', N'L', N'https://localhost:44338/images/address/Districts/1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (533, N'Xuyen Moc', N'X', N'1618824950265BaRiaVungTau.jpg', 46, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (534, N'Thuan An', N'T', N'1618839471707BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (535, N'Di An', N'D', N'1618825077091BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (536, N'Thuan An', N'T', N'1618825077091BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (537, N'Ben Cat', N'B', N'1618825135562BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (538, N'Tan Uyen', N'T', N'1618825135562BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (539, N'Bac Tan Uyen', N'B', N'1618825135562BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (540, N'Bau Bang', N'B', N'1618825135562BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (541, N'Dau Tieng', N'D', N'1618825135562BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (542, N'Phu Giao', N'P', N'1618825135562BinhDuong.jpg', 47, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (543, N'Dong Xoai', N'Đ', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (544, N'Binh Long', N'B', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (545, N'Phuoc Long', N'P', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (546, N'Bu Dang', N'B', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (547, N'Bu Dop', N'B', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (548, N'Bu Gia Map', N'B', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (549, N'Chon Thanh', N'C', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (550, N'Dong Phu', N'Đ', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (551, N'Hon Quan', N'H', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (552, N'Loc Ninh', N'L', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (553, N'Phu Rieng', N'P', N'1618825226653BinhPhuoc.jpg', 48, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (554, N'Bien Hoa City', N'B', N'1618825345101DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (555, N'Long Khanh', N'L', N'1618839442261DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (556, N'Cam My', N'C', N'1618839423009DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (557, N'Dinh Quan', N'Đ', N'1618839404248DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (558, N'Long Thanh', N'L', N'1618839384517DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (559, N'Nhon Trach', N'N', N'1618839363667DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (560, N'Tan Phu', N'T', N'1618839345358DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (561, N'Thong Nhat', N'T', N'1618839317015DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (562, N'Trang Bom', N'T', N'1618839292156DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (563, N'Vinh Cuu', N'V', N'1618839273296DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (564, N'Xuan Loc', N'X', N'1618839251118DongNai.jpg', 49, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (565, N'Tay Ninh City', N'T', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (566, N'Hoa Thanh', N'H', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (567, N'Trang Bang', N'T', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (568, N'Ben Cau', N'B', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (569, N'Chau Thanh', N'C', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (570, N'Duong Minh Chau', N'D', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (571, N'Go Dau', N'G', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (572, N'Tan Bien', N'T', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (573, N'Tan Chau', N'T', N'1618825520761TayNinh.jpg', 50, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (574, N'Binh Thuy', N'B', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (575, N'Cai Rang', N'C', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (576, N'Ninh Kieu', N'N', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (577, N'O Mon', N'Ô', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (578, N'Thot Not', N'T', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (579, N'Co Do', N'C', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (580, N'Phong Dien', N'P', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (581, N'Thoi Lai', N'T', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (582, N'Vinh Thanh', N'V', N'1618825632390CanTho.jpg', 51, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (583, N'Long Xuyen', N'L', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (584, N'Chau Doc', N'C', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (585, N'Tan Chau', N'T', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (586, N'An Phu', N'A', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (587, N'Chau Phu', N'C', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (588, N'Chau Thanh', N'C', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (589, N'Cho Moi', N'C', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (590, N'Phu Tan', N'P', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (591, N'Thoai Son', N'T', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (592, N'Tinh Bien', N'T', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (593, N'Tri Ton', N'T', N'1618825747169AnGiang.jpg', 52, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (594, N'Bac Lieu City', N'B', N'1618825868357BacLieu.jpg', 53, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (595, N'Gia Rai', N'G', N'1618825868357BacLieu.jpg', 53, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (596, N'Dong Hai', N'Đ', N'1618825868357BacLieu.jpg', 53, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (597, N'Hoa Binh', N'H', N'1618825868357BacLieu.jpg', 53, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (599, N'Hong Dan', N'H', N'1618825868357BacLieu.jpg', 53, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (600, N'Vinh Loi', N'V', N'1618825868357BacLieu.jpg', 53, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (601, N'Ben Tre City', N'B', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (602, N'Ba Tri', N'B', N'1618825956050BenTre.jpg', 54, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (603, N'Binh Dai', N'B', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (604, N'Chau Thanh', N'C', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (605, N'Cho Lach', N'C', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (606, N'Giong Trom', N'G', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (607, N'Mo Cay Bac', N'M', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (608, N'Mo Cay Nam', N'M', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (609, N'Thanh Phu', N'T', N'1618825956050BenTre.jpg', 54, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (610, N'Ca Mau City', N'C', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (611, N'Cai Nuoc', N'C', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (612, N'Dam Doi', N'D', N'https://localhost:44338/images/address/Districts/1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (613, N'Nam Can', N'N', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (614, N'Ngoc Hien', N'N', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (615, N'Phu Tan', N'P', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (616, N'Thoi Binh', N'T', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (617, N'Tran Van Thoi', N'T', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (618, N'U Minh', N'U', N'1618826069438CaMau.jpg', 55, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (619, N'Cao Lanh City', N'C', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (620, N'Sa Dec City', N'S', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (621, N'Hong Ngu City', N'H', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (622, N'Cao Lanh', N'C', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (623, N'Chau Thanh', N'C', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (624, N'Hong Ngu', N'H', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (625, N'Lai Vung', N'L', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (626, N'Lap Vo', N'L', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (627, N'Tam Nong', N'T', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (628, N'Tan Hong', N'T', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (629, N'Thanh Binh', N'T', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (630, N'Thap Muoi', N'T', N'1618826185483DongThap.jpg', 56, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (631, N'Vi Thanh City', N'V', N'1618826341667HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (632, N'Nga Bay City', N'N', N'1618826341667HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (634, N'Chau Thanh', N'C', N'1618826341667HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (635, N'Chau Thanh A', N'C', N'1618826341667HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (636, N'Long My', N'L', N'1618826341667HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (637, N'Phung Hiep', N'P', N'1618859861627HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (638, N'Vi Thuy', N'V', N'1618826341667HauGiang.jpg', 57, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (639, N'Rach Gia City', N'R', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (640, N'Ha Tien City', N'H', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (641, N'Phu Quoc', N'P', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (642, N'An Bien', N'A', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (643, N'An Minh', N'A', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (644, N'Chau Thanh', N'C', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (645, N'Giang Thanh	', N'G', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (646, N'Giong Rieng', N'G', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (647, N'Go Quao', N'G', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (648, N'Hon Dat', N'H', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (649, N'Kien Hai', N'K', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (650, N'Kien Luong', N'K', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (651, N'Tan Hiep', N'T', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (652, N'U Minh Thuong', N'U', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (653, N'Vinh Thuan', N'V', N'1618826447944KienGiang.jpg', 58, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (654, N'Tan An City', N'T', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (655, N'Kien Tuong', N'K', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (656, N'Ben Luc', N'B', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (657, N'Can Duoc', N'C', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (658, N'Can Giuoc', N'C', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (659, N'Chau Thanh', N'C', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (660, N'Duc Hoa', N'Đ', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (661, N'Duc Hue', N'Đ', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (662, N'Moc Hoa', N'M', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (663, N'Tan Hung', N'T', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (664, N'Tan Thanh', N'T', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (665, N'Tan Tru', N'T', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (666, N'Thanh Hoa', N'T', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (667, N'Thu Thua', N'T', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (668, N'Vinh Hung', N'V', N'1618826606221LongAn.jpg', 59, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (669, N'Soc Trang City', N'S', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (670, N'Vinh Chau', N'V', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (671, N'Nga Nam', N'N', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (672, N'My Xuyen', N'M', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (673, N'Tran De', N'T', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (674, N'Long Phu', N'L', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (675, N'Ke Sach', N'K', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (676, N'Cu Lao Dung', N'C', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (677, N'Chau Thanh', N'C', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (678, N'My Tu', N'M', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (679, N'Thanh Tri', N'T', N'1618826752162SocTrang.jpg', 60, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (680, N'My Tho City', N'M', N'1618826878672TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (682, N'Go Cong', N'G', N'1618826878672TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (683, N'Cai Be', N'C', N'1618826878672TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (684, N'Cai Lay', N'C', N'1618826878672TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (685, N'Chau Thanh', N'C', N'1618826878672TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (686, N'Cho Gao', N'C', N'1618826878672TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (689, N'Tan Phu Dong', N'T', N'1618839191214TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (690, N'Tan Phuoc', N'T', N'1618839160445TienGiang.jpg', 61, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (691, N'Tra Vinh City', N'T', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (692, N'Duyen Hai', N'D', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (693, N'Cang Long', N'C', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (694, N'Cau Ke', N'C', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (695, N'Cau Ngang', N'C', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (696, N'Chau Thanh', N'C', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (697, N'Tieu Can', N'T', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (698, N'Tra Cu', N'T', N'1618827022204TraVinh.jpg', 62, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (699, N'Vinh Long City', N'V', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (700, N'Binh Minh', N'B', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (701, N'Binh Tan', N'B', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (702, N'Long Ho', N'L', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (703, N'Mang Thit', N'M', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (704, N'Tam Binh', N'T', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (705, N'Tra On', N'T', N'1618827128568VinhLong.jpg', 63, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (706, N'Vung Liem', N'V', N'1618827128568VinhLong.jpg', 63, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (707, N'Saysetha', N'S', N'1618833822626Attapeu.png', 64, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (708, N'Samakkhixay', N'S', N'1618833822626Attapeu.png', 64, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (709, N'Sanamxay', N'S', N'1618833822626Attapeu.png', 64, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (710, N'Sanxay', N'S', N'1618833822626Attapeu.png', 64, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (711, N'Phouvong', N'P', N'1618833822626Attapeu.png', 64, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (712, N'Houayxay', N'H', N'1618833890912Bokeo.png', 65, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (713, N'Ton Pheung', N'T', N'1618833890912Bokeo.png', 65, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (714, N'Meung', N'M', N'1618833890912Bokeo.png', 65, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (715, N'Pha Oudom', N'P', N'1618833890912Bokeo.png', 65, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (716, N'Pak Tha', N'P', N'1618833890912Bokeo.png', 65, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (717, N'Pakxan', N'P', N'1618833952330Bolikhamxai.png', 66, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (718, N'Thaphabat', N'T', N'1618833952330Bolikhamxai.png', 66, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (719, N'Pakkading', N'P', N'1618833952330Bolikhamxai.png', 66, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (720, N'Borikhane', N'B', N'1618833952330Bolikhamxai.png', 66, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (721, N'Khamkeut', N'K', N'1618833952330Bolikhamxai.png', 66, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (722, N'Viengthong', N'V', N'1618833952330Bolikhamxai.png', 66, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (723, N'Pakse', N'P', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (724, N'Sanasomboun', N'S', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (725, N'Batiengchaleunsouk', N'B', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (726, N'Paksong', N'P', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (727, N'Pathouphone', N'P', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (728, N'Phonthong', N'P', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (729, N'Champassack', N'C', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (730, N'Soukhoumma', N'S', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (731, N'Mounlapamok', N'M', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (732, N'Khong', N'K', N'1618834030679Champasak.png', 67, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (733, N'Xam Neua', N'X', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (734, N'Xiengkho', N'X', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (735, N'Hiam', N'H', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (736, N'Viengxay', N'V', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (737, N'Houameuang', N'H', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (738, N'Samtay', N'S', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (739, N'Sop Bao', N'S', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (740, N'Et', N'E', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (741, N'Kone', N'K', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (742, N'Xon', N'X', N'1618834138326Huaphanh.png', 68, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (743, N'Thakhek', N'T', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (744, N'Mahaxay', N'M', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (745, N'Nong Bok', N'M', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (746, N'Hineboune', N'N', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (747, N'Yommalath', N'H', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (748, N'Boualapha', N'Y', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (749, N'Nakai', N'B', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (750, N'Sebangphay', N'N', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (751, N'Xaibouathong', N'S', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (752, N'Kounkham', N'X', N'1618834236082Khammouane.jpg', 69, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (753, N'Namtha', N'N', N'1618834327802Luang Namtha.png', 70, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (754, N'Sing', N'N', N'1618834327802Luang Namtha.png', 70, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (755, N'Long', N'S', N'1618834327802Luang Namtha.png', 70, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (756, N'Viengphoukha', N'L', N'1618834327802Luang Namtha.png', 70, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (757, N'Na Le', N'V', N'1618834327802Luang Namtha.png', 70, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (758, N'Luang Prabang', N'L', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (759, N'Xiengngeun', N'L', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (760, N'Nane', N'X', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (761, N'Pak Ou', N'N', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (762, N'Nam Bak', N'P', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (763, N'Ngoy', N'N', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (764, N'Pak Seng', N'N', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (765, N'Phonxay', N'P', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (766, N'Chomphet', N'P', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (767, N'Viengkham', N'C', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (768, N'Phoukhoune', N'V', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (769, N'Phonthong', N'P', N'1618834377361Luang Prabang.png', 71, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (770, N'Xay', N'X', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (771, N'La', N'X', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (772, N'Na Mo', N'L', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (773, N'Nga', N'N', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (774, N'Beng', N'N', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (775, N'Houne', N'B', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (776, N'Pak Beng', N'P', N'1618834483488Oudomxay.png', 72, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (777, N'Phongsaly', N'P', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (778, N'May', N'P', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (779, N'Khoua', N'M', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (780, N'Samphanh', N'S', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (781, N'Boun Neua', N'B', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (782, N'Yot Ou', N'Y', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (783, N'Boun Tay', N'Y', N'1618834548966Phongsaly.png', 73, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (784, N'Sainyabuli', N'B', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (785, N'Khop', N'K', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (786, N'Hongsa', N'K', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (787, N'Ngeun', N'N', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (788, N'Xienghone', N'X', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (789, N'Phiang', N'X', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (790, N'Parklai', N'P', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (791, N'Kenethao', N'P', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (792, N'Botene', N'K', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (793, N'Thongmyxay', N'B', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (794, N'Xaisathan', N'T', N'1618834617230Sainyabuli.png', 74, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (795, N'Saravane', N'S', N'1618834766234Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (796, N'Ta Oy', N'T', N'1618834766234Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (797, N'Toumlane', N'T', N'1618834766234Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (798, N'Lakhonepheng', N'L', N'1618834851933Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (799, N'Vapy', N'V', N'1618834766234Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (800, N'Khongsedone', N'K', N'1618834887882Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (801, N'Lao Ngam', N'L', N'1618834900248Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (802, N'Sa Mouay', N'S', N'1618834909835Salavan.png', 75, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (803, N'Kaysone Phomvihane', N'K', N'1618834939399Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (804, N'Outhoumphone', N'O', N'1618834939399Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (805, N'Atsaphangthong', N'A', N'1618834939399Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (806, N'Phine', N'P', N'1618834939399Savannakhet.png', 76, 1)
GO
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (807, N'Seponh', N'S', N'1618834939399Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (808, N'Nong', N'N', N'1618834939399Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (809, N'Thapangthong', N'T', N'1618835013923Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (810, N'Songkhone', N'S', N'1618834939399Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (811, N'Champhone', N'C', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (812, N'Xonaboury', N'X', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (813, N'Xayboury', N'X', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (814, N'Viraboury', N'V', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (815, N'Assaphone', N'A', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (816, N'Xonboury', N'X', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (817, N'Thaphalanxay', N'T', N'1618835034160Savannakhet.png', 76, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (818, N'La Mam', N'L', N'1618835114915Sekong.png', 77, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (819, N'Kaleum', N'K', N'1618835114915Sekong.png', 77, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (820, N'Dak Cheung', N'D', N'1618835114915Sekong.png', 77, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (821, N'Tha Teng', N'T', N'1618835114915Sekong.png', 77, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (822, N'Chanthabuly', N'C', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (823, N'Sikhottabong', N'S', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (824, N'Xaysetha', N'X', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (825, N'Sisattanak', N'S', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (826, N'Naxaithong', N'N', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (827, N'Xaythany', N'X', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (828, N'Hadxayfong', N'H', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (829, N'Sangthong', N'S', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (830, N'Mayparkngum', N'M', N'1618835230069Vientiane Prefecture.png', 78, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (831, N'Phonhong', N'M', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (832, N'Thoulakhom', N'T', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (833, N'Keo Oudom', N'K', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (834, N'Kasy', N'K', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (835, N'Vangvieng', N'V', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (836, N'Feuang', N'F', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (837, N'Xanakharm', N'X', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (838, N'Mad', N'M', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (839, N'Viengkham', N'V', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (840, N'Hinhurp', N'H', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (841, N'Meun', N'M', N'1618835331346Vientiane Province.png', 79, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (842, N'Pek', N'P', N'1618835465019Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (843, N'Kham', N'K', N'1618835465019Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (844, N'Nong', N'N', N'1618835576782Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (845, N'Khoune', N'K', N'1618835576782Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (846, N'Mok May', N'M', N'1618835576782Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (847, N'Phou Kout', N'P', N'1618835576782Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (848, N'Phaxay', N'P', N'1618835576782Xiengkhouang.png', 80, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (849, N'Anouvong', N'A', N'1618835621027Xaisomboun.jpg', 81, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (850, N'Longchaeng', N'L', N'1618835621027Xaisomboun.jpg', 81, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (851, N'Longxan', N'L', N'1618835621027Xaisomboun.jpg', 81, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (852, N'Hom', N'L', N'1618835621027Xaisomboun.jpg', 81, 1)
INSERT [dbo].[District] ([DistrictID], [DistrictName], [DistrictLetter], [Avatar], [CityID], [Active]) VALUES (853, N'Thathom', N'H', N'1618835621027Xaisomboun.jpg', 81, 1)
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[ImageLib] ON 

INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (1, 1, N'1618603485165z2435480802730-cac9457473bf64f7fd1c3d449c541e58-637540817516378414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (2, 2, N'1618603713534z2435480802730-cac9457473bf64f7fd1c3d449c541e58-637540817516378414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (3, 2, N'1618603715359z2435480804746-7de3d4f11fc967d70c58e0d5626a4cc4-637540817519191075.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (4, 2, N'1618603717087z2435480814619-21dab1d08752d241ab105da8b928d81b-637540817519503529.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (5, 2, N'1618603718610z2435480817968-0aad1d933ce4a62e59bf2a353e4fa267-637540817519815813.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (6, 2, N'1618603721964z2435480820098-7c168d2d97cb6b6bcaf11a571133300b-637540817519972089.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (7, 2, N'1618603723886z2435480825892-0586fa7138e746d7eacf1c531b8a19ce-637540817520128296.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (8, 2, N'1618603725938z2435480834843-e993ac31527626933b5ae75dcc6f4156-637540817520284681.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (9, 2, N'1618603735047z2435482897342-7607b3af080c1e14b888486050f569f7-637540817524971791.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (10, 4, N'1618647137423la3-637541042195879608.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (11, 4, N'1618647105749la5-637541042197493422.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (12, 4, N'1618647084907la6-637541042198191010.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (13, 4, N'1618647130397la9-637541042200490225.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (14, 4, N'1618647146118la8-637541042199509389.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (15, 4, N'1618647113853la4-637541042196833404.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (16, 5, N'16186479808902.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (17, 5, N'16186479863574.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (18, 5, N'16186479892885.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (19, 5, N'16186479926966.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (20, 5, N'16186479978228.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (21, 5, N'16186479952207.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (22, 5, N'16186480004319.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (23, 5, N'16186479835963.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (24, 5, N'161864800264310.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (25, 6, N'16186488308734.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (26, 6, N'16186488265323.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (27, 6, N'16186488333312.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (28, 7, N'16186496698744.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (29, 7, N'16186496674263.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (30, 7, N'16186496647012.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (31, 1, N'16186508401212.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (32, 1, N'16186508565348.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (33, 1, N'16186508536817.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (34, 1, N'16186508424743.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (35, 1, N'16186508513126.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (36, 1, N'16186508453804.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (37, 1, N'16186508482795.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (38, 9, N'16186512062092.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (39, 9, N'16186512113854.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (40, 9, N'16186512088803.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (41, 10, N'16186517629712.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (42, 10, N'16186517681884.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (43, 10, N'16186517706565.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (44, 10, N'16186517754417.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (45, 10, N'16186517729226.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (46, 10, N'16186517656683.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (47, 1, N'16186531104112.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (48, 1, N'16186596200018.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (49, 1, N'16186596217299.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (50, 1, N'16186596123224.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (51, 1, N'16186596080123.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (52, 1, N'16186596062742.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (53, 1, N'16186596184517.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (54, 1, N'16186596145266.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (55, 13, N'16186645051455.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (56, 13, N'16186644935422.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (57, 13, N'16186645080166.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (58, 13, N'16186645131128.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (59, 13, N'16186645104097.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (60, 13, N'16186645030194.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (61, 1, N'16186677032522.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (62, 1, N'16186677051303.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (63, 11, N'16186687254713.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (64, 11, N'16186687234572.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (65, 11, N'16186687274124.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (66, 12, N'16186693298216.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (67, 12, N'16186693259954.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (68, 12, N'16186693276445.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (69, 12, N'16186693241443.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (70, 12, N'16186693223012.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (71, 17, N'16186696785812.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (72, 17, N'16186696844025.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (73, 17, N'16186696823044.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (74, 17, N'16186696805663.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (75, 18, N'16186701768222.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (76, 18, N'16186702267145.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (77, 18, N'16186702303737.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (78, 18, N'16186702226253.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (79, 18, N'16186702349559.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (80, 18, N'16186702321598.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (81, 18, N'16186702285216.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (82, 18, N'16186702246654.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (83, 1, N'1618674197134z2435480840526-ac7098eb7cdbbe0db5c9028478756fe6-637540817520597267.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (84, 1, N'1618674192164z2435480840526-ac7098eb7cdbbe0db5c9028478756fe6-637540817520597267.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (85, 1, N'1618674194649z2435480825892-0586fa7138e746d7eacf1c531b8a19ce-637540817520128296.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (86, 1, N'1618674199872z2435480825892-0586fa7138e746d7eacf1c531b8a19ce-637540817520128296.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (87, 1, N'1618674203707z2435480840526-ac7098eb7cdbbe0db5c9028478756fe6-637540817520597267.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (88, 1, N'1618674592655z2435480864155-965199c0abf17917b8ebf06c5f111aee-637540817521224239.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (89, 1, N'1618674569529z2435480840526-ac7098eb7cdbbe0db5c9028478756fe6-637540817520597267.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (90, 1, N'1618674580748z2435480817968-0aad1d933ce4a62e59bf2a353e4fa267-637540817519815813.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (91, 1, N'1618674585319z2435480802730-cac9457473bf64f7fd1c3d449c541e58-637540817516378414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (92, 20, N'1618674618273z2435480834843-e993ac31527626933b5ae75dcc6f4156-637540817520284681.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (93, 15, N'16187066101752.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (94, 15, N'16187066122733.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (95, 15, N'16187066147414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (96, 22, N'16187068956392.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (97, 22, N'16187068980853.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (98, 22, N'16187069020745.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (99, 22, N'16187069000924.jpg')
GO
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (100, 23, N'16187071442022.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (101, 23, N'16187071465793.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (102, 23, N'16187071506324.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (103, 23, N'16187071486275.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (104, 1, N'16187084763194.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (105, 1, N'16187084718772.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (106, 1, N'16187084788115.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (107, 1, N'16187084739663.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (108, 25, N'16187089109606.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (109, 25, N'16187089091295.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (110, 25, N'16187089012742.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (111, 25, N'16187089047643.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (112, 25, N'16187089071744.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (113, 26, N'16187094300302.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (114, 26, N'16187094466329.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (115, 26, N'16187094402646.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (116, 26, N'16187094350424.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (117, 26, N'16187094379505.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (118, 26, N'16187094325683.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (119, 26, N'16187094422227.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (120, 26, N'16187094442598.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (121, 27, N'16187098562812.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (122, 27, N'16187098606664.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (123, 27, N'16187098585393.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (124, 27, N'16187098628665.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (125, 14, N'16187128888513.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (126, 14, N'16187128923435.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (127, 14, N'16187128870592.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (128, 14, N'16187128905564.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (129, 1, N'16187138400606.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (130, 1, N'161871384546111.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (131, 1, N'16187138420447.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (132, 1, N'16187138472749.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (133, 1, N'16187138438058.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (134, 1, N'161871384929310.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (135, 1, N'16187138382425.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (136, 1, N'16187138323562.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (137, 1, N'16187138359124.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (138, 1, N'16187138341283.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (139, 30, N'16187164348875.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (140, 30, N'16187164282172.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (141, 30, N'16187164320624.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (142, 30, N'16187164302673.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (143, 31, N'16187182377283.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (144, 31, N'161871825456211.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (145, 31, N'161871826142414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (146, 31, N'161871825943013.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (147, 31, N'16187182396574.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (148, 31, N'16187182414365.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (149, 31, N'16187182459787.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (150, 31, N'161871825687012.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (151, 31, N'16187182357412.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (152, 31, N'16187182436206.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (153, 31, N'161871825259310.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (154, 31, N'16187182503629.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (155, 31, N'16187182483448.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (156, 32, N'16187188744078.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (157, 32, N'16187188661673.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (158, 32, N'16187188782949.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (159, 32, N'16187188701735.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (160, 32, N'161871888281411.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (161, 32, N'16187188681834.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (162, 32, N'161871889558217.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (163, 32, N'16187188724546.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (164, 31, N'16187188574082.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (165, 32, N'16187188701735.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (166, 32, N'161871888533812.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (167, 32, N'161871889224816.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (168, 32, N'16187188681834.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (169, 32, N'16187188724546.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (170, 32, N'16187188661673.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (171, 32, N'161871888067210.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (172, 32, N'161871888533812.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (173, 32, N'161871888281411.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (174, 32, N'161871889924318.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (175, 32, N'16187188782949.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (176, 32, N'161871889012615.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (177, 32, N'16187188744078.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (178, 32, N'161871889224816.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (179, 32, N'161871888764113.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (180, 32, N'161871889924318.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (181, 32, N'161871888067210.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (182, 32, N'161871888764113.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (183, 31, N'16187188574082.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (184, 32, N'161871889012615.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (185, 32, N'161871889558217.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (186, 35, N'16187233795422.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (187, 36, N'16187235671342.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (188, 37, N'16187237749577.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (189, 37, N'16187237723006.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (190, 37, N'16187237773828.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (191, 37, N'16187237643443.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (192, 37, N'16187237805372.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (193, 37, N'161872378682110.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (194, 37, N'16187237839969.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (195, 37, N'16187237839969.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (196, 37, N'16187237805372.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (197, 37, N'16187237723006.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (198, 37, N'16187237671804.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (199, 37, N'16187237643443.jpg')
GO
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (200, 37, N'16187237698755.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (201, 37, N'16187237671804.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (202, 37, N'16187237773828.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (203, 37, N'161872378682110.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (204, 37, N'16187237749577.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (205, 37, N'16187237698755.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (206, 1, N'16187306157772.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (207, 1, N'16187306238196.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (208, 1, N'16187306215965.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (209, 1, N'16187306179153.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (210, 1, N'16187306198354.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (211, 40, N'16187307644284.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (212, 40, N'16187307625743.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (213, 40, N'161873076891466.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (214, 40, N'16187307599322.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (215, 40, N'161873077086477.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (216, 40, N'16187307667805.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (217, 41, N'16187309597622.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (218, 41, N'16187309709577.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (219, 41, N'16187309731808.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (220, 41, N'16187309668385.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (221, 41, N'16187309689496.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (222, 41, N'16187309643634.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (223, 41, N'16187309618043.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (224, 42, N'16187313650988.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (225, 42, N'161873136963910.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (226, 42, N'16187313471042.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (227, 42, N'16187313676069.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (228, 42, N'161873137246711.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (229, 42, N'16187313623017.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (230, 42, N'16187313507273.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (231, 42, N'16187313596246.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (232, 42, N'16187313567395.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (233, 42, N'16187313530764.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (234, 1, N'16187329568945.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (235, 1, N'16187329508252.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (236, 1, N'16187329547694.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (237, 1, N'16187329591836.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (238, 1, N'16187329528703.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (239, 44, N'16187334503433.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (240, 44, N'16187334591777.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (241, 44, N'16187334549215.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (242, 44, N'16187334569706.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (243, 44, N'16187334477922.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (244, 44, N'16187334532404.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (245, 45, N'16187348435062.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (246, 45, N'16187348469954.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (247, 45, N'16187348454693.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (248, 46, N'16187352901173.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (249, 46, N'16187352881372.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (250, 1, N'16187368088749.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (251, 1, N'16187368007245.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (252, 1, N'16187367946202.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (253, 1, N'16187368031746.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (254, 1, N'16187367963713.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (255, 1, N'16187367984914.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (256, 1, N'161873681077410.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (257, 1, N'16187368069038.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (258, 1, N'16187368049157.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (259, 1, N'161873681312511.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (260, 48, N'16187397673583.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (261, 48, N'16187397764777.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (262, 48, N'16187397741466.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (263, 48, N'16187397650412.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (264, 48, N'16187397810089.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (265, 48, N'16187397787668.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (266, 48, N'161873978316310.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (267, 48, N'161873978774812.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (268, 48, N'16187397699724.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (269, 48, N'16187397719775.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (270, 48, N'161873978538811.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (271, 49, N'16187400277724.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (272, 49, N'16187400322056.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (273, 49, N'16187400299215.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (274, 49, N'16187400227442.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (275, 49, N'16187400251733.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (276, 50, N'16187403191098.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (277, 50, N'161874032857811.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (278, 50, N'16187403147026.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (279, 50, N'161874032631910.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (280, 50, N'16187403240999.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (281, 50, N'16187403055122.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (282, 50, N'16187403167567.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (283, 50, N'16187403125695.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (284, 50, N'16187403096644.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (285, 50, N'16187403077723.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (286, 1, N'16187418312953.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (287, 1, N'16187418332704.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (288, 1, N'16187418398577.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (289, 1, N'16187418442329.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (290, 1, N'16187418374366.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (291, 1, N'161874184877811.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (292, 1, N'161874185129512.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (293, 1, N'16187418351715.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (294, 1, N'16187418420398.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (295, 1, N'16187418293222.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (296, 1, N'161874184643510.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (297, 52, N'16187423117728.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (298, 52, N'161874231848711.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (299, 52, N'16187423048645.jpg')
GO
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (300, 52, N'161874231583310.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (301, 52, N'16187423137999.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (302, 52, N'16187423097847.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (303, 52, N'161874232091512.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (304, 52, N'161874232423313.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (305, 52, N'16187423029174.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (306, 52, N'16187422990512.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (307, 52, N'161874232897215.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (308, 52, N'16187423078396.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (309, 52, N'16187423010973.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (310, 52, N'161874232667214.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (311, 53, N'16187426222797.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (312, 53, N'16187426141253.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (313, 53, N'16187426203086.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (314, 53, N'16187426245488.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (315, 53, N'16187426265689.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (316, 53, N'16187426180965.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (317, 53, N'161874262890510.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (318, 53, N'16187426160894.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (319, 53, N'161874264140415.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (320, 53, N'161874263425112.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (321, 53, N'161874263659513.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (322, 53, N'161874264428316.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (323, 53, N'16187426119272.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (324, 53, N'161874263103311.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (325, 53, N'161874264666817.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (326, 53, N'161874263919214.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (327, 54, N'16187428181923.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (328, 54, N'16187428209814.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (329, 54, N'16187428163252.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (330, 54, N'16187428234975.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (331, 54, N'16187428255686.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (332, 54, N'16187428298088.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (333, 54, N'16187428274747.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (334, 1, N'16188412794871.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (335, 1, N'16188412821572.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (336, 1, N'16188412844273.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (337, 57, N'16188415461951.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (338, 1, N'16188415522343.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (339, 1, N'16188415492252.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (340, 58, N'16188422076723.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (341, 58, N'16188422098564.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (342, 58, N'16188422056372.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (343, 58, N'16188422034851.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (344, 58, N'16188422120565.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (345, 59, N'16188423527052.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (346, 59, N'16188423602835.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (347, 59, N'16188423576914.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (348, 59, N'16188423689868.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (349, 59, N'16188423630306.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (350, 59, N'16188423656727.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (351, 59, N'16188423553983.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (352, 58, N'16188423506581.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (353, 60, N'16188425007644.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (354, 60, N'16188425029925.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (355, 60, N'16188424959652.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (356, 60, N'16188424936661.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (357, 60, N'16188424982923.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (358, 1, N'16188430096485.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (359, 1, N'16188430048423.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (360, 62, N'16188445020605.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (361, 62, N'16188444959012.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (362, 62, N'16188445059027.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (363, 62, N'16188445076358.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (364, 62, N'16188445038676.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (365, 62, N'16188444982403.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (366, 62, N'16188445001774.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (367, 62, N'161884451479712.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (368, 62, N'161884451099510.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (369, 62, N'161884451281611.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (370, 62, N'16188445093719.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (371, 63, N'16188446949973.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (372, 63, N'16188446969834.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (373, 62, N'16188446930292.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (374, 63, N'16188446990381.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (375, 64, N'16188449902601.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (376, 64, N'16188449921062.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (377, 64, N'16188449938983.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (378, 64, N'16188449956414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (379, 64, N'16188449974915.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (380, 1, N'16188456409803.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (381, 1, N'16188456391432.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (382, 1, N'16188456429644.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (383, 1, N'16188456454535.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (384, 66, N'16188458463972.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (385, 66, N'16188458507764.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (386, 66, N'16188458490473.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (387, 66, N'16188458532575.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (388, 66, N'16188458554956.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (389, 67, N'16188461760163.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (390, 67, N'16188461777134.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (391, 67, N'16188461738332.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (392, 66, N'16188461722011.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (393, 68, N'16188464157062.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (394, 68, N'16188464216995.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (395, 68, N'16188464197224.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (396, 68, N'16188464176903.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (397, 1, N'1618846887034land-for-sale-in-nakhe-vientiane.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (398, 1, N'16188469009772.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (399, 1, N'16188469033161.jpg')
GO
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (400, 70, N'16188472185615.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (401, 70, N'16188472065242.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (402, 71, N'16188472185615.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (403, 70, N'16188472065242.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (404, 70, N'16188473053931.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (405, 71, N'16188473163404.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (406, 71, N'16188473117965.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (407, 71, N'16188473076272.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (408, 71, N'16188473098973.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (409, 73, N'16188475038213.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (410, 73, N'16188475059792.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (411, 75, N'16188485152762.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (412, 75, N'16188485214345.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (413, 75, N'16188485193114.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (414, 75, N'16188485292118.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (415, 75, N'16188485243266.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (416, 75, N'16188485310389.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (417, 75, N'161884853504011.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (418, 75, N'161884853736012.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (419, 75, N'16188485272767.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (420, 75, N'161884853285410.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (421, 75, N'16188485173323.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (422, 75, N'161884853938313.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (423, 75, N'161884854171414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (424, 76, N'16188490380074.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (425, 76, N'16188490400145.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (426, 75, N'16188490326632.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (427, 76, N'16188490455838.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (428, 76, N'16188490474639.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (429, 76, N'16188490437277.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (430, 76, N'16188490417906.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (431, 76, N'161884905534812.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (432, 76, N'161884905781413.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (433, 76, N'161884904993410.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (434, 76, N'16188490355323.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (435, 76, N'161884906088614.jpeg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (436, 75, N'16188492645631.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (437, 77, N'16188492698372.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (438, 1, N'16188498726361.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (439, 1, N'16188498850068.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (440, 1, N'16188498815786.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (441, 1, N'16188498760293.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (442, 1, N'16188498777534.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (443, 1, N'16188498833467.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (444, 1, N'16188498794205.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (445, 1, N'16188498741692.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (446, 79, N'16188501347521.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (447, 79, N'16188501368532.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (448, 79, N'161885016669612.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (449, 79, N'16188501443256.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (450, 79, N'16188501388983.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (451, 79, N'16188501500867.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (452, 79, N'161885016398711.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (453, 79, N'161885016180910.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (454, 79, N'16188501596919.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (455, 79, N'161885016903414.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (456, 79, N'16188501564998.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (457, 79, N'161885017236315.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (458, 79, N'16188501424135.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (459, 79, N'16188501406614.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (460, 1, N'16188507974506.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (461, 1, N'16188507888412.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (462, 1, N'16188507951365.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (463, 1, N'16188507909693.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (464, 1, N'16188507869691.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (465, 1, N'16188507930604.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (466, 81, N'16188511505059.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (467, 81, N'16188511456622.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (468, 81, N'161885114784010.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (469, 83, N'16188518816514.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (470, 83, N'16188518882267.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (471, 83, N'16188518791033.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (472, 83, N'16188518839575.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (473, 83, N'16188518904788.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (474, 83, N'16188518925559.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (475, 83, N'16188518734672.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (476, 83, N'16188518862486.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (477, 84, N'16188520415741.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (478, 84, N'16188520453593.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (479, 84, N'16188520434892.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (480, 84, N'16188520474484.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (481, 84, N'16188520493115.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (482, 84, N'16188520517456.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (483, 84, N'16188520547427.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (484, 1, N'16188536227057.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (485, 1, N'16188536208116.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (486, 1, N'16188536247058.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (487, 1, N'16188536133472.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (488, 1, N'16188536266229.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (489, 1, N'16188536182795.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (490, 1, N'16188536151413.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (491, 86, N'16188538126594.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (492, 86, N'16188538087282.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (493, 86, N'16188538162425.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (494, 86, N'16188538182916.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (495, 86, N'16188538204267.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (496, 86, N'16188538106123.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (497, 86, N'16188541020762.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (498, 87, N'16188541105776.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (499, 87, N'16188541039443.jpg')
GO
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (500, 87, N'16188541080805.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (501, 87, N'161885411607410.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (502, 87, N'16188541057964.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (503, 87, N'16188541135957.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (504, 1, N'16188545501983.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (505, 1, N'16188545478012.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (506, 90, N'16188551082924.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (507, 90, N'16188551039562.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (508, 90, N'16188551140397.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (509, 90, N'16188551121356.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (510, 90, N'16188551057493.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (511, 90, N'16188551016481.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (512, 90, N'16188551103055.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (513, 90, N'161885512646712.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (514, 90, N'16188551189819.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (515, 90, N'16188551169338.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (516, 90, N'161885512182610.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (517, 90, N'161885512447111.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (518, 1, N'16188553457018.jpg')
INSERT [dbo].[ImageLib] ([ImageLibID], [ProductID], [Name]) VALUES (519, 1, N'161885534918610.jpg')
SET IDENTITY_INSERT [dbo].[ImageLib] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [LocationName], [LocationLetter], [Avatar], [Active]) VALUES (1, N'Asia', N'A', N'1618231301400asia.png', 1)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Package] ON 

INSERT [dbo].[Package] ([PackageID], [PackageName], [Price], [PackageTitle], [PackageDesciption], [Duration], [Active], [TypeDuration]) VALUES (1, N'Silver', 10, N'Silver', N'Experience new features', 30, 1, N'Day')
INSERT [dbo].[Package] ([PackageID], [PackageName], [Price], [PackageTitle], [PackageDesciption], [Duration], [Active], [TypeDuration]) VALUES (2, N'Gold', 58, N'Gold', N'Experience new features', 180, 1, N'Day')
INSERT [dbo].[Package] ([PackageID], [PackageName], [Price], [PackageTitle], [PackageDesciption], [Duration], [Active], [TypeDuration]) VALUES (3, N'Diamond', 115, N'Diamond', N'Experience new features', 365, 1, N'Day')
SET IDENTITY_INSERT [dbo].[Package] OFF
SET IDENTITY_INSERT [dbo].[PackagePurchased] ON 

INSERT [dbo].[PackagePurchased] ([ppID], [PackageID], [UserID], [StartDate], [EndDate]) VALUES (1, 1, N'1006', CAST(N'2021-03-16T00:00:00.0000000' AS DateTime2), CAST(N'2021-04-26T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[PackagePurchased] OFF
SET IDENTITY_INSERT [dbo].[project] ON 

INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (4, 4, 1006, N'Lavita Thuận An', N'Apartment Lavita Thuận An', N'Paying 750 million owned immediately.

☑One bedroom apartment: 51m2

☑ 2 bedroom apartment: 70m2, 72m2

☑Three bedroom apartment: 93m2

💎 Super attractive offers only for phase I

- Payment for sales contract is only 20%.

- MSB bank, VpBank support 70% loan for 25 years.

- Transfer payments up to 18%', 1, 27, 639, 3, 3, 32500, 23900, N'1618647072955lavita5-637541819774274976.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (5, 4, 1006, N'Apartment Duplex Đại Mỗ', N'Apartment Duplex Đại Mỗ', N'👉 Location: Near Van Phuc-Ha Dong intersection (300m away). Very convenient to go to central districts such as Dong Da, Thanh Xuan, Cau Giay.

✅ Surrounding facilities: Near Ban International School, Aeon Ha Dong supermarket, convenient to My Dinh stadium ...

✅ Apartment 2809 (Floor 28, Unit 9) 👉 Number of units, number of floors is so beautiful.

✅ Southeast direction balcony, super beautiful view, embracing Van Phuc crossroads, panoramic view of Ha Dong and Thanh Xuan every day. Every night, sitting on the balcony, watching the city love life a few more parts.

👉 Clearance area 169.5m2; Full paperwork, support bank loans for customers in need.

✅ Full furniture up to 95% including: Refrigerator, air conditioner, heater, bed, kitchen cabinet, kitchen, super-quality island ... Design in modern style, suitable for homeowners. Stable way, modern, prefer maximum convenience.
The apartment consists of 3 main bedrooms + 1 storage room cum bedroom for the maid or the bedroom for the elderly in the family + 3 spacious bathrooms, beautiful design, utility.

👉 All home electrical systems are genuine Panasonic, with quality assurance. Ventilators, exhaust fans, and ceiling fans are also used by Panasonic.

👉 The living room balcony is super wide, can freely design a super beautiful landscape garden, I made a light for the balcony, very beautiful.

👉 The stairs are made of ironwood, with illuminated lights on the steps, creating a landscape like in resorts and hotels.', 1, 27, 608, 4, 4, 56300, 169, N'16186479780896a44c55dc4b536eb6fa4-637541928787605486.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (6, 7, 1006, N'Selling communal land Minh Trí - Sóc Sơn - Hà Nội', N'Selling communal land Minh Trí - Sóc Sơn - Hà Nội', N'The owner quickly sold a beautiful plot of land in Go Ga So Village, MINH TRI Commune, SOC SON DISTRICT, my land has an area of ​​658 square meters, corner plot, square two fronts. road surface 7m2 wide 2 cars avoid each other comfortably.

Frontage 18m2, deep 42m2, near Hanoi Clup golf course.

In addition to the area on the book is 658m2, my house also has 397m2 of external land certified by the commune since 2004 (total area is 1055m2)', 1, 27, 608, 5, 6, 182000, 1055, N'16186488225141.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (9, 3, 1007, N'Becamex Industrial area', N'Becamex Industrial area', N'Sell 555 square meters at Becamex industrial park.

Area: 15x37m, price I sell 550 million / book, pink book separately.

Located on 12m asphalt road leading to Dai Nam tourist area.

1.5 km from the administrative center, opposite Hung Vuong school, crowded population. Convenient for trading, building motels, accommodation, ...', 1, 27, 640, 7, 8, 70000, 555, N'16186512036841.jpeg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (10, 5, 1007, N'To liquidate 29 land lots in Bình Chánh', N'To liquidate 29 land lots in Bình Chánh', N'- Located on the route of PROVINCE 10 - TRAN VAN GIU, adjacent to AEON Binh Tan, 3.4km from Ba Hom intersection, takes 8 minutes to Phu Lam park, 15 minutes to Tan Binh District, Tan Phu District, District 11. ..

- Nearly 3 large industrial zones up to 500,000 workers are working. 4,000 foreign experts are living and working here.

- Located adjacent to Binh Tan, Tan Phu, District 6, District 10, District 11 ....

- Guarantee 100% real price and say no to virtual price.


+ Area of townhouse land: 5m x 16m, 5m x 20m, 5m x 21m, 5m x 26m, 6m x 20m, 6m x 17.5m ...

+ Villa land area: 10m x 19m, 10m x 21m, 10m x 26m ...

+ Land area of corner 2 fronts: 8m x 21m, 9m x 21m, 10m x 26m, ...

+ Area of corner land 2, villa plot: 10m x 21m, 10m x 26m, 12m x 26m, ...


- Legal transparency (pink book permanently).

- Land in urban areas. ( City ). You buy 1 background 1 book, 2 backgrounds 2 books.

- Include name notarization, support for construction permits, completion for customers.

- 100% residential land with detailed planning 1/500 does not worry about land clearance.


- Road has been paved from 14m - 42m.- Negative electric system, sewers are equipped.

- Use Cho Lon tap water to ensure the domestic water source for the people.

- Existing residential area (near market, school, hospital ...).

- Many industrial parks, workshops, convenient for trading, building and renting accommodation.

Full and adjacent utilities such as The Gioi Di Dong, Dien May Xanh, Big C, Coop Mart, Pou Yuen Industrial Park, other convenient services ...', 1, 27, 637, 9, 10, 52000, 80, N'16186517598851.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (11, 5, 1008, N'Offers in the $300,000''s', N'Offers in the $300,000''s', N'762m2 LOT WITH R80 ZONING - LOCATION PLUS!!!!

This perfectly located 762m2 R80 Block allows for so many options.

The close proximity to all amenities means that your next development is sure to be right amongst the action and with everything within walking distance it is sure to attract purchasers of all ages.

Some incredible infrastructure projects are happening in the City of Swan and this will only continue to put it at the top of the list for many buyers.

For more information be sure to call Shane Beaumont or for planning and development details please call the City of Swan planning department.', 3, 28, 657, 10, 11, 300000, 762, N'16186531078601.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (12, 4, 1009, N'A two bedroom apartment', N'A two bedroom apartment', N'A two bedroom apartment with accesse via an attractive paved tree lined courtyard.

The property has been tastefully refurbished and includes a separate modern and fully equipped integrated kitchen.

There are two good sized bedrooms and one gorgeous and recently refurbished shower room', 3, 29, 668, 12, 13, 103675, 375, N'16186596039381.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (13, 4, 1009, N'34th floor, luxury, one bed apartment', N'34th floor, luxury, one bed apartment', N'34th floor, luxury, one bed apartment in one of Sunderland ground breaking landmarks.

Comprising an open plan living space, fully fitted and integrated kitchen and an island unit housing an electric ceramic hob.

Full height windows opening to a spacious private balcony.

Bedroom complete with in-built storage and carpet', 3, 29, 662, 14, 15, 1027720, 850, N'16186644904371.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (14, 5, 1010, N'Land in the city Taourirt', N'Land in the city Taourirt', N'Land in the city Taourirt
Size: 12,545 square meters', 4, 53, 1114, 13, 14, 1160610, 12545, N'16186677010721.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (15, 7, 1007, N'Selling 6ha of industrial park communal land', N'Selling 6ha of industrial park communal land', N'- Factory land for sale in Dong Van Industrial Park, Ha Nam Province.

  - Area: 60,000m2, (6ha) Full water and electricity infrastructure.
  - Factory location 10km away from Hanoi

  - Suitable for production of different professions', 1, 27, 611, 15, 16, 962506, 61000, N'16186687209341.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (16, 7, 1008, N'Land in the Pomarance, Tuscany', N'Land in the Pomarance, Tuscany', N'Land in the Pomarance, Tuscany', 3, 42, 868, 16, 17, 1548255, 4100, N'16186693202351.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (17, 7, 1008, N'Selling communal land Carovigno, Apulia', N'Selling communal land Carovigno, Apulia', N'A few kilometers from the sea, a very quiet and reserved area, we offer for sale a arable land overlooking the sea of 7,600 square meters.
It is possible to build a villa of 125 square meters beyond verandas, swimming pool and basement.
The land has a magnificent direct view of Torre Guaceto.
It is 3 km from the sea and 25 km from Brindisi airport.', 3, 42, 854, 17, 18, 1548269, 7600, N'16186696762551.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (18, 7, 1008, N'Selling communal land Precenicco, Friuli-Venezia Giulia', N'Selling communal land Precenicco, Friuli-Venezia Giulia', N'Die gegenständliche Liegenschaft liegt in romantischer Lage in der kleinen Stadt Precenicco in der Provinz Udine in direkter Nähe zum Fluss Stella, sowie dem angrenzenden Naturschutzgebiet.

Die in der Vie Piscjarole liegende Liegenschaft ist über die Via dei Bass direkt mit dem Auto erreichbar.

Folgende umliegenden Badeorte sind mit dem Auto gut und zeitnahe erreichbar:

* Lignano Sabbiadoro (ca. 18km/ca. 20 Min.)
* Bibione (ca. 21km/ca. 24 Min.)
* Caorle (ca. 36km/ca. 39 Min.)
* Grado (ca. 39km/ca. 42 Min.)
* Jesolo (ca. 50km/ca. 55 Min.)
Die Provinzstadt Udine liegt nur ca. 40 km entfernt. Einkaufsmöglichkeiten finden Sie im Umland. Diese sind mit dem Auto komfortabel in ca. 8-10 Minuten erreichbar. 

Genießen Sie als Bootsliebhaber die Stella für Ihre romantische Flussschiffahrt oder als Zubringer zum offenen Meer. Am Abend liegt Ihr Boot geschützt im Süßwasser im Landesinneren.

Beschreibung:

Die idyllische ca. 2.500m² große, rechteckige und ebenen Liegenschaft ist durch einen kurzen Feldweg erreichbar.

Die einzigartige ruhige und romantische Lage ergibt sich durch die Nähe zum Fluss Stella (ca. 15m bis 25m), sowie das angrenzende und nicht verbaubare Naturschutzgebiet.

Eine kleine, verträumte Marina, etwa 5 Gehminuten von der Liegenschaft entfernt, bietet Anlegemöglichkeiten für Bootsliebhaber.

Ebenso wäre es lt. eigentümerseitigen Informationen möglich, das schmale Grundstück gegenüber der Liegenschaft zwischen der Via del Bass und dem Fluss zu pachten, um einen direkten Bootsanlegeplatz vor der Liegenschaft zu schaffen.

Eigentümerseitig liegen bereits Bebauungsentwürfe für eine Traumvilla vor, welche aus persönlichen Gründen nicht mehr umgesetzt werden. Die vorliegenden Pläne sind noch nicht baubewilligt.

Das gegenständliche Grundstück liegt nach geltendem Bebauungsplan, Blatt 4, Grundbuchsplan 162, in der Zone "B2" als vertragsgebundenes Wohngebiet. Der Bebauungsplan liegt eigentümerseitig in Kopie samt Übersetzung vor.

Genießen Sie als Bootsliebhaber den Fluss Stella für Ihre romantische Flussschifffahrt oder als Zubringer zum offenen Meer. Am Abend liegt Ihr Boot geschützt im Süßwasser im Landesinneren.

Kaufpreis:

Die Liegenschaft wird um einen lastenfreien Kaufpreis von EUR 220.000,00 (Euro Zweihundertzwanzigtausend) angeboten.

Erwerbskosten Italien:

* 10% Grunderwerbssteuer
* 1% + MwSt., Stempelmarken, Steuercode (code fiscale) Grundbuchseintragung
* 4% + MwSt. Notarkosten
Nebenkosteninformation Österreich:

* 3% Vermittlungsprovision vom Kaufpreis + 20% USt.
Weitere Unterlagen:

Als ergänzende Unterlagen schließen wir unserem Exposé folgende Beilagen  an:

* Bebauungsplan Gemeinde Precenicco
* Bebauungsplan gemeinde Precenicco Übersetzung
* Flurplan
* Bebauungsentwurf (unverbindlich)
* Nebenkosteninformation Österreich
Gerne stehen wir Ihnen für ergänzende Informationen zur Verfügung und freuen uns über Ihre Kontaktaufnahme.', 3, 42, 859, 18, 19, 340616, 2500, N'16186701725771.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (21, 7, 1010, N'Selling communal land Cardinal, Ontario', N'Selling communal land Cardinal, Ontario', N'Perfect building location. Lot is level, in a developed subdivision, close to the St. Lawrence River. Minutes to many amenities. Beautiful location 5 minutes from the Johnstown bridge and 416 access. A couple minutes outside the village of Cardinal. A welcoming Corner lot on a quiet crescent to build your dream home. Homes in this area are onn Well and Septic.', 6, 73, 1470, 19, 20, 129012, 144, N'16187066074361.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (22, 7, 1010, N'Selling communal land Kawartha Lakes, Ontario', N'Selling communal land Kawartha Lakes, Ontario', N'Details:- Welcome To Beautiful Kawartha Lakes. Wonderful Opportunity To Own Almost 9 Acres Of Land. Consider A Build Or Farming Or Landbank And Hold It For The Future. Either Way This Is A Great Opportunity. Great Lot In A Great Location. Owner Purchased A Full Legal Survey And A Topographic Survey ($15K Cost) And Will Provide Them To The Buyer Of This Land.', 6, 73, 1470, 20, 21, 206728, 272, N'16187068928251.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (23, 7, 1010, N'Selling communal land Saint-Apollinaire, Québec', N'Selling communal land Saint-Apollinaire, Québec', N'- Situé a 15 minutes des ponts de QC . Terrain double de 50 000 pi2 (2x 25000). Analyse de sol au dossier disponible. Le terrain possède une partie plat ainsi qu''un dénivelé important avec petit ruisseau dans le bas. La construction d''une propriété unifamiliale y est permis. Venez voir et adaptez votre projet à l''environnement disponible !
', 6, 73, 1471, 21, 22, 101095, 156, N'16187071395821.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (24, 5, 1012, N'Selling communal land Santuario, Antioquia', N'Selling communal land Santuario, Antioquia', N'Hermoso lote en Santuario. Cuenta con un area de 3000 metros cuadrados, altas medidas de seguridad y excelente proyeccian de valorizacian.', 5, 67, 1331, 22, 23, 53666, 3000, N'16187084689581.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (25, 5, 1012, N'RUITOQUE ALTO CONJUNTO PUNTA RUITOQUE PRIMERA ETAPA, Piedecuesta, Santander Department', N'RUITOQUE ALTO CONJUNTO PUNTA RUITOQUE PRIMERA ETAPA, Piedecuesta, Santander Department', N'TOTALLY FLAT LOT, BEAUTIFUL VIEW, CLOSED SET, WITH SOCIAL AREA.', 5, 67, 1356, 23, 24, 211085, 650, N'16187088988511.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (26, 5, 1012, N'CARRERA 6 # 24 A SUR 230, Envigado, Antioquia', N'CARRERA 6 # 24 A SUR 230, Envigado, Antioquia', N'Beautiful lot totally flat and ready to build and in an excellent parcel. The lot has grading and already has many trees planted around it.', 5, 67, 1331, 24, 25, 536657, 3321, N'16187094269031.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (27, 5, 1012, N'ALTO DE LAS PALMAS, Envigado, Antioquia', N'ALTO DE LAS PALMAS, Envigado, Antioquia', N'LOT FOR SALE IN EL ALTO DE LAS PALMAS The unit is very quiet Good view Excellent Location', 5, 67, 1331, 24, 26, 339883, 2120, N'16187098539731.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (28, 5, 1009, N'GUARNE - VEREDA SAN JOSE, Guarne, Antioquia', N'GUARNE - VEREDA SAN JOSE, Guarne, Antioquia', N'PV-L2111. Lot in Guarne, San Jos� village. with 11 blocks, does NOT pay administration, does NOT have horizontal property regulations. paved road

', 5, 67, 1331, 26, 27, 1637161, 70400, N'16187128841281.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (29, 4, 1013, N'Safaga, Red Sea Governorate', N'Safaga, Red Sea Governorate', N'High end modern unit with unobstructed sea views. Featuring two large balconies on the 4th floor. Turn key with furniture, linens, towels, kitchenware, Nespresso machine and ready to enjoy.


Italian marble kitchen counter

Italian Marble showers

Spanish floor tiles

Washing Machine

A/C units

Fully furnished', 4, 51, 1086, 27, 28, 338014, 180, N'16187138306131.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (30, 4, 1013, N'Sharm El-Sheikh, South Sinai Governorate', N'Sharm El-Sheikh, South Sinai Governorate', N'One Bedroom Apartment at Bargain Price, Sharm el Sheikh, Egypt

Euroresales Property iD - 9826071

PROPERTY LOCATiON

Moona Sharm Resort

Qesm Sharm Ash Sheikh,

South Sinai Governorate,

Egypt

PROPERTY OVERViEW

Situated on the banks of the glorious Red Sea, Sharm el Sheikh in Egypt is one of the most sought-after destinations in the world to live right now. This wonderful apartment offers you the chance to invest in this amazing part of the world, and at the current price it surely won''t be on the market for very long.

Set in a peaceful complex known as Moona Resort, this apartment features 1 bedroom, 1 bathroom, a seating area, kitchen and access to a stunning communal pool area.

This apartment not only offers a comfortable, spacious, and modern place to live but also the chance to venture into the lucrative and fast-growing holiday rental market, in which this region of Egypt is unsurprisingly one of the fastest growing. Sharm el Sheikh is not only a wonderful area in itself, thanks mainly to its stunning beaches, but for those with a curios mind and a sense of adventure, this is also a good base from which to discover the endless other must-see areas of this fascinating region such as israel, Jordan, Lebanon and Saudi Arabia.

Sport and Leisure fans will be further enticed by the area''s close proximity to countless, walking/cycling areas, water sports facilities and many excellent golf course including Maritim Jolie Golf Course (just 20 km away) and Golf Heights Resort (just 5km away).

The area is also very well connected transport wise both locally and internationally with Sharm El Sheikh international Airport just 5 miles away from the property.



ABOUT THE AREA

Sharm El Sheikh holidays put scuba diving centre stage thanks to its breath-taking ocean areas, but there''s so much more to discover. Sandy beaches, desert daytrips and buzzing nightlife are all part of its winning recipe.

The sand-swept city of Sharm El Sheikh stretches it legs near the tip of Egypt''s Sinai Peninsula, running from Nabq Bay in the north right down to Maya Bay in the south. Along the way it takes in Naama Bay, where the area''s first hotel popped up back in the Eighties. Since then, this patch of the city''s decked out its main strip with a smorgasbord of designer shopping centres, around-the-world eateries and dance-''til-you-drop nightclubs.

You have a vast 35 kilometres of coastline to play with here. Sunbathing is an option, of course, and there are plenty of sunbeds dotted along the beaches if you want to do just that. A lot of the area''s hotels are lucky enough to have their own swathes, too - which makes topping up your tan extra easy. But the real draw in these parts is the diving and snorkelling. For that you can pick ''n'' mix from shallow lagoons, rocky inlets and full-on coral reefs.

You have plenty to keep you entertained out of the water, too. At Ras Umm Sid, there''s a go-karting track you can whizz around. Naama Bay, meanwhile, plates up Cleo Park, a giant waterpark that features a lazy river, a wave pool and a bunch of chutes. Over at the Soho Square shopping centre in Shark''s Bay, you can try ice-skating and bowling. And for desert safaris and scenic hikes, you''ve got the 480-square-kilometre Ras Mohammed Nature Reserve - it''s a 40-minute drive from Sharm El Sheikh.

WHAT''S NEARBY

Hard Rock Cafe Nabq Bay, 0.1 miles

La Strada Mall, 0.2 miles

Nabq Bay, 1 miles

Porto Sharm, 1.3 miles

Pataya Beach Club, 5.2 miles

SOHO Square Sharm El Sheikh, 5.9 miles

Ghibli Raceway, 9.8 miles

Sinai Grand Casino, 10.1 miles

Space Sharm, 10.7 miles

Naama Bay, 10.8 miles



TOP ATTRACTiONS

La Dolce Vita, 10.8 miles

international Congress Center - Jolie Ville Hotels, 11.1 miles

Pacha Sharm el Sheikh, 11.2 miles

Hard Rock Cafe Naama Bay, 11.2 miles

Little Buddha, 11.3 miles

Genena City, 11.4 miles



MAiN FEATURES:

Located in a peaceful, well-run community
Spacious 50m2 apartment
1 large bedroom
Living room with sofa bed
Seating area to enjoy the stunning views and sunshine
Kitchen
Communal swimming pool at resort
Huge potential in the fast-growing holiday rental market
Walking distance to glorious beaches,
Walking distance to many restaurants, bars and shopping areas (including La Strada Mall, one minute away)
Surrounded by many areas of outstanding natural beauty
Also close to many other fascinating countries and cultures such as israel, Jordan, Lebanon and Saudi Arabia
Close to many excellent golf courses including Maritim Jolie Golf Course and Golf Heights Resort.
Just 5 miles from Sharm El Sheikh international Airport


For more information plus images and videos of the resort, check out their excellent Facebook page at https://www.facebook.com/moonasharmresort', 4, 51, 1081, 28, 29, 22608, 50, N'16187164215181.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (31, 4, 1013, N'Ain Sokhna, Suez Governorate', N'Ain Sokhna, Suez Governorate', N'Basic info
Property Type: Apartment House 
Size: 125.00 m2 (approx)
Rooms: 3 bedrooms2 bathrooms
Address: Ain Sokhna, Suez Governorate, Address available on request', 4, 51, 1080, 29, 30, 90820, 125, N'16187182334651.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (33, 4, 1013, N'Sharm Heights', N'Sharm Heights', N'Reference: UMCB-T2371. Fantastic Two Bedroom Apartment, Sharm el Sheikh, Egypt



Euroresales Property ID – 9826044



LOCATION



El-Shaikh Zayed St,

Qesm Sharm Ash Sheikh,

South Sinai Governorate,

Egypt



PROPERTY OVERVIEW



Located on the banks of the glorious Red Sea, Sharm el Sheikh in Egypt is one of the most sought-after destinations in the world to', 4, 51, 1081, 28, 29, 78144, 90, N'16187188497131.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (34, 3, 1014, N'OTTO KRAUSE al 3800, Tortuguitas - Gran Bs. As. Noroeste, Buenos Aires', N'OTTO KRAUSE al 3800, Tortuguitas - Gran Bs. As. Noroeste, Buenos Aires', N'Sobre un predio de 25.000 m2 con aproximadamente 4.500 m2 construidos de una planta con dos puentes grúa de 5 y 10 Tn, en estado de uso con los servicios correspondientes a baños, vestuarios etc. La superficie libre consta de un piso consolidado apto para el movimiento y guarda de camiones u otros vehiculos pesados.', 5, 63, 1269, 30, 31, 6661406, 4500, N'16187231567981.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (35, 3, 1014, N'SAENZ PEÑA al 1600, Constitución - Capital Federal, Buenos Aires', N'SAENZ PEÑA al 1600, Constitución - Capital Federal, Buenos Aires', N'Se trata de una propiedad en dos plantas que ocupan casi el 100% del terreno. Portón de entrada apto para camiones semi. Sobre el lateral derecho de la planta tanto en PB y 1 piso estan localizadas las oficinas en muy buen estado.', 5, 63, 1269, 31, 32, 2049663, 2040, N'16187233763821.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (36, 3, 1014, N'RUTA 6 al 83500, Zárate, Buenos Aires', N'RUTA 6 al 83500, Zárate, Buenos Aires', N'Planta ubicada estratégicamente en el eje del comercio Argentina-Brasil, sobre la Ruta Nacional Nº 6 (Ex Ruta 12) a 2.000 mts. del acceso al complejo Zárate Brazo Largo. Tiene un frente sobre la ruta de 240 mts. y sobre calle lateral noroeste de 175 mts., lateral sudeste con 203 mts. linda con la planta de Monsanto y el lateral noreste con 237 mts. linda con la planta de Petrobras. Esto conforma una superficie según título de 40.324 m2. La planta se divide dos sectores bien diferenciados: A) Un edificio de oficinas y servicios auxiliares (comedor, baños, etc.) con una superficie de 420 m2. B) La planta propiamente dicha, posee una superficie de aprox. 2.700 m2, apta para destinar a diversos rubros . Sanitarios y vestuarios para el personal. En el inmueble encontramos todas las áreas correspondientes a una planta de producción. Sobre el lateral este existe una plataforma con docks, la cual podría cerrarse para ampliar la superficie de depósitos. Sistema de incendio instalado con hidrantes y rociadores en todas las áreas, actualmente abastecidos por la planta vecina por lo que habría que completar el sistema con reserva de agua y bombas impulsoras. Planta de tratamiento de efluentes ubicada en la esquina sudeste del terreno. Calles de tránsito internas y playa de carga y descarga en hormigón, con muy buena circulación. Puerta de acceso y guardia por calle lateral. En cuanto al abastecimiento del fluido eléctrico tiene una capacidad instalada de 200 KVA. http://plantaenzarate.ljramos.com.ar/ || Gastos - Efluentes Industriales: $663 (Mensual) - Rentas: $5.837 (5 cuotas de 5837) || Medidas - Fondo: 240.0 m - Frente: 175.0 m', 5, 63, 1269, 32, 33, 4483639, 3150, N'16187235643851.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (38, 3, 1014, N'PANAMERICANA Ruta 9 No. al 28500, Don Torcuato - Gran Bs. As. Norte, Buenos Aires', N'PANAMERICANA Ruta 9 No. al 28500, Don Torcuato - Gran Bs. As. Norte, Buenos Aires', N'Propiedad sobre Colectora Panamericana Oeste con varios galpones, oficinas y amplia playa de maniobras. La propiedad se puede subdividir en dos partes: 1. Superficie terreno: 6755,42 m2. Superficie cubierta: 2612,57 m2. En oficinas: 809,81 m2. 2. Superficie terreno: 12988 m2. Superficie cubierta: 2929,12 m2. En oficinas: 485,24 m2.', 5, 63, 1269, 30, 34, 15372475, 3000, N'16187237592271.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (39, 2, 1015, N'Ridge RIDGE, Accra, Greater Accra Region', N'Ridge RIDGE, Accra, Greater Accra Region', N'Ridge 5 Bedroom Townhouse Features: En-suite master bedroom Fitted wardrobes Fitted kitchen Dining area Spacious living area Garage Rooftop Terrace 24 Hour security Gym Swimming pool Quiet neighborhood', 4, 55, 1155, 33, 35, 778712, 100, N'16187306128041.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (40, 2, 1015, N'CANTONMENTS, Accra, Greater Accra Region', N'CANTONMENTS, Accra, Greater Accra Region', N'Newly built modern 4 bedroom townhouse for sale situated near the Italian Embassy. Features: En-suite bedrooms Fitted wardrobes Fitted kitchen Extra fitted kitchen Gated community Swimming pool Parking 24 hour security Tarred roads', 4, 55, 1155, 33, 36, 5616964, 120, N'16187307568171.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (41, 2, 1015, N'TSE ADDO, Accra, Greater Accra Region', N'TSE ADDO, Accra, Greater Accra Region', N'Executive 4 bedroom townhouse, all en-suite, with an outer staff quarters with bathroom. The property is equipped with a fully fitted modern kitchen, sizable living room with a family room upstairs. Excellent bathroom sizes with all modern fittings. Its located in the quiet area of Tse addo, with easy access to all amenities including close proximity to Accra''s best international schools and the kotoka International Airport.', 4, 55, 1155, 33, 37, 488558, 360, N'16187309575051.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (42, 2, 1015, N'EAST AIRPORT, Accra, Greater Accra Region', N'EAST AIRPORT, Accra, Greater Accra Region', N'Spectacular brand new 4 bedroom townhome, all en-suite with a staff quarters and bathroom. This home boasts of a fully fitted modern kitchen with top quality appliances. Please call for a viewing', 4, 55, 1155, 33, 38, 514272, 495, N'16187313451711.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (43, 2, 1016, N'Jalil Sutera, Bukit Jalil, Kuala Lumpur', N'Jalil Sutera, Bukit Jalil, Kuala Lumpur', N'2.5sty link house in Jalil Sutera right opposite of SJK (C) Lai Meng Renovated modern design. Gated and guarded Easy access to KESAS Bukit Jalil - Puchong Highway Near Pavillion 2 Walking distance to Bukit Jalil City Rm1.78m (Nego) Please contact CHAN 012-2994660 for information.', 1, 23, 472, 34, 39, 557810, 300, N'16187329482321.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (44, 2, 1016, N'Casaman, Desa ParkCity, Kuala Lumpur', N'Casaman, Desa ParkCity, Kuala Lumpur', N'Casaman Desa Parkcity ParkCity Heights Desa ParkCity Casaman Desa ParkCity Cheapest and nice view in Casaman Casaman - situated on a hilltop with a majestic view of the skyline sporting an immersive themed landscape environment making it - breathtakingly a signature upscale parkhomes. Casaman @ Desa ParkCity has a total of only 147 units of both 2 & 3 storey terraced homes with built-ups ranging from 3100 sqft for the 2-storeys & 5300 sqft for the 3-storeys. Key notable features of Casaman would definitely be the infinity pool which is suspended dramatically over the edge of the cliff not to mention the extensively themed landscape. Besides the strict 24-hour security each home comes installed with it s own alarm system. There is only one entrance and exit to the area. In Desa ParkCity there are various schools ranging from private international schools to public schools including The International School @ ParkCity SJK(C) Kepong 3 and many others. Other schools in the area include Kepong Baru National Secondary School SJK(C) Khai SJK(C) Jinjang Selatan. Accessibility to Casaman or Desa ParkCity currently include Selayang-Kepong Highway DUKE Highway New Klang Valley Expressway (NKVE) Damansara-Puchong Highway (LDP) and the Sprint Expressway. A variety of shopping and food options nearby include Plaza Arkadia Shopping Mall - which has a Village Grocer for all your groceries and household needs and The Waterfront @ ParkCity for everything else. Desa ParkCity also has pet friendly parks for all the pet lovers out there a nice large outdoor space for you and your family to bond with your pet. Health wise besides the various clinics and pharmacies there is also the ParkCity Medical Center. Last but not least ample vets and groomers for your furry family members too.', 1, 23, 472, 35, 40, 1253507, 286, N'16187334451561.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (45, 2, 1016, N'Sunway Montana, Desa Melawati, Melawati, Taman Melawati, Kuala Lumpur', N'Sunway Montana, Desa Melawati, Melawati, Taman Melawati, Kuala Lumpur', N'SUNWAY MONTANA for SALE Contact No. : 017-280 9663 (Leane Wong) SUNWAY MONTANA located at Desa Melawati ASKING PRICE: RM 1 920 000.00 Name : Sunway Montana Location : Desa Melawati Type : 3-Storey Courtyard Villa Land Size : 26 x 82 Built-up : 3 600 sqft Rooms : 4 1 Bathrooms : 4 1 Tenure : Freehold Furnishing : Unfurnished ------------------------------------------------------------------------ SUNWAY MONTANA Facilities:- Exclusive Clubhouse = Swimming Pool = Gym = Gourmet Kitchen = Function Hall = Yoga Room = Karaoke Room = Surau = Meeting Room = Executive Lounge = The Library Private forest park with skywalk facility Playground Basketball court Jogging / Jungle trail BBQ Plinth 24 hours security ------------------------------------------------------------------------ Amenities surrounding Sunway Montana : Kolej Universiti Tunku Abdul Rahman ISKL Secondary 10 15 mins to Wangsa Walk Aeon Big Wangsa 118 etc Accessible to/from major expressway: MRR2 DUKE NKVE AKLEH Jln Genting Klang Nearby area : Ulu Kelang Setapak Wangsa Maju Sri Rampai Taman Melati etc. ------------------------------------------------------------------------ !! Why waiting call me !! !! Want to know more call me !! Contact: Leane 6017-280 9663 Sunway Montana is a low density residential project with 158 units of 3-4 storey country homes 14 units of 3- storey semi-detached and 10 units of 3-storey courtyard villas allocated in the first phase of the residential development which covers 14 acres of private forest privacy will not be an issue there. ========== DISCLAIMER ========== Photo is only for ILLUSTRATION PURPOSE and reference only. To protect owner s and tenants privacy pictures shown may not be the actual unit.', 1, 23, 472, 36, 41, 601683, 334, N'16187348410321.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (46, 2, 1016, N'Bangsar, Kuala Lumpur', N'Bangsar, Kuala Lumpur', N'Freehold 2 Storey Terrace House in Bangsar Baru Kuala Lumpur 2 Storey Terrace House Property Address: Jalan Terasek 7 Bangsar Baru 59100 Kuala Lumpur Built Up: 2 300 sq.ft (Approx. RM 913.04 per sq.ft) Land Area: 2 762 sq.ft Auction Price: RM 2 100 000 Auction Date: 27-May-2021 (Thursday) Tenure: Freehold Strategically located area 6 min away from Bangsar LRT Station 11 min to KL Sentral Close to Bangsar Village Damansara City Mall Mid Valley Megamall Near to IPG Kampus Bahasa Melayu Akademi Pengajian Islam (University of Malaya) & Methodist College Kuala Lumpur (MCKL) Easily accessible via SPRINT Highway Click here to download POS or view floor plan: https://www.ngchanmau.com/property/43888 Learn to Buy Auction We are Ng Chan Mau & Co. Sdn Bhd the Bank s appointed Exclusive Auction Sales Marketing Coordinator for this auction property. Call Us at 1700-81-8668 or WhatsApp 012-520 5600 https://wa.me/60125205600 for more info and free assistance. This is a fresh new auction listing details displayed may incomplete at the moment please contact us for further information. Pictures displayed are for illustration purpose to provide you with a general idea on the property. Free information and advice provided no commission will be charged.', 1, 23, 472, 37, 42, 658091, 214, N'16187352862511.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (47, 1, 1017, N'Paravur-Varkala Rd, Kappil, Kerala', N'Paravur-Varkala Rd, Kappil, Kerala', N'


Euroresales Property ID- 9825469



Property Information:



The property is called the Dragonfly. It is located on the edge of Kappil Lake, Kappil, District of Trivandrum, Kerala, Southern India. The property overlooks the lake and see beyond and is 200 metres from Kappil.beach.



The property will be sold furnished but that does not', 1, 11, 253, 38, 43, 171483, 200, N'16187367927721.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (48, 1, 1017, N'3963 Crans-Montana, Crans-Montana, Valais', N'3963 Crans-Montana, Crans-Montana, Valais', N'Visitez cet appartement depuis votre desktop/mobile : https://www.nodalview.com/6v8bPCoVxnzLxWdQBCS3D7QU

Appartement de 4.5 pièces situé à l''entrée du village de Montana dans un petit chalet résidentiel.

Composition de l''appartement :
- Un hall d''entrée
- Un cuisine fermée
- Un séjour avec accès au balcon
- Chambre à coucher parentale avec accès au balcon
- Deux chambres à coucher (une utilisée actuellement comme bureau)
- Une salle de bain
- Un WC
- Un balcon orienté Sud

Remarque :
- Cet appartement est vendu avec une place de parc extérieure
- Cet appartement est disponible en résidence secondaire et en vente aux étrangers', 3, 39, 814, 39, 45, 667368, 95, N'16187397625761.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (49, 1, 1017, N'Broc, Fribourg', N'Broc, Fribourg', N'Plus que 2 appartements

Magnifique appartement de 3.5 idéalement situé à proximité de toutes les commodités.

Ce logement bénéficie de finitions de haute qualité (cuisine, carrelage, parquets, revêtements muraux, sanitaires).

L''isolation thermique et phonique de ce bien est réalisée conformément aux dernières prescriptions en vigueur.

Composition de l''appartement :

- hall d''entrée avec armoires murales
- 1 armoire avec colonne lave-linge/sèche-linge
- 1 salle de bains
- cuisine entièrement équipée, ouverte sur le séjour
- spacieux séjour bénéficiant de grandes baies vitrées
- 1 suite parentale avec dressing et salle de bains
- 1 chambre à coucher
- balcon bénéficiant d''un splendide panorama

1 place de parc souterraine est prévue pour cet appartement, facturée en sus CHF 30''000.00/place.

La promotion compte 7 appartements.', 3, 39, 798, 40, 46, 828941, 107, N'16187400205431.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (50, 1, 1017, N'Winterthur, Winterthur, Zürich', N'Winterthur, Winterthur, Zürich', N'Luxuriöse Attikawohnung mit umwerfender Terrasse und toller Weitsicht

Dieses aussergewöhnliche, lichtdurchflutete und sehr gepflegte 4.5 Zimmer Bijou im gesuchten Haldengutquartier besticht durch seine offene, grosszügige Raumaufteilung und lässt fast keine Wünsche offen. Böden, Küche und Bäder sind aus hochwertigen Materialien. Ein absolutes Highlight ist sicherlich die grosse, zum Teil gedeckte Terasse, die einen unverbaubaren Blick offenbart. Zwei Stellplätze, ein Keller sowie eine private Sauna runden dieses äusserst attraktive Angebot ab.', 3, 39, 817, 41, 47, 4004208, 170, N'16187403306391.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (55, 1, 1022, N'Demo', N'Demo', N'Demo Des', 1, 27, 637, 1, 1, 100, 100, N'16188023252402.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (57, 7, 1006, N'Land in the Nguyen Cuu Van - Binh Thanh', N'Land in the Nguyen Cuu Van - Binh Thanh', N'100% residential land, separate book for each platform, free construction, change of name during the day.

-Near the high security neighborhood committee.

-Located on Nguyen Cuu Van Binh Front Street, the car can comfortably come in and out. Crowded residential business to buy and sell.

- 12m road to move comfortably
- Completed infrastructure, buy and use immediately. Full tap water electric for your use.
- Crossing with major routes such as the Soviet Union and Dien Bien Phu province. move to convenient districts
- Area: 80m2
-Price: 4 billion (the owner price)', 1, 1, 45, 516, 1, 190767, 80, N'16188415437881.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (58, 7, 1006, N'Land in the Soc Son - Ha Noi', N'Land in the Soc Son - Ha Noi', N'🌈LAND FLOOR PLATFORM 100M2 TO 150M2 IN SON SON HA NOI.

Address: Phu Ha, Minh Phu Commune, Soc Son District, Hanoi.

---------------------------------------

🚩 Soc Son land is currently the hot spot, and in a few weeks the price will skyrocket, this time the land price will increase, not a virtual fever, so you should quickly invest in yourself to get the cheapest price.

⚡ Area: 112,5m2 still lot; 119.7m2; 100m2; 150m2 (sold lots 211m2 and 119.7)

⚡ Price: for investor (negotiable)

⚡ Legal: Red book, notarized always in the day

🌵 Nearby facilities: Near NH2, Nam Cuong market, Phu Ha market, near school c1, c2, c3, CPC, near the bus station, convenient traffic, road 2 cars avoid each other, concrete road surface , built a wall ...

🌵 Suitable for investors, or build houses for workers to rent, or workers buy to live in, very convenient', 1, 1, 16, 175, 2, 52027, 100, N'16188422003421.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (59, 7, 1006, N'Land in the Bao Loc City - Lam Dong', N'Land in the Bao Loc City - Lam Dong', N'🌈Sell land in the city. Bao Loc - Price is only 5.5 million / m2 - Full legal

Address: Dinh Cong Trang Street, Loc Chau Commune, City. Bao Loc, Lam Dong

PRODUCT DESCRIPTION:

The ground land is located right at the southern ring road, in the city. Bao Loc

💎Large road, convenient traffic, crowded population

💎 Only 1km from Highway 20, Highway 55 only 3km, into the city center less than 2km

Only 1km from Ton Duc Thang University, 3.5km from Loc Son Industrial Park

💎Finished infrastructure, clear asphalt.

💎Enjoy the facilities of Bao Loc city with a radius of 2km (supermarket, hospital, school market of primary, secondary, high school ...)

💎Area: From 200m2 to 500m2, each 200m2 residential area is available

Full legal, beautiful, flat land, located next to the poetic river, overlooking the majestic sapug range.

🌈Profitable investment opportunities in Bao Loc Lam Dong with second-home trend at only 6 million / m2. Every day fully enjoy the fresh, cool, relaxing atmosphere here!', 1, 1, 36, 406, 3, 52027, 200, N'16188423478191.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (60, 7, 1006, N'Land in the Phu Quoc - Kien Giang', N'Land in the Phu Quoc - Kien Giang', N'Location: Rach Ham Hamlet, Ham Ninh Commune, City. Phu Quoc
Area: 905,4 m2
- 12M East Island Front, 300m from Sea
- Less than 500m from Ham Ninh intersection
- 600m from the market, secondary school, People''s Committee, and medical station
- 10 minutes from Ben Tau, Phu Quoc Airport by car
- Near Ham Ninh Community Tourism Village', 1, 1, 58, 641, 4, 346849, 905, N'16188424898591.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (61, 7, 1007, N'Land in the Phan Thiet airport', N'Land in the Phan Thiet airport', N'- The remaining 5000m2, divided into 05 books, each book is 1000m2 (with 300 residences)

- Location: Tran Binh Trong

- View wind power

- The gravel road is 5 m', 1, 1, 39, 438, 8, 86712, 1000, N'16188429970191.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (62, 7, 1007, N'Land for sale in Phanom, Louangphrabang', N'Land for sale in Phanom, Louangphrabang', N'Land for sale in Phanom, Louangphrabang
Location location location the key for a success in residential development.  This land is ready to build  luxurious hotel/Apartment along the Namkhan river.

Highlights

Financing at 6% over 10 years is available.

Private road to Access 

155 meters in front of Namkhan

New paved road to access

Next to new residential management center project of Power China

Water electricity 

Close to Namkhan project a biological farm

30% cash down. ', 1, 2, 71, 758, 12, 689000, 6485, N'16188444932201.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (63, 7, 1007, N'Land for sale in Ban Kengpayang, Hadxayfong District', N'Land for sale in Ban Kengpayang, Hadxayfong District', N'Land for sale in Vientiane
for sale at Ban Kengpayang, Hadxayfong District, Vientiane Lao, DONGPHOSY. VERY CLOSE TO MEKONG RIVERP.D.R Size 3.430 m2. 2 acresVery nice wall surrounding the whole land.From the main Road is about 550 meters. Interested please contact ............. it is suitable for the construction of private house. The location is quiet and beautiful viewsONLY SERIOUS NEGOTIATIONS THANK YOU', 1, 2, 78, 828, 9, 80000, 3430, N'16188446910671.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (64, 7, 1007, N'Land for sale in Hongsouphap, Vientiane', N'Land for sale in Hongsouphap, Vientiane', N'Land for sale in Hongsouphap, Vientiane
Section for sale in developing area.  It is suitable for residential housing with good potential for growth.  Electricity and water are available.  Neighbours'' houses are recently built (two years or less).  ', 1, 2, 74, 794, 11, 75000, 362, N'16188449885181.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (65, 5, 1008, N'Land in the Bao Lam - Lam Dong', N'Land in the Bao Lam - Lam Dong', N'But try one slow observation, you will have a very different experience of this seemingly very boring city. Bao Loc City website is built to share the meaning of current life that many people are looking forward to and feel more in love with their own life. 🏆140m2 80m 8m asphalt residential land price 379 million / 1 hot beautiful background 🏆', 1, 1, 36, 406, 3, 27054, 150, N'16188456503186.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (66, 5, 1008, N'Land for sale in Pham Van Hai - Binh Chanh - Ho Chi Minh City', N'Land for sale in Pham Van Hai - Binh Chanh - Ho Chi Minh City', N'2) LIQUID ASSETS POSITION.

- Located on the route of PROVINCE 10 - TRAN VAN GIU, adjacent to AEON Binh Tan, 3.4km from Ba Hom intersection, takes 8 minutes to Phu Lam park, 15 minutes to Tan Binh District, Tan Phu District, District 11. ..

- Nearly 3 large industrial zones up to 500,000 workers are working. 4,000 foreign experts are living and working here.

- Located adjacent to Binh Tan, Tan Phu, District 6, District 10, District 11 ....

- Guarantee 100% real price and say no to virtual price.

 

3) AREA OF STANDARD PLANNING AND MULTI-TYPE:

+ Area of ​​townhouse land: 5m x 16m, 5m x 20m, 5m x 21m, 5m x 26m, 6m x 20m, 6m x 17.5m ...

+ Villa land area: 10m x 19m, 10m x 21m, 10m x 26m ...

+ Land area of ​​corner 2 fronts: 8m x 21m, 9m x 21m, 10m x 26m, ...

+ Area of ​​corner land 2, villa plot: 10m x 21m, 10m x 26m, 12m x 26m, ...

 

= LIQUID PRICE: 1.2 billion / 80m2 background. Diverse location for customers to choose from depending on needs.

 

INFORMATION 2 ROOMS AND LEVELS 4.

+ Area: 5X30 = 150m2 and earning 12 million a month. PRIVATE PINK BOOKS.

+ Area: 10x25 = 250m2, income 22 million / month, 20m in front of the house, opposite Pouyuen II industrial park. PRIVATE PINK BOOKS.

+ GENERATE HOUSE LEVEL 4: Area 5x26m. PRIVATE PINK BOOKS.

 

4) LEGAL CLEARLY TRANSPARENCY:

- Legal transparency (pink book permanently).

- Land in urban areas. ( City ). You buy 1 background 1 book, 2 backgrounds 2 books.

- Include name notarization, support for construction permits, completion for customers.

- 100% residential land with detailed 1/500 planning does not worry about land clearance.

 

5) INFRASTRUCTURE:

- Road has been paved from 14m - 42m.- Negative electric system, sewers are equipped.

- Use Cho Lon tap water to ensure the domestic water source for the people.

- Existing residential area (near market, school, hospital ...).

- Many industrial parks, workshops, convenient for trading, building and renting accommodation.

Full and adjacent utilities such as The Gioi Di Dong, Dien May Xanh, Big C, Coop Mart, Pou Yuen Industrial Park, other convenient services ...

 

6) FLEXIBLE PAYMENT METHOD:

- Quick payment:

Phase 1: (Signing the contract of land use right right agreement) ... 20% stake.

Phase 2: (Signing the land use right certificate contract) ... 77% payment.

Stage 3: (Receive land use right certificate) ... 3% payment.

- Borrowing from banks:

+ Loan support from 50 - 70% within 25 years. Very different experience about this seemingly very boring city. The website Bao Loc city is built to share the meaning of current life that many people are looking forward to and feel more in love with their own life. 140m2 residential land 80m 8m asphalt road price 379 million / 1 hot beautiful background 🏆', 1, 1, 45, 521, 5, 52027, 80, N'16188458440651.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (67, 5, 1008, N'Land for sale in Chon Thanh - Binh Phuoc', N'Land for sale in Chon Thanh - Binh Phuoc', N'Because I moved my house to Saigon, I sold 1.5 hectares, so that I could go to work on land right at the market, school, and people could freely invest in business and trade.

Mother''s house land for 2006 is currently stuck so that it can sell 15,000m2 = 15 private owners

Land is residential land with separate books because it is too big to sell and divided into 5 books. 1 book of 1 sample sold 168 thousand million m2.

4 books of 1200m2 of land for residential planning, separate books for selling 460 million on the book.

The land is beautiful and flat, opposite the crowded factory, 22m highway

Full water and electricity, public road 2 at a time, notarized right in the state.

How about the cost of procedures in the day when the price is correct does not incur anything.

The crowded central market is only 2 happiness, the asphalt road in front of the house is working.', 1, 1, 48, 549, 7, 86712, 1500, N'16188461670481.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (68, 5, 1008, N'Land for sale in Ha Dong - Ha Noi', N'Land for sale in Ha Dong - Ha Noi', N'Selling land for cars to load into the house, the red book of my own name

- 700m from Yen Nghia pump station, cost 25 million / m2.

  7m for sale land frontage. Area 201m2.

Selling price 25 million / m2. How to name the red book.

  The way the truck can go, the car turns comfortably, the lane is clear.

. The population is densely populated, close to kindergartens, primary schools, high schools, 700 meters from Yen Nghia pumping station.

  The red book as shown in the new image is re-issued as in the last picture of 2019, so you never have to worry about planning or anything. There are aluminum and glass factories for rent at the land.

  Whoever buys the sublease is also very ok.', 1, 1, 16, 155, 13, 216780, 201, N'16188464124011.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (69, 5, 1012, N'Land for sale in Nakhe, Vientiane', N'Land for sale in Nakhe, Vientiane', N'Land for sale in Nakhe, Vientiane
Nice land for sell the area is 2,045m2 ', 1, 2, 78, 827, 17, 320, 2045, N'1618846883828land-for-sale-in-nakhe-vientiane.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (70, 5, 1012, N'Land for sale in Vattai Gnay Thong, Vientiane', N'Land for sale in Vattai Gnay Thong, Vientiane', N'Land for sale in Vattai Gnay Thong, Vientiane

Prices can be negotiated. The property is located at the end of the road zoned residential. Close to Kok Pao Market, near the airport, and near the Korean Embassy in the city.', 1, 2, 78, 823, 15, 501000, 711, N'16188472040871.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (72, 5, 1012, N'Land for sale in Latkhuay, Vientiane', N'Land for sale in Latkhuay, Vientiane', N'Land for sale in Latkhuay, Vientiane
Agriculture land for agriculture practice, farming or resort closed to the main road and Nam Ngam River, Latkhauy Village, Xaythany District, Vientaine Capital; Area : 61,670 m2; Price : $ 18.75 / m2 (Negotiable)', 1, 2, 78, 827, 15, 1156313, 61670, N'16188473011191.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (73, 5, 1012, N'Land for sale in Sangweuy, Vientiane', N'Land for sale in Sangweuy, Vientiane', N'Land for sale in Sangweuy, Vientiane
In central Road, electricity, water access, can build the house directly. quiet place and beautiful view.,', 1, 2, 78, 825, 14, 150000, 980, N'16188475018461.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (74, 4, 1009, N'Own the apartment right away Tecco Diamond 2PN', N'Own the apartment right away Tecco Diamond 2PN', N'🌈 TECCO DIAMOND - NEW SONG SYMBOLS IN THANH TRI

Project name: Tecco Diamond Thanh Tri Apartment Building

👉 Location: Tu Hiep urban area, Thanh Tri District, Ha No

Investor: Corporation Tecco Hanoi Corporation

👉 Verification unit: Construction Science and Technology Joint Stock Company

👉 Appraisal Agency: Construction Management Department - Ministry of Construction

Construction density: 15 units on 1 floor, 5 lifts

👉 Scale includes: 2 Block A, B with 25 floors, 2 basements

👉 Total number of apartments: 665 units', 1, 1, 16, 178, 18, 67635, 23500, N'16188482911001.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (75, 4, 1009, N'Small apartment for sale in District 3 cheap', N'Small apartment for sale in District 3 cheap', N'MINI APARTMENT FOR SALE BEST PRICE IN SAIGON

🏡 Location: CMT8 Street, Ward 10, District 3, HCMC


🎁 Offering Full comfortable interior

AREA: 25 - 42m2

🎁 Discount up to 3.5%

💥 Investor commits to sublease for 3 years at 6-8 million / month. Or buy back 10% difference

💎 11-month installment payment 0% interest, receive home Q2 / 2022

👉 Owns up to 50 years', 1, 1, 45, 506, 19, 47691, 42, N'16188485126421.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (76, 4, 1009, N'Apartment for sale in District 7', N'Apartment for sale in District 7', N'+ Selling apartment in District 7 Saigon Reveside, near Phu My Hung

+ Area: 66m2, 2 bedrooms, 2 wc, close to home delivery

+ Near Phu My bridge through district 2 center

+ Tax-inclusive price of 2.35 billion VND

+ The project has swimming pools, trees, children''s play area

+ Full amenities, handover basic high-class furniture

+ Contact now, limited quantity, hot products', 1, 1, 45, 510, 19, 101886, 66, N'161884905249311.jpeg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (77, 4, 1009, N'Sale of apartments Offictel Sky Center Pho Quang', N'Sale of apartments Offictel Sky Center Pho Quang', N'Sale of apartments Offictel Sky Center Pho Quang

Area: 45m2.

  Winter view to welcome dawn every day, has 1 bedroom.

  Full facilities area, swimming pool, internal park, 2 parking lots, caffe, restaurant ... near Tan Son Nhat airport.

Trade advantages.', 1, 1, 45, 519, 19, 110558, 45, N'16188492615971.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (78, 4, 1018, N'Apartment for Sale in Popular Location.', N'Apartment for Sale in Popular Location.', N'20 Bedroom Apartment for sale in Phonsinouan, Vientiane
Excellent opportunity for an investor. No need to take the risk of constructing a new apartment and trying to find tenants - this one is often fully occupied and in a popular location. Take over as is and bring in $50-55,000/year (according to recent revenue intake), or remodel and increase the potential return on investment.

10 two-bedroom units (two have two bathrooms)

Land area: 448sqm

Car and motorbike parking

Near Sengdara fitness and international schools', 1, 2, 78, 825, 23, 449000, 560, N'16188498705661.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (79, 4, 1018, N'10 Bedroom Apartment for sale in Luangprabang, Louangphrabang', N'10 Bedroom Apartment for sale in Luangprabang, Louangphrabang', N'10 Bedroom Apartment for sale in Luangprabang, Louangphrabang
Unique Opportunity for people who are retired and looking for Secure Income and tranquility

New résidentiel project built in 2018 at Ban Phanom.   The property  is located at 3 km from the center of Luang Prabang  in a secure and quiet area in front of the Namkhan river.   Actually the apartment are rented per day at $35, per week at $250, or per months at $500. Each apartment have a area of 50 sq. mt. with a separate bedroom. They are all fully furnished (fridge, a/c, cooking gaz, King or Queen beds, table, chairs, etc... all windows or patio doors are in aluminium.  Total land area 1850 sqm  New gabion wall was build recently to stop the erosion and give a better access to the river.  the gabion wall have 6 meters high X 80 meters long.  Potential income is over 56,000$ 

The house of 98 sq. mt. where the owner live is fully furnished with a/c (2), screen tv, large patio, modern kitchen, bath, etc...

Lease is valid for 55 years.   The asking price and condition are subject to negociation.  The owner is ready to finance for 10 or 15 years amortization.', 1, 2, 71, 758, 25, 689000, 1600, N'16188501529951.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (80, 2, 1010, N'Furnished apartment near Lao-Thai border.', N'Furnished apartment near Lao-Thai border.', N'1 Bedroom Apartment for Sale or Rent in Vientiane
Kotobuki Apartment is brand-new apartment placed in Nonghai Village.

　We just start tenant recruitment on July 1, 2016.All rooms are equipped with a washlet. All rooms on the first floor have hot tubs and all rooms on the second floor have massage showers.

-Facility and Service- 

House cleaning and linen change services twice a week.

Shared laundry and parking.

Free bike rental service!

Furniture: Bed, Sofa, Cafe Table, Desk, Closet

Electric: appliancesTV, Refrigerator, Microwave oven, Hair Dryer


Please come to see the new style apartment. Please contact us if you are interested!', 1, 2, 78, 828, 24, 550, 40, N'16188507842791.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (81, 2, 1010, N'Furnished apartment near Lao-VietNam border.', N'Furnished apartment near Lao-VietNam border.', N'1 Bedroom Apartment for Sale or Rent in Vientiane
Kotobuki Apartment is brand-new apartment placed in Nonghai Village.

　We just start tenant recruitment on July 1, 2016.All rooms are equipped with a washlet. All rooms on the first floor have hot tubs and all rooms on the second floor have massage showers.

-Facility and Service- 

House cleaning and linen change services twice a week.

Shared laundry and parking.

Free bike rental service!

Furniture: Bed, Sofa, Cafe Table, Desk, Closet

Electric: appliancesTV, Refrigerator, Microwave oven, Hair Dryer


Please come to see the new style apartment. Please contact us if you are interested!', 1, 2, 68, 738, 26, 630, 50, N'16188511427853.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (83, 2, 1013, N'Renting apartments Vinhomes Gardenia 2NF', N'Renting apartments Vinhomes Gardenia 2NF', N'          🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥

       🏯🌺VINHOMES GARDENIA🌺🏤

       🌻 FULL INTERIOR APARTMENT 2
  
         RENTAL PRICE: 14 MILLION VND

           💒 (BUILDING A - FLOOR X) 💒

                👆👆👆👆👆👆👆👆👆👆

👉Clean: 2 rooms

💬Area: 80 M2

🤏note: rent can be negotiated when guests come to watch live.

🌱 With the apartment about to be empty, please contact me to see the house and deposit a deposit in front of the apartment.

✍Term form: 3/6 months & 1 month deposit

🗨Condition: the apartment is empty.

💞If you are interested in renting an apartment, contact me by:

🤝We look forward to receiving the attention of all of you!', 1, 1, 16, 160, 28, 563, 70, N'16188518761892.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (84, 2, 1013, N'1 bedroom apartment for rent, brand new, fully furnished', N'1 bedroom apartment for rent, brand new, fully furnished', N'1 bedroom apartment for rent, area 70m2, Fully furnished, equipment and supplies

Equipment: air-conditioner, refrigerator, induction hob, heater, super-speed kettle, induction cooker, pots, rice cookers, bed sheets

Furniture: Tables, chairs, beds, wardrobes', 1, 1, 37, 420, 27, 216, 70, N'16188520390081.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (85, 3, 1014, N'Factory for sale in Xaysetha, Attapeu', N'Factory for sale in Xaysetha, Attapeu', N'Ban Savang factory for sale total factory size 9,677m2, domitory female including, total is 26x55m2, 100m from the factory there is a male dormitory 45 rooms.', 1, 2, 78, 824, 30, 4000000, 9677, N'16188536112031.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (86, 3, 1014, N'Industrial for sale in Xaythany, Vientiane', N'Industrial for sale in Xaythany, Vientiane', N'Industrial for sale in Xaythany, Vientiane', 1, 2, 78, 827, 16, 3600000, 7690, N'16188538059931.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (87, 3, 1014, N'Industrial for sale in Hadxaifong, Vientiane', N'Industrial for sale in Hadxaifong, Vientiane', N'Garment factory near main road for sale. Commercial for sale in Hadxaifong, Vientiane', 1, 2, 78, 828, 16, 3500000, 6000, N'16188540999271.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (88, 3, 1015, N'Industrial for sale in Yen Nhan, My Hao', N'Industrial for sale in Yen Nhan, My Hao', N'Industrial for sale in Yen Nhan, My Hao', 1, 1, 21, 223, 31, 23845, 10000, N'16188545452381.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (89, 1, 1016, N'House for sale in Binh market', N'House for sale in Binh market', N'House for sale in Binh market', 1, 1, 45, 521, 5, 52027, 112, N'16188548264111.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (90, 1, 1016, N'House for sale in Huynh Tan Phat', N'House for sale in Huynh Tan Phat', N'Nice house for sale with 3 floors at:

- Location: 458/36/10 Huynh Tan Phat, Binh Thuan Ward, District 7, Ho Chi Minh

- Area: 120.2 m2, West direction

- House design: 3 Floors + 1 Terrace (5 Bedrooms, 4 WCs, 1 Large Living Room)

- Utilities :

+ Security and quiet residential area suitable for families with many babies because the house has a yard for babies to play, cool

+ Located near Canadian International School, District 7 Administrative Center and Phap Viet Hospital, Tam Duc Heart Hospital, Tan My Market, District 7 Co.opmart Supermarket, SECC International Exhibition, Crescent Mall , Vivo City

+ Going to District 1 takes 10 minutes, going to P', 1, 1, 45, 510, 32, 377198, 120, N'16188550984411.jpg', 1)
INSERT [dbo].[project] ([ID], [CategoryID], [UserID], [ProjectName], [Title], [Description], [Location], [Country], [City], [District], [Are], [Price], [Sqft], [ImageBannerName], [LevelActive]) VALUES (91, 3, 1017, N'Becamex Industrial area', N'Becamex Industrial area', N'Becamex Industrial area', 1, 1, 36, 406, 3, 3772847, 12000, N'16188553430932.jpg', 0)
SET IDENTITY_INSERT [dbo].[project] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1, N'Admin', N'neo@gmail.com', N'Thanhtung09!', N'string', N'HN', N'string', N'0987654321', N'AvatarDefault.jpg', 1, 0, 0, N'admin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1006, N'Phạm Thanh Tùng', N'nero9921@gmail.com', N'Thanhtung09!', N'Company Seller', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'null', N'1234567891', N'AvatarDefault.jpg', 1, 1, 0, N'seller', N'18 Phạm Văn Đồng', N'Hòa Bình', N'VietNam', N'Điện Biên Đông', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1007, N'Trần Văn An', N'nero9911@gmail.com', N'Thanhtung09!', N'Company Seller', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'null', N'1757378563', N'AvatarDefault.jpg', 1, 1, 0, N'seller', N'28 Thon 2', N'Sơn La', N'VietNam', N'Điện Biên Đông', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1008, N'Nguyễn Thị Bình', N'binh@gmail.com', N'Thanhtung09!', N'Compony Agent', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'null', N'78342983542', N'AvatarDefault.jpg', 1, 2, 0, N'agent', N'12 st', N'Hải Dương', N'VietNam', N'Hồng Bàng', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1009, N'Trần Văn Tuấn', N'tuan@gmail.com', N'Thanhtung09!', N'Company Seller', N'i can flyyyyyyyyyyyyyyyyyyy', N'null', N'077654323412', N'1618847705280neo-2018.jpg', 1, 2, 0, N'seller', N'74 st.', N'Nghệ An', N'VietNam', N'Quan Sơn', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1010, N'Lê Quốc Huy', N'huy123@gmail.com', N'Thanhtung09!', N'Compony Agent', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'null', N'9246835252', N'1618706245317Image about aesthetic in somethings by Jami on We Heart It.png', 1, 2, 0, N'agent', N'47 st', N'Lao Cai', N'VietNam', N'Bat Xat', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1012, N'Aleema Anne', N'anne@gmail.com', N'Thanhtung09!', N'Company Seller', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'67673567235', N'AvatarDefault.jpg', 1, 2, 0, N'seller', N'58 st.', N'Xiengkhouang', N'Laos', N'Hadxayfong', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1013, N'June Frank', N'june@gmail.com', N'Thanhtung09!', N'Company Seller', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'0000000000', N'AvatarDefault.jpg', 1, 2, 0, N'seller', N'null', N'null', N'null', N'null', N'null')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1014, N'Dakshi Henry', N'dakshi@gmail.com', N'Thanhtung09!', N'Company Seller', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'76983892553', N'AvatarDefault.jpg', 1, 2, 0, N'seller', N'48 St.', N'Sekong', N'Laos', N'Meung', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1015, N'Charlotte John', N'charlotte@gmail.com', N'Thanhtung09!', N'Compony Agent', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'1288574836', N'AvatarDefault.jpg', 1, 2, 0, N'agent', N'Minh Phu', N'Thái Bình', N'VietNam', N'Quảng Hòa', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1016, N'Josie Mark', N'josie@gmail.com', N'Thanhtung09!', N'Compony Agent', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'2617472464', N'AvatarDefault.jpg', 1, 2, 0, N'agent', N'48 St.', N'Thái Nguyên', N'VietNam', N'Bảo Yên', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1017, N'Davina Mary', N'davina@gmail.com', N'Thanhtung09!', N'Compony Agent', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'1264852354', N'AvatarDefault.jpg', 1, 1, 0, N'agent', N'Yen Nghia', N'Phú Thọ', N'VietNam', N'Sông Mã', N'Asia')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type], [Are], [City], [Country], [District], [Location]) VALUES (1018, N'Mohini Paul', N'mohini@gmail.com', N'Thanhtung09!', N'Compony Agent', N'What is the exact sequence of events that will take you to where you want to be? Have a think consciously of what you need to do. Every outcome begins with the first step. When you decide you want to have a romantic meal for two, there are many steps that you need.Success isn’t really that difficult.There is a significant portion of the population here in North America, that actually want and need success to be hard! Why? So they then have a built-in excuse when things don’t go their way! Pretty sad situation, to say the least.Have some fun and hypnotize yourself to be your very own “Ghost of Christmas future” and see what the future holds for you.', N'0', N'0000000000', N'AvatarDefault.jpg', 1, 1, 0, N'agent', N'null', N'null', N'null', N'null', N'null')
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/20/2021 4:05:22 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [realtors01] SET  READ_WRITE 
GO
