USE [realtors01]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Agent]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Are]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[ImageLib]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Package]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[PackagePurchased]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[project]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 4/10/2021 10:43:51 AM ******/
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
/****** Object:  Table [dbo].[Seller]    Script Date: 4/10/2021 10:43:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActiveAgent] [int] NOT NULL,
	[AgentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/10/2021 10:43:51 AM ******/
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
	[LocationID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
	[AreID] [int] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Active] [int] NOT NULL,
	[PackageID] [int] NOT NULL,
	[ppID] [int] NOT NULL,
	[User_type] [nvarchar](max) NULL,
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
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3cb3f590-802e-425a-a567-d9da4ff4a4d2', N'nero@gmail.com', N'NERO@GMAIL.COM', N'nero@gmail.com', N'NERO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEISGfreD2iOxcsNeUo9vBeVCsql9/Mt1bTqpbBOrsUo/+g5Sj20GI5Jg4YZ2XJHVDg==', N'7BHCLYYYKFP6ELVZKZK52KWXHNR2GU25', N'072bee8f-4497-44af-ade9-0988256cf0cf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4a2f5175-4cd4-4366-b988-5e9fa41aadbc', N'neo9921@gmail.com', N'NEO9921@GMAIL.COM', N'neo9921@gmail.com', N'NEO9921@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKs0jsuntsMiUPU5wG9LiPqFQ3ARSoX5LdSUCYg5v9LKvnvvZLioLwQl7xE0IR3wHQ==', N'LFOW5UE6YIVJKRVYUHZYT3ZYJGKG6M2B', N'4fa181a3-e15a-4e72-aab8-e34ec13750db', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4a8de314-7678-4c3b-b3f3-1127cac49db7', N'tungneo92001@gmail.com', N'TUNGNEO92001@GMAIL.COM', N'tungneo92001@gmail.com', N'TUNGNEO92001@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENrkueuz3n9EmEmyU4ZlO7RoAd7IBm+39QJ/jSAPFrhJBePxp2cfoBl4jOzmEcOgDw==', N'SWM5MIYCC2HEODKE75YOHDO2H65TZ3JV', N'8db982e7-33c9-4bb9-b50d-3d4afb98ce29', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7be800f2-d5d3-4f1a-9d90-2bab35a87451', N'neo@gmail.com', N'NEO@GMAIL.COM', N'neo@gmail.com', N'NEO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOKpnvBZXW26APij/X0VjW+BcrO8/qMw6+MwizSmId7RRfVbWCTF8Al1JaQqzPLWSA==', N'T2L33Q3BJEUV2E2VYUWVH7OOSZDROPMX', N'5b75cbb8-7c16-4529-b276-cda93bb0a3b9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'80d9ad3a-3493-4c83-9179-c56043f56d45', N'neo9911@gmail.com', N'NEO9911@GMAIL.COM', N'neo9911@gmail.com', N'NEO9911@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL8Cx6fCwxjKmzrXc70q0Qvo6GVi9vhzvhReP4P9vHjchEUfra2hKiciZqNKiU2aLQ==', N'FP2VBE2AXPBUBEZUD52MIBZ3C4FJB6NC', N'a10dbc65-4d23-4ba7-bf62-5d06551098db', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e3671476-9e7a-4be6-915b-4d6c6cc9fbcb', N'tungneo092001@gmail.com', N'TUNGNEO092001@GMAIL.COM', N'tungneo092001@gmail.com', N'TUNGNEO092001@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMwXX52rsqe+8Gu/kaEa7scPKhdhkb36uD6pTtDOHb0c1HHYunSDDP/7OZvvKXRlmw==', N'Y23MRHEQ7W363HJ4OZ2CMEDHLQJPCSAT', N'ec11b155-9d4e-40d3-ba1c-0c7b294e3d33', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f20d4de2-fcb7-45f3-8a9b-9074b95fe413', N'tungneo09092001@gmail.com', N'TUNGNEO09092001@GMAIL.COM', N'tungneo09092001@gmail.com', N'TUNGNEO09092001@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ4Qas6HfA7nHq0oV0ScAK4IKv7FaP1213Q7W2v5IFq9Z0jhfNuGuSg5HOOpZDiwSA==', N'LZ5AKMXNCIL7Y6VQIUBHW2ZS4YTE2RLW', N'58ca50fe-ebd1-45ba-b961-fc3112352e59', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (1, N'Residential', N'Residential', N'1618021407879flaticon-building.jpg', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (2, N'Commercial', N'Commercial', N'1618021735168Commercial.jpg', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (3, N'Industrial', N'Industrial', N'1618021891744Industrial.jpg', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (4, N'Apartment', N'Apartment', N'1618021939287Apartment.jfif', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (5, N'Land', N'Land', N'1618021981901Land.jfif', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryTitle], [Avatar], [Active]) VALUES (7, N'Communal land', N'Communal land', N'1618024471162Communal land.jpg', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1, N'Santa Catarina', N'S', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (2, N'Augusta', N'A', N'1617977351472AvatarDefault.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (3, N'Savannah', N'S', N'1617977351472AvatarDefault.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (4, N'Columbus', N'C', N'1617977351472AvatarDefault.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (5, N'Macon', N'M', N'1617977351472AvatarDefault.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (6, N'Athens', N'A', N'1617977351472AvatarDefault.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (7, N'Albany', N'A', N'1617977351472AvatarDefault.jpg', 1, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (8, N'Tehran', N'T', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (9, N'Mashhad', N'M', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (10, N'Isfahan', N'I', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (11, N'Karaj', N'K', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (12, N'Shiraz', N'S', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (13, N'Tabriz', N'T', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (14, N'Qom', N'Q', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (15, N'Ahwaz', N'A', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (16, N'Kermanshah', N'K', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (17, N'Urmia', N'U', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (18, N'Rasht', N'R', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (19, N'Zahedan', N'Z', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (20, N'Hamadan', N'H', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (21, N'Kerman', N'K', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (22, N'Yazd', N'Y', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (23, N'Ardabil', N'A', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (24, N'Bandar Abbas', N'B', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (25, N'Arak', N'A', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (26, N'Eslamshahr', N'E', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (27, N'Zanjan', N'Z', N'1617977351472AvatarDefault.jpg', 2, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (28, N'Al Anbar', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (29, N'Al Basrah', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (30, N'Al Karbala', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (31, N'Al Muthanna', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (32, N'Al Qadisyah', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (33, N'An Najaf', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (34, N'Arbil', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (35, N'As Sulaymaniyah', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (36, N'At Ta''mim', N'A', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (37, N'Babil', N'B', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (38, N'Baghdad', N'B', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (39, N'Dahuk', N'D', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (40, N'Dhi Qar', N'D', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (41, N'Diyala', N'D', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (42, N'Maysan', N'M', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (43, N'Ninawa', N'N', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (44, N'Salah ad Din', N'S', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (45, N'Wasit', N'W', N'1617977351472AvatarDefault.jpg', 3, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (46, N'Acre', N'A', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (47, N'Afula', N'A', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (48, N'Arad', N'A', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (49, N'Ariel', N'A', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (50, N'Ashdod', N'A', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (51, N'Ashkelon', N'A', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (52, N'Baqa-Jatt', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (53, N'Bat Yam', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (54, N'Beersheba', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (55, N'Beit She''an', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (56, N'Beit Shemesh', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (57, N'Beitar Illit', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (58, N'Bnei Brak', N'B', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (59, N'Dimona', N'D', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (60, N'Eilat', N'E', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (61, N'El''ad', N'E', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (62, N'Giv''atayim', N'G', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (63, N'Giv''at Shmuel', N'G', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (64, N'Hadera', N'H', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (65, N'Haifa', N'H', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (66, N'Herzliya', N'H', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (67, N'Hod HaSharon', N'H', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (68, N'Holon', N'H', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (69, N'Jerusalem', N'J', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (70, N'Karmiel', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (71, N'Kafr Qasim', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (72, N'Kfar Saba', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (73, N'Kiryat Ata', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (74, N'Kiryat Bialik', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (75, N'Kiryat Gat', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (76, N'Kiryat Malakhi', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (77, N'Kiryat Motzkin', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (78, N'Kiryat Ono', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (79, N'Kiryat Shmona', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (80, N'Kiryat Yam', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (81, N'Lod', N'K', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (82, N'Ma''ale Adumim', N'L', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (83, N'Ma''alot-Tarshiha', N'M', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (84, N'Migdal HaEmek', N'M', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (85, N'Modi''in Illit', N'M', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (86, N'Modi''in-Maccabim-Re''ut', N'M', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (87, N'Nahariya', N'M', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (88, N'Nazareth', N'N', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (89, N'Nazareth Illit', N'N', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (90, N'Nesher', N'N', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (91, N'Ness Ziona', N'N', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (92, N'Netanya', N'N', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (93, N'Netivot', N'N', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (94, N'Ofakim', N'O', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (95, N'Or Akiva', N'O', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (96, N'Or Yehuda', N'O', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (97, N'Chiclayo', N'	', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (98, N'Qalansawe', N'Q', N'1617977351472AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (99, N'Ra''anana', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (100, N'Rahat', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (101, N'Ramat Gan', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (102, N'Ramat HaSharon', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (103, N'Ramla', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (104, N'Rehovot', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (105, N'Rishon LeZion', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (106, N'Rosh HaAyin', N'R', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (107, N'Safed', N'S', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (108, N'Sakhnin', N'S', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (109, N'Ayacucho', N'	', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (110, N'Shefa-''Amr', N'S', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (111, N'Tamra', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (112, N'Tayibe', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (113, N'Tel Aviv', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (114, N'Tiberias', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (115, N'Tira', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (116, N'Tirat Carmel', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (117, N'Umm al-Fahm', N'T', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (118, N'Yavne', N'U', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (119, N'Yehud-Monosson', N'Y', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (120, N'Yokneam', N'Y', N'1617978725530AvatarDefault.jpg', 4, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (121, N'Irbid', N'I', N'1617978725530AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (122, N'Ajloun', N'I', N'1617978725530AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (123, N'Jarash', N'J', N'AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (124, N'Mafraq', N'M', N'1617978725530AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (125, N'Balqa', N'B', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (126, N'Amman', N'B', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (127, N'Zarqa', N'A', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (128, N'Madaba', N'Z', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (129, N'Karak', N'M', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (130, N'Tafilah', N'K', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (131, N'Ma''an', N'T', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (132, N'Aqaba', N'M', N'1617979111582AvatarDefault.jpg', 5, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (133, N'Al Asimah', N'A', N'1617979111582AvatarDefault.jpg', 6, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (134, N'Hawalli', N'H', N'1617979111582AvatarDefault.jpg', 6, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (135, N'Farwaniya', N'H', N'1617979111582AvatarDefault.jpg', 6, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (136, N'Mubarak Al-Kabeer', N'F', N'1617979111582AvatarDefault.jpg', 6, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (137, N'Ahmadi', N'M', N'1617979111582AvatarDefault.jpg', 6, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (138, N'Jahra', N'A', N'1617979111582AvatarDefault.jpg', 6, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (139, N'Beirut', N'B', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (140, N'Baalbek ', N'B', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (141, N'Byblos', N'B', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (142, N'Jezzine', N'B', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (143, N'Jounieh', N'J', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (144, N'Sidon', N'J', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (145, N'Tripoli', N'S', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (146, N'Tyre', N'T', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (147, N'Zahle', N'T', N'1617979111582AvatarDefault.jpg', 7, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (148, N'Al-Hasakah', N'A', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (149, N'Deir ez-Zor', N'A', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (150, N'Al-Raqqah', N'D', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (151, N'Aleppo', N'A', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (152, N'Hama', N'A', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (153, N'Homs', N'H', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (154, N'Idlib', N'H', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (155, N'Latakia', N'I', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (156, N'Tartus', N'L', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (157, N'Damasus', N'T', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (158, N'Quneutra', N'D', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (159, N'Daraa', N'Q', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (160, N'Al-Suwayda', N'D', N'1617979111582AvatarDefault.jpg', 8, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (161, N'İstanbul', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (162, N'Ankara', N'İ', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (163, N'İzmir', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (164, N'Bursa', N'İ', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (165, N'Antalya', N'B', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (166, N'Adana', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (167, N'Konya', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (168, N'Gaziantep', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (169, N'Şanlıurfa', N'G', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (170, N'Mersin', N'Ş', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (171, N'Kocaeli', N'M', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (172, N'Diyarbakır', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (173, N'Hatay', N'D', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (174, N'Manisa', N'H', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (175, N'Kayseri', N'M', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (176, N'Samsun', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (177, N'Balıkesir', N'S', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (178, N'Kahramanmaraş', N'B', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (179, N'Van', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (180, N'Aydın', N'V', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (181, N'Denizli', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (182, N'Sakarya', N'D', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (183, N'Tekirdağ', N'S', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (184, N'Muğla', N'T', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (185, N'Eskişehir', N'M', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (186, N'Mardin', N'E', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (187, N'Malatya', N'M', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (188, N'Trabzon', N'M', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (189, N'Erzurum', N'T', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (190, N'Ordu', N'E', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (191, N'Batman', N'O', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (192, N'Elazığ', N'B', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (193, N'Sivas', N'E', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (194, N'Çorum', N'S', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (195, N'Kütahya', N'Ç', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (196, N'Adıyaman', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (197, N'Osmaniye', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (198, N'Isparta', N'O', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (199, N'Kırıkkale', N'I', N'1617979111582AvatarDefault.jpg', 9, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (200, N'Uşak', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (201, N'Afyonkarahisar', N'U', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (202, N'Aksaray', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (203, N'Edirne', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (204, N'Karaman', N'E', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (205, N'Düzce', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (206, N'Siirt', N'D', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (207, N'Tokat', N'S', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (208, N'Bolu', N'T', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (209, N'Niğde', N'B', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (210, N'Kırşehir', N'N', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (211, N'Çanakkale', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (212, N'Karabük', N'Ç', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (213, N'Zonguldak', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (214, N'Ağrı', N'Z', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (215, N'Cizre', N'A', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (216, N'Lüleburgaz', N'C', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (217, N'Rize', N'L', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (218, N'Yalova', N'R', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (219, N'Karadeniz Ereğli', N'Y', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (220, N'Giresun', N'K', N'1617979111582AvatarDefault.jpg', 9, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (221, N'''Adan', N'''', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (222, N'''Amran', N'''', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (223, N'Abyan', N'''', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (224, N'Ad Dali', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (225, N'Al Bayda''', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (226, N'Al Hudaydah', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (227, N'Al Jawf', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (228, N'Al Mahrah', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (229, N'Al Mahwit', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (230, N'Amanat Al Asimah', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (231, N'Dhamar', N'A', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (232, N'Hadramaut', N'D', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (233, N'Hajjah', N'H', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (234, N'Ibb', N'H', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (235, N'Lahij', N'I', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (236, N'Ma''rib', N'L', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (237, N'Raymah', N'M', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (238, N'Sa''dah', N'R', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (239, N'Sana''a', N'S', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (240, N'Shabwah', N'S', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (241, N'Ta''izz', N'S', N'1617979111582AvatarDefault.jpg', 10, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (242, N'Andhra Pradesh', N'T', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (243, N'Arunachal Pradesh', N'A', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (244, N'Assam', N'A', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (245, N'Bihar', N'A', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (246, N'Chhattisgarh', N'B', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (247, N'Goa', N'C', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (248, N'Gujarat', N'G', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (249, N'Haryana', N'G', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (250, N'Himachal Pradesh', N'H', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (251, N'Jharkhand', N'H', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (252, N'Karnataka', N'J', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (253, N'Kerala', N'K', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (254, N'Madhya Pradesh', N'K', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (255, N'Maharashtra', N'M', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (256, N'Manipur', N'M', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (257, N'Meghalaya', N'M', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (258, N'Mizoram', N'M', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (259, N'Nagaland', N'M', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (260, N'Odisha', N'N', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (261, N'Punjab', N'O', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (262, N'Rajasthan', N'P', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (263, N'Sikkim', N'R', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (264, N'Tamil Nadu', N'S', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (265, N'Telangana', N'T', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (266, N'Tripura', N'T', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (267, N'Uttar Pradesh', N'T', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (268, N'Uttarakhand', N'U', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (269, N'West Bengal', N'U', N'1617979111582AvatarDefault.jpg', 11, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (270, N'Taldy-Korgan', N'W', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (271, N'Aqmola', N'T', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (272, N'Aqtobe', N'A', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (273, N'Atyrau', N'A', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (274, N'Batys Qazaqstan (Oral)', N'A', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (275, N'Mangghystau', N'B', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (276, N'Ongtustik Qazaqstan (Shymkent)', N'M', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (277, N'Pavlodar', N'O', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (278, N'Qaraghandy', N'P', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (279, N'Qostanay', N'Q', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (280, N'Qyzylorda', N'Q', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (281, N'Shyghys Qazaqstan (Oskemen)', N'Q', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (282, N'Soltustik Qazaqstan (Petropavl)', N'S', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (283, N'Zhambyl (Taraz)', N'S', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (284, N'Nursultan', N'Z', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (285, N'Almaty', N'N', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (286, N'Bayquogyr', N'A', N'1617979111582AvatarDefault.jpg', 12, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (287, N'Balochistan', N'B', N'1617981708389AvatarDefault.jpg', 14, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (288, N'Balochistan', N'B', N'1617981708389AvatarDefault.jpg', 14, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (289, N'Sindh', N'B', N'1617981708389AvatarDefault.jpg', 14, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (290, N'Khyber Pakhtunkhwa', N'S', N'1617981708389AvatarDefault.jpg', 14, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (291, N'Kandy', N'K', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (292, N'Anuradhapura', N'K', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (293, N'Jaffna', N'A', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (294, N'Trincomalee', N'J', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (295, N'Kurunegala', N'T', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (296, N'Galle', N'K', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (297, N'Badulla', N'G', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (298, N'Ratnapura', N'B', N'1617981781914AvatarDefault.jpg', 15, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (299, N'Colombo', N'R', N'1617981781914AvatarDefault.jpg', 15, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (300, N'Anhui', N'C', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (301, N'Fujian', N'A', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (302, N'Gansu', N'F', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (303, N'Guangdong', N'G', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (304, N'Guizhou', N'G', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (305, N'Hainan', N'G', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (306, N'Hebei', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (307, N'Heilongjiang', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (308, N'Henan', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (309, N'Hubei', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (310, N'Hunan', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (311, N'Jiangsu', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (312, N'Jiangxi', N'J', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (313, N'Jilin', N'J', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (314, N'Liaoning', N'J', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (315, N'Qinghai', N'L', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (316, N'Shaanxi', N'Q', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (317, N'Shandong', N'S', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (318, N'Shanxi', N'S', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (319, N'Sichuan', N'S', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (320, N'Yunnan', N'S', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (321, N'Zhejiang', N'Y', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (322, N'Taiwan', N'Z', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (323, N'Guangxi', N'T', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (324, N'Inner Mongolia', N'G', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (325, N'Ningxia', N'I', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (326, N'Xinjiang', N'N', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (327, N'Tibet', N'X', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (328, N'Beijing', N'T', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (329, N'Chongqing', N'B', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (330, N'Shanghai', N'C', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (331, N'Tianjin', N'S', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (332, N'Hong Kong', N'T', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (333, N'Macau', N'H', N'1617981781914AvatarDefault.jpg', 16, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (334, N'Hokkaido', N'M', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (335, N' Aomori', N'H', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (336, N'Iwate', N'I', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (337, N'Miyagi', N'I', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (338, N'Akita', N'M', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (339, N'Yamagata', N'A', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (340, N'Fukushima', N'Y', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (341, N'Ibaraki', N'F', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (342, N'Tochigi', N'I', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (343, N'Gunma', N'T', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (344, N'Saitama', N'G', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (345, N'Chiba', N'S', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (346, N'Tokyo', N'C', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (347, N'Kanagawa', N'T', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (348, N'Niigata', N'K', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (349, N'Toyama', N'N', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (350, N'Ishikawa', N'T', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (351, N'Fukui', N'I', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (352, N'Yamanashi', N'F', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (353, N'Nagano', N'Y', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (354, N'Gifu', N'N', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (355, N'Shizuoka', N'G', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (356, N'Aichi', N'S', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (357, N'Mie', N'A', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (358, N'Shiga', N'M', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (359, N'Kyoto', N'S', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (360, N'Osaka', N'K', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (361, N'Hyōgo', N'O', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (362, N'Nara', N'H', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (363, N'Wakayama', N'N', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (364, N'Tottori', N'W', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (365, N'Shimane', N'T', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (366, N'Okayama', N'S', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (367, N'Hiroshima', N'O', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (368, N'Yamaguchi', N'H', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (369, N'Tokushima', N'Y', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (370, N'Kagawa', N'T', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (371, N'Ehime', N'K', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (372, N'Kōchi', N'E', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (373, N'Fukuoka', N'K', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (374, N'Saga', N'F', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (375, N'Nagasaki', N'S', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (376, N'Kumamoto', N'N', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (377, N'Ōita', N'K', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (378, N'ŌitaMiyazaki', N'Ō', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (379, N'Kagoshima', N'Ō', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (380, N'Okinawa', N'O', N'1617981781914AvatarDefault.jpg', 17, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (381, N'Arkhangai', N'O', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (382, N'Bayan-Ölgii', N'A', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (383, N'Bayankhongor', N'B', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (384, N'Bulgan', N'B', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (385, N'Darkhan-Uul', N'B', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (386, N'Dornod', N'D', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (387, N'Dornogovi', N'D', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (388, N'Dundgovi', N'D', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (389, N'Govi-Altai', N'D', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (390, N'Govisümber', N'G', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (391, N'Khentii', N'G', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (392, N'Khovd', N'K', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (393, N'Khövsgöl', N'K', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (394, N'Ömnögovi', N'K', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (395, N'Orkhon', N'Ö', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (396, N'Övörkhangai', N'O', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (397, N'Selenge', N'S', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (398, N'Sükhbaatar', N'S', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (399, N'Töv', N'T', N'1617981781914AvatarDefault.jpg', 18, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (400, N'Uvs', N'U', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (401, N'Zavkhan', N'Z', N'1617981781914AvatarDefault.jpg', 18, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (402, N'North Gyeongsang', N'N', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (403, N'Gyeonggi', N'G', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (404, N'South Chungcheong', N'S', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (405, N'South Gyeongsang', N'S', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (406, N'Jeolla', N'S', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (407, N'Jeju', N'J', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (408, N'Gangwon', N'J', N'1617984044123AvatarDefault.jpg', 19, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (409, N'Banteay Meanchey', N'G', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (410, N'Battambang', N'B', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (411, N'Kampong Cham', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (412, N'Kampong Chhnang', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (413, N'Kampong Speu', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (414, N'Kampong Thom', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (415, N'Kampot', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (416, N'Kandal', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (417, N'Kep', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (418, N'Koh Kong', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (419, N'Kratié', N'K', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (420, N'Mondulkiri', N'M', N'AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (421, N'Oddar Meanchey', N'	', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (422, N'Pailin', N'P', N'AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (423, N'Phnom Penh', N'	', N'1617984044123AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (424, N'Preah Sihanouk', N'P', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (425, N'Preah Vihear', N'P', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (426, N'Pursat', N'P', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (427, N'Prey Veng', N'P', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (428, N'Ratanakiri', N'P', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (429, N'Siem Reap', N'R', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (430, N'	Stung Treng', N'S', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (431, N'Svay Rieng', N'S', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (432, N'Takéo', N'T', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (433, N'Tboung Khmom', N'T', N'1617984328109AvatarDefault.jpg', 20, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (434, N'Jakarta', N'J', N'1617984413308AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (435, N'Surabaya', N'S', N'AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (436, N'Bekasi', N'B', N'1617984479666AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (437, N'Bandung', N'B', N'1617984479666AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (438, N'Medan', N'M', N'1617984479666AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (439, N'Depok', N'D', N'1617984479666AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (440, N'Tangerang', N'T', N'1617984479666AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (441, N'Palembang', N'P', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (442, N'Semarang', N'S', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (443, N'Makassar', N'S', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (444, N'South Tangerang', N'M', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (445, N'Batam', N'S', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (446, N'Bandar Lampung', N'B', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (447, N'Bogor', N'B', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (448, N'Pekanbaru', N'B', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (449, N'Padang', N'P', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (450, N'Malang', N'P', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (451, N'Samarinda', N'M', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (452, N'Denpasar', N'	', N'AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (453, N'Tasikmalaya', N'T', N'1617984534814AvatarDefault.jpg', 21, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (454, N'Attapeu', N'A', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (455, N'Bokeo', N'B', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (456, N'Bolikhamsai', N'B', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (457, N'Champasak', N'B', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (458, N'Houaphanh', N'C', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (459, N'Khammouane', N'H', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (460, N'Luang Namtha', N'K', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (461, N'Luang Prabang', N'L', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (462, N'Oudomxay', N'L', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (463, N'Phongsaly', N'O', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (464, N'Sainyabuli', N'P', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (465, N'Salavan', N'S', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (466, N'Savannakhet', N'S', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (467, N'Sekong', N'S', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (468, N'Vientiane Prefecture', N'S', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (469, N'Vientiane Province', N'V', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (470, N'Xiengkhouang', N'V', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (471, N'Xaisomboun', N'X', N'1617984652097AvatarDefault.jpg', 22, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (472, N'Kuala Lumpur', N'X', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (473, N'Seberang Perai', N'K', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (474, N'Kajang', N'S', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (475, N'Klang', N'K', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (476, N'Subang Jaya', N'K', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (477, N'George Town', N'S', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (478, N'Ipoh', N'G', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (479, N'Petaling Jaya', N'I', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (480, N'Kuching', N'P', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (481, N'Selayang', N'K', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (482, N'Shah Alam', N'S', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (483, N'Iskandar Puteri', N'S', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (484, N'Seremban', N'I', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (485, N'Johor Bahru', N'S', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (486, N'Malacca City', N'J', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (487, N'Ampang Jaya', N'M', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (488, N'Kota Kinabalu', N'A', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (489, N'Sungai Petani', N'K', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (490, N'Kuantan', N'S', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (491, N'Alor Setar', N'K', N'1617984652097AvatarDefault.jpg', 23, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (492, N'Quezon City', N'Q', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (493, N'Manila', N'M', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (494, N'Davao City', N'D', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (495, N'Caloocan', N'D', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (496, N'Cebu City', N'C', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (497, N'Zamboanga City', N'C', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (498, N'Taguig', N'Z', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (499, N'Antipolo', N'T', N'1617984652097AvatarDefault.jpg', 24, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (500, N'Pasig', N'A', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (501, N'Cagayan de Oro', N'P', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (502, N'Parañaque', N'C', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (503, N'Dasmariñas', N'	', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (504, N'Valenzuela', N'	', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (505, N'Bacoor', N'B', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (506, N'General Santos', N'B', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (507, N'Las Piñas', N'V', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (508, N'Makati', N'L', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (509, N'San Jose del Monte', N'M', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (510, N'Bacolod', N'S', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (511, N'Muntinlupa', N'B', N'1617984652097AvatarDefault.jpg', 24, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (512, N'Bedok', N'M', N'1617984652097AvatarDefault.jpg', 25, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (513, N'Jurong West', N'B', N'1617984652097AvatarDefault.jpg', 25, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (514, N'Tampines', N'J', N'1617984652097AvatarDefault.jpg', 25, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (515, N'Woodlands', N'T', N'1617984652097AvatarDefault.jpg', 25, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (516, N'Bangkok', N'B', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (517, N'Amnat Charoen', N'B', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (518, N'Ang Thong', N'A', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (519, N'Bueng Kan', N'	', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (520, N'Buriram', N'A', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (521, N'Chachoengsao', N'B', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (522, N'Chai Nat', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (523, N'Chaiyaphum', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (524, N'Chanthaburi', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (525, N'Chiang Mai', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (526, N'Chiang Rai', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (527, N'Chonburi', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (528, N'Chumphon', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (529, N'Kalasin', N'C', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (530, N'Kamphaeng Phet', N'K', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (531, N'Kanchanaburi	', N'K', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (532, N'Khon Kaen', N'K', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (533, N'Krabi', N'K', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (534, N'Lampang', N'K', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (535, N'Lamphun', N'L', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (536, N'Loei', N'L', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (537, N'Lopburi', N'L', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (538, N'Mae Hong Son', N'L', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (539, N'Maha Sarakham', N'M', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (540, N'Mukdahan', N'M', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (541, N'Nakhon Nayok', N'M', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (542, N'Nakhon Pathom', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (543, N'Nakhon Phanom', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (544, N'Nakhon Ratchasima', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (545, N'Nakhon Sawan', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (546, N'Nakhon Si Thammarat', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (547, N'Nan', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (548, N'Narathiwat', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (549, N'Nong Bua Lam Phu', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (550, N'Nong Khai', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (551, N'Nonthaburi', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (552, N'Pathum Thani', N'N', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (553, N'Pattani', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (554, N'Phang Nga', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (555, N'Phatthalung', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (556, N'Phayao', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (557, N'Phetchabun', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (558, N'Phetchaburi', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (559, N'Phichit', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (560, N'Phitsanulok', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (561, N'Phra Nakhon Si Ayutthaya', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (562, N'Phrae', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (563, N'Phuket', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (564, N'Prachinburi', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (565, N'Prachuap Khiri Khan', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (566, N'Ranong', N'P', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (567, N'Ratchaburi', N'R', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (568, N'Rayong', N'R', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (569, N'Roi Et', N'R', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (570, N'Sa Kaeo', N'R', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (571, N'Sakon Nakhon', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (572, N'Samut Prakan', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (573, N'Samut Sakhon', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (574, N'Samut Songkhram', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (575, N'Samut SongkhrSaraburiam', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (576, N'Satun', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (577, N'Sing Buri', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (578, N'Sisaket', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (579, N'Songkhla', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (580, N'Sukhothai ( Sukhothai Thani )', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (581, N'Suphan Buri', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (582, N'Surat Thani', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (583, N'Surin', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (584, N'Tak', N'S', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (585, N'Trang', N'T', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (586, N'Trat', N'T', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (587, N'Ubon Ratchathani', N'T', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (588, N'Udon Thani', N'U', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (589, N'Uthai Thani', N'U', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (590, N'Uttaradit', N'U', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (591, N'Yala', N'U', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (592, N'Yasothon', N'Y', N'1617984652097AvatarDefault.jpg', 26, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (593, N'Điện Biên', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (594, N'Hòa Bình', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (595, N'Lai Châu', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (596, N'Lào Cai', N'L', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (597, N'Sơn La', N'L', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (598, N'Yên Bái', N'S', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (599, N'Bắc Giang', N'Y', N'1617984652097AvatarDefault.jpg', 27, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (600, N'Bắc Kạn', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (601, N'Cao Bằng', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (602, N'Hà Giang', N'C', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (603, N'Lạng Sơn', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (604, N'Phú Thọ', N'L', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (605, N'Quảng Ninh', N'P', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (606, N'Thái Nguyên', N'Q', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (607, N'Tuyên Quang', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (608, N'Hà Nội', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (609, N'Hải Phòng', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (610, N'Bắc Ninh', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (611, N'Hà Nam', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (612, N'Hải Dương', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (613, N'Hưng Yên', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (614, N'Nam Định', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (615, N'Ninh Bình', N'N', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (616, N'Thái Bình', N'N', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (617, N'Vĩnh Phúc', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (618, N'Hà Tĩnh', N'V', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (619, N'Nghệ An', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (620, N'Quảng Bình', N'N', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (621, N'Quảng Trị', N'Q', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (622, N'Thanh Hóa', N'Q', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (623, N'Thừa Thiên – Huế', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (624, N'Đắk Lắk', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (625, N'Đắk Nông', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (626, N'Gia Lai', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (627, N'Kon Tum', N'K', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (628, N'Lâm Đồng', N'K', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (629, N'Đà Nẵng', N'L', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (630, N'Bình Định', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (631, N'Bình Thuận', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (632, N'Khánh Hòa', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (633, N'Ninh Thuận', N'K', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (634, N'Phú Yên', N'N', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (635, N'Quảng Nam', N'P', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (636, N'Quảng Ngãi', N'Q', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (637, N'Thành phố Hồ Chí Minh', N'Q', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (638, N'Bà Rịa – Vũng Tàu', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (639, N'Bình Dương', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (640, N'Bình Phước', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (641, N'Đồng Nai', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (642, N'Tây Ninh', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (643, N'Cần Thơ', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (644, N'An Giang', N'C', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (645, N'Bạc Liêu', N'A', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (646, N'Bến Tre', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (647, N'Cà Mau', N'B', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (648, N'Đồng Tháp', N'C', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (649, N'Hậu Giang', N'Đ', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (650, N'Kiên Giang', N'H', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (651, N'Long An', N'K', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (652, N'Sóc Trăng', N'L', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (653, N'Tiền Giang', N'S', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (654, N'Trà Vinh', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (655, N'Vĩnh Long', N'T', N'1617984652097AvatarDefault.jpg', 27, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (656, N'Hovedstaden', N'H', N'1617984652097AvatarDefault.jpg', 28, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (657, N'Midtjylland', N'H', N'1617984652097AvatarDefault.jpg', 28, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (658, N'Nordjylland', N'M', N'1617984652097AvatarDefault.jpg', 28, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (659, N'Sjælland', N'N', N'1617984652097AvatarDefault.jpg', 28, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (660, N'Syddanmark', N'S', N'1617984652097AvatarDefault.jpg', 28, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (661, N'Greenland and the Faroe Islands', N'S', N'1617984652097AvatarDefault.jpg', 28, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (662, N'North East', N'G', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (663, N'North West', N'N', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (664, N'Yorkshire and the Humber', N'N', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (665, N'West Midlands', N'Y', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (666, N'East Midlands', N'W', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (667, N'East of England', N'E', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (668, N'London', N'E', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (669, N'South East', N'L', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (670, N'South West', N'S', N'1617984652097AvatarDefault.jpg', 29, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (671, N'Lapland', N'S', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (672, N'North Ostrobothnia', N'L', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (673, N'Kainuu', N'N', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (674, N'North Karelia', N'K', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (675, N'North Savo', N'N', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (676, N'South Savo', N'N', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (677, N'South Ostrobothnia', N'S', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (678, N'Central Ostrobothnia', N'S', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (679, N'Ostrobothnia', N'C', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (680, N'Pirkanmaa', N'O', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (681, N'Central Finland', N'P', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (682, N'Satakunta', N'C', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (683, N'Southwest Finland', N'S', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (684, N'South Karelia', N'S', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (685, N'Päijät-Häme', N'S', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (686, N'Kanta-Häme', N'P', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (687, N'Uusimaa', N'K', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (688, N'Kymenlaakso', N'U', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (689, N'Åland', N'K', N'1617984652097AvatarDefault.jpg', 30, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (690, N'Oslo', N'Å', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (691, N'Rogaland', N'O', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (692, N'Møre og Romsdal', N'R', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (693, N'Nordland', N'M', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (694, N'Viken', N'N', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (695, N'Innlandet', N'V', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (696, N'Vestfold og Telemark', N'I', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (697, N'Agder', N'V', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (698, N'Vestland', N'A', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (699, N'Trøndelag', N'V', N'1617984652097AvatarDefault.jpg', 31, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (700, N'Troms og Finnmark', N'T', N'1617984652097AvatarDefault.jpg', 31, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (701, N'Glasgow', N'T', N'1617984652097AvatarDefault.jpg', 32, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (702, N'Edinburgh', N'G', N'1617984652097AvatarDefault.jpg', 32, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (703, N'Aberdeen', N'E', N'1617984652097AvatarDefault.jpg', 32, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (704, N'Dundee', N'A', N'1617984652097AvatarDefault.jpg', 32, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (705, N'Stockholm', N'D', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (706, N'Västerbotten', N'S', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (707, N'Norrbotten', N'V', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (708, N'Uppsala', N'N', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (709, N'Södermanland', N'U', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (710, N'Östergötland', N'S', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (711, N'Jönköping', N'Ö', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (712, N'Kronoberg', N'J', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (713, N'Kalmar', N'K', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (714, N'Gotland', N'K', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (715, N'Blekinge', N'G', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (716, N'Skåne', N'B', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (717, N'Halland', N'a', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (718, N'Västra Götaland', N'H', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (719, N'Värmland', N'V', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (720, N'Örebro', N'V', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (721, N'Västmanland', N'Ö', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (722, N'Dalarna', N'V', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (723, N'Gävleborg', N'D', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (724, N'Västernorrland', N'G', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (725, N'Jämtland', N'V', N'1617984652097AvatarDefault.jpg', 33, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (726, N'Burgenland', N'J', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (727, N'Carinthia', N'B', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (728, N'Lower Austria', N'C', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (729, N'Salzburg', N'L', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (730, N'Styria', N'S', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (731, N'Tyrol', N'S', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (732, N'Upper Austria', N'T', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (733, N'Vienna', N'U', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (734, N'Vorarlberg', N'V', N'1617984652097AvatarDefault.jpg', 34, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (735, N'Antwerpen', N'V', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (736, N'Oost-Vlaanderen	', N'A', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (737, N'Vlaams-Brabant	', N'O', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (738, N'Limburg', N'V', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (739, N'West-Vlaanderen	', N'L', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (740, N'Henegouwen', N'W', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (741, N'Luik', N'H', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (742, N'Luxemburg', N'L', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (743, N'Namen', N'L', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (744, N'Waals-Brabant	', N'N', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (745, N'Brussels Hoofdstedelijk Gewest', N'W', N'1617984652097AvatarDefault.jpg', 35, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (746, N'Auvergne-Rhône-Alpes', N'B', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (747, N'Bourgogne-Franche-Comté', N'A', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (748, N'Brittany', N'B', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (749, N'Centre-Val de Loire', N'C', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (750, N'Corsica', N'B', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (751, N'French Guiana', N'C', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (752, N'Alsace-Champagne-Ardenne-Lorraine', N'B', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (753, N'Guadeloupe', N'A', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (754, N'Nord-Pas-de-Calais-Picardie', N'G', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (755, N'Île-de-France', N'N', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (756, N'Martinique', N'Î', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (757, N'Mayotte', N'M', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (758, N'Normandy', N'M', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (759, N'Aquitaine-Limousin-Poitou-Charentes', N'N', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (760, N'Languedoc-Roussillon-Midi-Pyrénées', N'A', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (761, N'Pays de la Loire', N'L', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (762, N'Provence-Alpes-Côte d''Azur', N'P', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (763, N'Réunion', N'P', N'1617984652097AvatarDefault.jpg', 36, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (764, N'Baden-Württemberg', N'B', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (765, N'Bavaria', N'B', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (766, N'Berlin', N'B', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (767, N'Brandenburg', N'B', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (768, N'Bremen', N'B', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (769, N'Hamburg', N'B', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (770, N'Hesse', N'H', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (771, N'Mecklenburg-Vorpommern', N'H', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (772, N'Lower Saxony', N'M', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (773, N'North Rhine-Westphalia', N'L', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (774, N'Rhineland-Palatinate', N'N', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (775, N'Saarland', N'R', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (776, N'Saxony', N'S', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (777, N'Saxony-Anhalt', N'S', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (778, N'Schleswig-Holstein', N'S', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (779, N'Thuringia', N'S', N'1617984652097AvatarDefault.jpg', 37, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (780, N'Drenthe', N'T', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (781, N'Flevoland', N'D', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (782, N'Friesland', N'F', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (783, N'Gelderland', N'F', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (784, N'Groningen', N'G', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (785, N'Limburg', N'G', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (786, N'North Brabant', N'L', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (787, N'North Holland', N'N', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (788, N'Overijssel', N'N', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (789, N'South Holland', N'O', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (790, N'Utrecht', N'S', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (791, N'Zeeland', N'U', N'1617984652097AvatarDefault.jpg', 38, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (792, N'Aargau', N'A', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (793, N'Appenzell Ausserrhoden', N'*', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (794, N'Appenzell Innerrhoden', N'	', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (795, N'Basel-Landschaft', N'*', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (796, N'Basel-Stadt', N'B', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (797, N'Bern', N'B', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (798, N'Fribourg', N'B', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (799, N'Geneva', N'F', N'1617984652097AvatarDefault.jpg', 39, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (800, N'Glarus', N'G', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (801, N'Grisons', N'G', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (802, N'Jura', N'G', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (803, N'Lucerne', N'J', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (804, N'Neuchâtel', N'L', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (805, N'Nidwalden', N'N', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (806, N'Obwalden', N'N', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (807, N'Schaffhausen', N'O', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (808, N'	Schwyz', N'S', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (809, N'Solothurn', N'	', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (810, N'St. Gallen', N'S', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (811, N'Thurgau', N'S', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (812, N'Ticino', N'T', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (813, N'Uri', N'T', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (814, N'Valais', N'U', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (815, N'Vaud', N'V', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (816, N'Zug', N'V', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (817, N'Zürich', N'Z', N'1617984652097AvatarDefault.jpg', 39, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (818, N'Zagreb', N'Z', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (819, N'Krapina-Zagorje', N'Z', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (820, N'Sisak-Moslavina', N'K', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (821, N'Karlovac', N'S', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (822, N'Varaždin', N'K', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (823, N'Koprivnica-Križevci', N'V', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (824, N'Bjelovar-Bilogora', N'K', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (825, N'Primorje-Gorski Kotar ', N'B', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (826, N'Lika-Senj', N'P', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (827, N'Virovitica-Podravina', N'L', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (828, N'Požega-Slavonia', N'V', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (829, N'Brod-Posavina', N'P', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (830, N'Zadar', N'B', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (831, N'Osijek-Baranja', N'	', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (832, N'Šibenik-Knin', N'	', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (833, N'Vukovar-Srijem', N'Š', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (834, N'Split-Dalmatia', N'	', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (835, N'Istria', N'	', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (836, N'Dubrovnik-Neretva', N'S', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (837, N'Međimurje', N'D', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (838, N'Grad Zagreb', N'M', N'1617984652097AvatarDefault.jpg', 40, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (839, N'Thrace', N'G', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (840, N'Macedonia', N'T', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (841, N'Epirus', N'E', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (842, N'Thessaly', N'E', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (843, N'Sporades Island', N'T', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (844, N'North Aegean Island', N'S', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (845, N'Ionian Island', N'N', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (846, N'Central Greece', N'I', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (847, N'Attica', N'C', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (848, N'Peloponnese', N'A', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (849, N'Cyclades', N'P', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (850, N'Dodecanese', N'C', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (851, N'Crete', N'D', N'1617984652097AvatarDefault.jpg', 41, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (852, N'Abruzzo', N'C', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (853, N'Aosta Valley', N'A', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (854, N'Apulia', N'A', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (855, N'Basilicata', N'A', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (856, N'Calabria', N'B', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (857, N'Campania', N'C', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (858, N'Emilia-Romagna', N'C', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (859, N'Friuli-Venezia Giulia', N'E', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (860, N'Lazio', N'F', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (861, N'Liguria', N'L', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (862, N'Lombardy', N'L', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (863, N'Marche', N'L', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (864, N'Molise', N'M', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (865, N'Piedmont', N'M', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (866, N'Sardinia', N'P', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (867, N'Sicily	', N'S', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (868, N'Tuscany', N'S', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (869, N'Trentino-Alto Adige/Südtirol', N'T', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (870, N'Umbria', N'T', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (871, N'Veneto', N'U', N'1617984652097AvatarDefault.jpg', 42, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (872, N'Lisbon', N'V', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (873, N'Leiria', N'L', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (874, N'Santarém', N'L', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (875, N'Setúbal', N'S', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (876, N'Beja', N'S', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (877, N'Faro', N'B', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (878, N'Évora', N'F', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (879, N'Portalegre', N'É', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (880, N'Castelo Branco', N'P', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (881, N'Guarda', N'C', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (882, N'Coimbra', N'G', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (883, N'Aveiro', N'C', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (884, N'Viseu', N'A', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (885, N'Bragança', N'V', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (886, N'Vila Real', N'B', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (887, N'Porto', N'V', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (888, N'Braga', N'P', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (889, N'Viana do Castelo', N'B', N'1617984652097AvatarDefault.jpg', 43, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (890, N'Bor', N'V', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (891, N'Braničevo', N'B', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (892, N'Belgrade', N'B', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (893, N'Zaječar', N'B', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (894, N'West Bačka', N'Z', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (895, N'Zlatibor', N'W', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (896, N'Jablanica', N'Z', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (897, N'South Banat', N'J', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (898, N'South Bačka', N'S', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (899, N'Kolubara', N'S', N'1617984652097AvatarDefault.jpg', 44, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (900, N'Kosovo', N'K', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (901, N'Kosovska Mitrovica', N'K', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (902, N'Kosovo-Pomoravlje', N'K', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (903, N'Mačva', N'K', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (904, N'Moravica', N'M', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (905, N'Nišava', N'M', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (906, N'Peć', N'N', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (907, N'Pirot', N'P', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (908, N'Podunavlje', N'P', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (909, N'Pomoravlje', N'P', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (910, N'Prizren', N'P', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (911, N'Pčinja', N'P', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (912, N'Rasina', N'P', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (913, N'Raška', N'R', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (914, N'North Banat', N'R', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (915, N'North Bačka', N'N', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (916, N'Central Banat', N'N', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (917, N'Srem', N'C', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (918, N'Toplica', N'S', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (919, N'Šumadija', N'T', N'1617984652097AvatarDefault.jpg', 44, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (920, N'Tenerife', N'Š', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (921, N'Mallorca', N'T', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (922, N'Gran Canaria', N'M', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (923, N'Lanzarote', N'G', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (924, N'Ibiza (Eivissa)', N'L', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (925, N'Fuerteventura', N'I', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (926, N'Menorca', N'F', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (927, N'La Palma', N'M', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (928, N'La Gomera', N'L', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (929, N'Formentera', N'L', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (930, N'El Hierro', N'F', N'1617984652097AvatarDefault.jpg', 45, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (931, N'Minsk', N'E', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (932, N'Homyel', N'M', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (933, N'Mahilyow', N'H', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (934, N'Vitsyebsk', N'M', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (935, N'Hrodna', N'V', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (936, N'Brest', N'H', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (937, N'Babruysk', N'B', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (938, N'Baranavichy', N'B', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (939, N'Barysaw', N'B', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (940, N'Pinsk', N'B', N'1617984652097AvatarDefault.jpg', 46, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (941, N'Bács-Kiskun', N'P', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (942, N'Baranya', N'B', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (943, N'Békés', N'B', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (944, N'Borsod-Abaúj-Zemplén', N'B', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (945, N'Capital City of Budapest', N'B', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (946, N'Csongrád-Csanád', N'C', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (947, N'Fejér', N'C', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (948, N'Győr-Moson-Sopron', N'F', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (949, N'Hajdú-Bihar', N'G', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (950, N'Heves', N'H', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (951, N'Jász-Nagykun-Szolnok', N'H', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (952, N'Komárom-Esztergom', N'J', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (953, N'Nógrád', N'K', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (954, N'Pest', N'N', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (955, N'Somogy', N'P', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (956, N'Szabolcs-Szatmár-Bereg', N'S', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (957, N'Tolna', N'S', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (958, N'Vas', N'T', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (959, N'Veszprém', N'V', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (960, N'Zala', N'V', N'1617984652097AvatarDefault.jpg', 47, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (961, N'Moscow', N'Z', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (962, N'Saint Petersburg', N'M', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (963, N'Novosibirsk', N'S', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (964, N'Yekaterinburg', N'	', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (965, N'Nizhny Novgorod', N'	', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (966, N'Kazan', N'Y', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (967, N'Chelyabinsk', N'K', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (968, N'Omsk', N'C', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (969, N'Samara', N'O', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (970, N'Ufa', N'S', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (971, N'Rostov-na-Donu', N'U', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (972, N'Krasnoyarsk', N'R', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (973, N'Perm', N'K', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (974, N'Voronezh	', N'P', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (975, N'Volgograd', N'V', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (976, N'Krasnodar', N'V', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (977, N'Saratov', N'K', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (978, N'Tolyatti', N'S', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (979, N'Izhevsk', N'T', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (980, N'Ulyanovsk', N'I', N'1617984652097AvatarDefault.jpg', 48, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (981, N'Cherkasy', N'U', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (982, N'Chernihiv', N'C', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (983, N'Chernivtsi', N'C', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (984, N'Dnipropetrovsk', N'C', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (985, N'Donetsk', N'D', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (986, N'Ivano-Frankivsk', N'D', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (987, N'Kharkiv', N'I', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (988, N'Kherson', N'K', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (989, N'Khmelnytskyi', N'K', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (990, N'Kyiv', N'K', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (991, N'Kirovohrad', N'K', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (992, N'Luhansk', N'K', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (993, N'Lviv', N'L', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (994, N'Mykolaiv', N'L', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (995, N'Odessa', N'M', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (996, N'Poltava', N'O', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (997, N'Rivne', N'P', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (998, N'Sumy', N'R', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (999, N'Ternopil', N'S', N'1617984652097AvatarDefault.jpg', 49, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1000, N'Vinnytsia', N'T', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1001, N'Volyn', N'V', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1002, N'Zakarpattia', N'V', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1003, N'Zaporizhzhia', N'Z', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1004, N'Zhytomyr', N'Z', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1005, N'Autonomous Republic of Crimea', N'Z', N'1617984652097AvatarDefault.jpg', 49, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1006, N'Adrar', N'A', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1007, N'Chlef', N'A', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1008, N'Laghouat', N'C', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1009, N'Oum El Bouaghi', N'L', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1010, N'Batna', N'O', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1011, N'Béjaïa', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1012, N'Biskra', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1013, N'Béchar', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1014, N'Blida', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1015, N'Bouïra', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1016, N'Tamanrasset', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1017, N'Tébessa', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1018, N'Tlemcen', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1019, N'Tiaret', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1020, N'Tizi Ouzou', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1021, N'Algiers', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1022, N'Djelfa', N'A', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1023, N'Jijel', N'D', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1024, N'Sétif', N'J', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1025, N'Saïda', N'S', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1026, N'Skikda', N'S', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1027, N'Sidi Bel Abbès', N'S', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1028, N'Annaba', N'S', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1029, N'Guelma', N'A', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1030, N'Constantine', N'G', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1031, N'Médéa', N'C', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1032, N'Mostaganem', N'M', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1033, N'M''Sila', N'M', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1034, N'Mascara', N'M', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1035, N'Ouargla', N'M', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1036, N'Oran', N'O', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1037, N'El Bayadh', N'O', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1038, N'Illizi', N'E', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1039, N'Bordj Bou Arréridj', N'I', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1040, N'Boumerdes', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1041, N'El Taref', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1042, N'Tindouf', N'E', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1043, N'Tissemsilt', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1044, N'El Oued', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1045, N'Khenchela', N'E', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1046, N'Souk Ahras', N'K', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1047, N'Tipaza', N'S', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1048, N'Mila', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1049, N'Ain Defla', N'M', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1050, N'Naâma', N'A', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1051, N'Ain Timouchent', N'N', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1052, N'Ghardaia', N'A', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1053, N'Relizane', N'G', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1054, N'El M''Ghair', N'R', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1055, N'El Menia', N'E', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1056, N'Ouled Djellal', N'E', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1057, N'Bordj Baji Mokhtar', N'O', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1058, N'Béni Abbès', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1059, N'Timimoun', N'B', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1060, N'Touggourt', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1061, N'Djanet', N'T', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1062, N'n Salah', N'D', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1063, N'In Guezzam', N'n', N'1617984652097AvatarDefault.jpg', 50, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1064, N'Matrouh', N'I', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1065, N'Alexandria ', N'M', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1066, N'Beheira', N'A', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1067, N'Kafr El Sheikh', N'B', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1068, N'Dakahlia', N'K', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1069, N'Damietta ', N'D', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1070, N'Port Said', N'D', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1071, N'North Sinai', N'P', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1072, N'Gharbia', N'N', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1073, N'Monufia', N'G', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1074, N'Qalyubia', N'M', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1075, N'Sharqia', N'Q', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1076, N'Ismailia ', N'S', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1077, N'Giza', N'I', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1078, N'Faiyum', N'G', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1079, N'Cairo ', N'F', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1080, N'Suez', N'C', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1081, N'South Sinai', N'S', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1082, N'Beni Suef ', N'S', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1083, N'Minya', N'B', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1084, N'New Valley', N'M', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1085, N'Asyut', N'N', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1086, N'Red Sea', N'A', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1087, N'Sohag', N'R', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1088, N'Qena ', N'S', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1089, N'Luxor', N'Q', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1090, N'Aswan', N'L', N'1617984652097AvatarDefault.jpg', 51, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1091, N'Nuqat al Khams', N'A', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1092, N'Zawiya', N'N', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1093, N'Jafara', N'Z', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1094, N'Tripoli', N'J', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1095, N'Murqub', N'T', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1096, N'Misrata', N'M', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1097, N'Sirte', N'M', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1098, N'Benghazi', N'S', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1099, N'Marj', N'B', N'1617984652097AvatarDefault.jpg', 52, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1100, N'Jabal al Akhdar', N'M', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1101, N'Derna', N'J', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1102, N'Tobruk', N'D', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1103, N'Nalut', N'T', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1104, N'Jabal al Gharbi', N'N', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1105, N'Wadi al Shatii', N'J', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1106, N'Jufra', N'W', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1107, N'Al Wahat', N'J', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1108, N'Ghat', N'A', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1109, N'Wadi al Hayaa', N'G', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1110, N'Sabha', N'W', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1111, N'Murzuq', N'S', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1112, N'Kufra', N'M', N'1617984652097AvatarDefault.jpg', 52, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1113, N'Tanger-Tetouan-Al Hoceima', N'K', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1114, N'Oriental', N'T', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1115, N'Fès-Meknès', N'O', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1116, N'Rabat-Salé-Kénitra', N'F', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1117, N'Béni Mellal-Khénifra', N'R', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1118, N'Casablanca-Settat', N'B', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1119, N'Marrakech-Safi', N'C', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1120, N'Drâa-Tafilalet', N'M', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1121, N'Souss-Massa', N'D', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1122, N'Guelmim-Oued Noun', N'S', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1123, N'Laâyoune-Sakia El Hamra', N'G', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1124, N'Dakhla-Oued Ed-Dahab', N'L', N'1617984652097AvatarDefault.jpg', 53, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1125, N'Ariana', N'D', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1126, N'Béja', N'A', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1127, N'Sousse', N'B', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1128, N'Bizerte', N'S', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1129, N'Gabès', N'	', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1130, N'Nabeul', N'	', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1131, N'Jendouba', N'G', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1132, N'Kairouan', N'J', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1133, N'Zaghouan', N'K', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1134, N'Kebili', N'Z', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1135, N'Kef', N'	', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1136, N'Mahdia', N'K', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1137, N'Manouba', N'M', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1138, N'Medenine', N'M', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1139, N'Monastir', N'M', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1140, N'Gafsa', N'	', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1141, N'Sfax', N'	', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1142, N'Sidi Bouzid', N'G', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1143, N'Siliana', N'S', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1144, N'Ben Arous', N'S', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1145, N'Tataouine', N'B', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1146, N'Tozeur', N'T', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1147, N'Tunis', N'T', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1148, N'Kasserine', N'K', N'1617984652097AvatarDefault.jpg', 54, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1149, N'Addis Ababa', N'K', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1150, N'Afar', N'A', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1151, N'Amhara', N'A', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1152, N'Benishangul-Gumuz', N'A', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1153, N'Dire Dawa', N'B', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1154, N'Gambela', N'D', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1155, N'Harari', N'G', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1156, N'Oromia', N'H', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1157, N'Sidama', N'O', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1158, N'Somali', N'S', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1159, N'Southern Nations, Nationalities, and Peoples', N'S', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1160, N'Tigray', N'S', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1161, N'Special enumerated zones', N'T', N'1617984652097AvatarDefault.jpg', 55, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1162, N'Bari', N'S', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1163, N'Nugal', N'B', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1164, N'Mudug', N'N', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1165, N'Galguduud', N'M', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1166, N'Hiran', N'G', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1167, N'Middle Shabelle', N'H', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1168, N'Banaadir', N'M', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1169, N'Lower Shabelle', N'B', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1170, N'Bakool', N'L', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1171, N'Bay', N'B', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1172, N'Gedo', N'B', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1173, N'Middle Juba', N'G', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1174, N'Lower Juba', N'M', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1175, N'Awdal', N'L', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1176, N'Woqooyi Galbeed	', N'A', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1177, N'Togdheer', N'W', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1178, N'Sanaag	', N'T', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1179, N'Sool	', N'S', N'1617984652097AvatarDefault.jpg', 56, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1180, N'Dar es Salaam', N'S', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1181, N'Mwanza', N'	', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1182, N'Arusha', N'	', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1183, N'Dodoma', N'M', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1184, N'Mbeya', N'D', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1185, N'Morogoro', N'M', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1186, N'Tanga', N'M', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1187, N'Kahama', N'T', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1188, N'Tabora', N'K', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1189, N'Zanzibar City', N'T', N'1617984652097AvatarDefault.jpg', 58, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1190, N'Bengo', N'Z', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1191, N'Benguela', N'B', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1192, N'Bié', N'B', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1193, N'Cabinda', N'B', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1194, N'Cuando Cubango', N'C', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1195, N'Cuanza Norte', N'C', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1196, N'Cuanza Sul', N'C', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1197, N'Cunene', N'C', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1198, N'Huambo', N'C', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1199, N'Huíla', N'H', N'1617984652097AvatarDefault.jpg', 59, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1200, N'Luanda', N'H', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1201, N'Lunda Norte', N'L', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1202, N'Lunda Sul', N'L', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1203, N'Malanje', N'L', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1204, N'Moxico', N'M', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1205, N'Namibe', N'M', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1206, N'Uíge', N'N', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1207, N'Zaire', N'U', N'1617984652097AvatarDefault.jpg', 59, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1208, N'Diana', N'Z', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1209, N'Sava', N'D', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1210, N'Itasy', N'S', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1211, N'Analamanga', N'I', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1212, N'Vakinankaratra', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1213, N'Bongolava', N'V', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1214, N'Sofia', N'B', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1215, N'Boeny', N'S', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1216, N'Betsiboka', N'B', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1217, N'Melaky', N'B', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1218, N'Alaotra Mangoro', N'M', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1219, N'Atsinanana', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1220, N'Analanjirofo', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1221, N'Amoron''i Mania', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1222, N'Haute-Matsiatra', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1223, N'Vatovavy-Fitovinany', N'H', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1224, N'Atsimo-Atsinanana', N'V', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1225, N'Ihorombe', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1226, N'Menabe', N'I', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1227, N'Atsimo-Andrefana', N'M', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1228, N'Androy', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1229, N'Anosy', N'A', N'1617984652097AvatarDefault.jpg', 60, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1230, N'Kunene', N'A', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1231, N'Omusati', N'K', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1232, N'Oshana', N'O', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1233, N'Ohangwena', N'O', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1234, N'Oshikoto', N'O', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1235, N'Kavango East', N'O', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1236, N'Zambezi', N'K', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1237, N'Erongo', N'Z', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1238, N'Otjozondjupa', N'E', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1239, N'Omaheke', N'O', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1240, N'Khomas', N'O', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1241, N'Hardap', N'K', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1242, N'Karas', N'H', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1243, N'Kavango West', N'K', N'1617984652097AvatarDefault.jpg', 61, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1244, N'Central Province', N'C', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1245, N'Copperbelt', N'C', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1246, N'Eastern Province', N'C', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1247, N'Luapula', N'E', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1248, N'Lusaka', N'L', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1249, N'Muchinga', N'L', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1250, N'North-Western Province', N'M', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1251, N'Northern Province', N'N', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1252, N'Southern Province', N'N', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1253, N'Western Province', N'S', N'1617984652097AvatarDefault.jpg', 62, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1254, N'Jujuy', N'W', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1255, N'Salta', N'J', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1256, N'Tucumán', N'S', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1257, N'Catamarca', N'T', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1258, N'La Rioja', N'C', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1259, N'Formosa', N'L', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1260, N'Chaco', N'F', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1261, N'Santiago del Estero', N'C', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1262, N'Misiones', N'S', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1263, N'Corrientes', N'M', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1264, N'San Juan', N'C', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1265, N'Mendoza', N'S', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1266, N'San Luis', N'M', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1267, N'Santa Fe ', N'S', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1268, N'La Pampa ', N'S', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1269, N'Buenos Aires', N'L', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1270, N'Córdoba', N'B', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1271, N'Entre Ríos', N'C', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1272, N'Rio Negro', N'E', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1273, N'Neuquén', N'R', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1274, N'Chubut', N'N', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1275, N'Santa Cruz', N'C', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1276, N'Tierra del Fuego', N'S', N'1617984652097AvatarDefault.jpg', 63, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1277, N'Pando', N'	', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1278, N'La Paz', N'	', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1279, N'Beni', N'P', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1280, N'Oruro', N'B', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1281, N'Cochabamba', N'O', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1282, N'Santa Cruz', N'C', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1283, N'Potosí', N'S', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1284, N'Chuquisaca', N'P', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1285, N'Tarija', N'C', N'1617984652097AvatarDefault.jpg', 64, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1286, N'Roraima', N'T', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1287, N'Amapá', N'R', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1288, N'Amazonas', N'A', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1289, N'Acre', N'A', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1290, N'Rondônia', N'A', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1291, N'Pará', N'R', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1292, N'Tocantins', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1293, N'Mato Grosso', N'T', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1294, N'Federal District', N'M', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1295, N'Goiás', N'F', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1296, N'Mato Grossso do Sul', N'G', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1297, N'Maranhão', N'M', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1298, N'Ceará', N'M', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1299, N'Piauí', N'C', N'1617984652097AvatarDefault.jpg', 65, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1300, N'Bahia', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1301, N'Rio Grande do Norte', N'B', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1302, N'Paraíba', N'R', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1303, N'Pernambuco', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1304, N'Alagoas', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1305, N'Sergipe', N'A', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1306, N'Minas Gerais', N'S', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1307, N'São Paulo', N'M', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1308, N'Espírito Santo', N'S', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1309, N'Rio de Janeiro', N'E', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1310, N'Paraná', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1311, N'Santa Câtrina', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1312, N'Santa Câtrina', N'P', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1313, N'Rio Grande dp Sul', N'S', N'1617984652097AvatarDefault.jpg', 65, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1314, N'Arica y Parinacota', N'A', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1315, N'Tarapacá', N'A', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1316, N'Antofagasta', N'T', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1317, N'Atacama', N'A', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1318, N'Coquimbo', N'A', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1319, N'Valparaíso', N'C', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1320, N'Santiago Metropolitan', N'V', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1321, N'Libertador General Bernardo O''Higgins', N'S', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1322, N'Maule', N'L', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1323, N'Ñuble', N'M', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1324, N'Biobío', N'Ñ', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1325, N'Araucanía', N'B', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1326, N'Los Ríos', N'A', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1327, N'Los Lagos', N'L', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1328, N'Aysén del General Carlos Ibáñez del Campo', N'L', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1329, N'Magallanes and Chilean Antarctica', N'A', N'1617984652097AvatarDefault.jpg', 66, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1330, N'Amazonas', N'M', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1331, N'Antioquia', N'A', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1332, N'Arauca', N'A', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1333, N'Atlántico', N'A', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1334, N'Bolívar', N'A', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1335, N'Boyacá', N'B', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1336, N'Caldas', N'B', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1337, N'Caquetá', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1338, N'Casanare', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1339, N'Cauca', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1340, N'Cesar', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1341, N'Chocó', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1342, N'Córdoba', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1343, N'Cundinamarca', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1344, N'Guainía', N'C', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1345, N'Guaviare', N'G', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1346, N'Huila', N'G', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1347, N'La Guajira', N'H', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1348, N'Magdalena', N'L', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1349, N'Meta', N'M', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1350, N'Nariño', N'M', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1351, N'Norte de Santander', N'N', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1352, N'Putumayo', N'N', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1353, N'Quindío', N'P', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1354, N'Risaralda', N'Q', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1355, N'San Andrés, Providencia and Santa Catalina', N'R', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1356, N'Santander', N'S', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1357, N'Sucre', N'S', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1358, N'Tolima', N'S', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1359, N'Valle del Cauca', N'T', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1360, N'Vaupés', N'V', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1361, N'Vichada', N'V', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1362, N'Bogotá', N'V', N'1617984652097AvatarDefault.jpg', 67, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1363, N'Azuay', N'B', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1364, N'Bolívar', N'A', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1365, N'Cañar', N'B', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1366, N'Carchi', N'C', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1367, N'Chimborazo', N'C', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1368, N'Cotopaxi', N'C', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1369, N'El Oro', N'C', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1370, N'Esmeraldas', N'E', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1371, N'Galápagos', N'E', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1372, N'Guayas', N'G', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1373, N'Imbabura', N'G', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1374, N'Loja', N'I', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1375, N'Los Ríos', N'L', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1376, N'Manabí', N'L', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1377, N'Morona Santiago', N'M', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1378, N'Napo', N'M', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1379, N'Orellana', N'N', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1380, N'Pastaza', N'O', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1381, N'Pichincha', N'P', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1382, N'Santa Elena', N'P', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1383, N'Santo Domingo de los Tsáchilas', N'S', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1384, N'Sucumbíos', N'S', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1385, N'Tungurahua', N'S', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1386, N'Zamora Chinchipe', N'T', N'1617984652097AvatarDefault.jpg', 68, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1387, N'Distrito Capital', N'Z', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1388, N'Concepción', N'D', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1389, N'San Pedro', N'C', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1390, N'Cordillera', N'S', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1391, N'Guairá', N'C', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1392, N'Caaguazú', N'G', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1393, N'Caazapá', N'C', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1394, N'Itapúa', N'C', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1395, N'Misiones', N'I', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1396, N'Paraguarí', N'M', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1397, N'Alto Paraná', N'P', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1398, N'Central', N'A', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1399, N'Ñeembucú', N'C', N'1617984652097AvatarDefault.jpg', 69, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1400, N'Amambay', N'Ñ', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1401, N'Canindeyú', N'A', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1402, N'Presidente Hayes', N'C', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1403, N'Alto Paraguay', N'P', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1404, N'Boquerón', N'A', N'1617984652097AvatarDefault.jpg', 69, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1405, N'Lima', N'B', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1406, N'Arequipa', N'L', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1407, N'Trujillo', N'A', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1408, N'	Chiclayo', N'T', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1409, N'Huancayo', N'	', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1410, N'Iquitos', N'C', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1411, N'Piura', N'I', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1412, N'Cusco', N'P', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1413, N'Chimbote', N'C', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1414, N'Tacna', N'C', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1415, N'Juliaca', N'T', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1416, N'Ica', N'J', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1417, N'Cajamarca', N'I', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1418, N'Pucallpa', N'C', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1419, N'Sullana', N'P', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1420, N'	Ayacucho', N'S', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1421, N'Chincha', N'	', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1422, N'Alta', N'A', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1423, N'Huánuco', N'A', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1424, N'Tarapoto', N'H', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1425, N'Puno', N'T', N'1617984652097AvatarDefault.jpg', 70, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1426, N'Artigas', N'A', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1427, N'Canelones', N'A', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1428, N'Cerro Largo', N'C', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1429, N'Colonia', N'C', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1430, N'Durazno', N'C', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1431, N'Flores', N'D', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1432, N'Florida', N'F', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1433, N'Lavalleja', N'F', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1434, N'Maldonado', N'L', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1435, N'Montevideo', N'M', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1436, N'Paysandú', N'M', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1437, N'Río Negro', N'P', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1438, N'Rivera', N'R', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1439, N'Rocha', N'R', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1440, N'Salto', N'R', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1441, N'San José', N'S', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1442, N'Soriano', N'S', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1443, N'Tacuarembó', N'S', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1444, N'Treinta y Tré ', N'T', N'1617998908382AvatarDefault.jpg', 71, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1445, N'Amazonas', N'T', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1446, N'Anzoátegui', N'A', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1447, N'Apure', N'A', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1448, N'Aragua', N'A', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1449, N'Barinas', N'A', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1450, N'Bolívar', N'B', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1451, N'Carabobo', N'B', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1452, N'Cojedes', N'C', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1453, N'Delta Amacuro', N'C', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1454, N'Caracas', N'D', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1455, N'Falcón', N'C', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1456, N'Guárico', N'F', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1457, N'Lara', N'G', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1458, N'Mérida', N'L', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1459, N'Miranda', N'M', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1460, N'Monagas', N'M', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1461, N'Nueva Esparta', N'M', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1462, N'Portuguesa', N'N', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1463, N'Sucre', N'P', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1464, N'Táchira', N'S', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1465, N'Trujillo', N'T', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1466, N'Yaracuy', N'T', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1467, N'Zulia', N'Y', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1468, N'Vargas', N'Z', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1469, N'Federal Dependencies', N'V', N'1617998908382AvatarDefault.jpg', 72, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1470, N'Ontario', N'F', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1471, N'Quebec', N'O', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1472, N'Nova Scotia', N'Q', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1473, N'New Brunswick', N'N', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1474, N'Manitoba', N'N', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1475, N'British Columbia', N'M', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1476, N'Prince Edward Island', N'B', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1477, N'Saskatchewan', N'P', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1478, N'Alberta', N'S', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1479, N'Newfoundland and Labrador', N'A', N'1617998908382AvatarDefault.jpg', 73, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1480, N'Aguascalientes', N'N', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1481, N'Baja California', N'A', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1482, N' Baja California Sur', N'B', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1483, N'Campeche', N' ', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1484, N'Chiapas', N'C', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1485, N'Chihuahua', N'C', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1486, N'Coahuila', N'C', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1487, N'Colima', N'C', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1488, N'Durango', N'C', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1489, N'Guanajuato', N'D', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1490, N'Guerrero', N'G', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1491, N'Hidalgo', N'G', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1492, N'Jalisco', N'H', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1493, N'State of Mexico', N'J', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1494, N'Mexico City', N'S', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1495, N'Michoacán', N'M', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1496, N' Morelos', N'M', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1497, N'Nayarit', N' ', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1498, N'Nuevo León', N'N', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1499, N'Oaxaca', N'N', N'1617998908382AvatarDefault.jpg', 74, 1)
GO
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1500, N'Puebla', N'O', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1501, N'Querétaro', N'P', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1502, N'Quintana Roo', N'Q', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1503, N'San Luis Potosí', N'Q', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1504, N'Sinaloa', N'S', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1505, N'Sonora', N'S', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1506, N'Tabasco', N'S', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1507, N'Tamaulipas', N'T', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1508, N'Tlaxcala', N'T', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1509, N'Veracruz', N'T', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1510, N'Yucatán', N'Y', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1511, N'Zacatecas', N'Y', N'1617998908382AvatarDefault.jpg', 74, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1512, N'Alabama', N'Z', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1513, N'Alaska', N'A', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1514, N'Arizona', N'A', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1515, N'Arkansas', N'A', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1516, N'California', N'A', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1517, N'Colorado', N'C', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1518, N'Connecticut', N'C', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1519, N'Delaware', N'C', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1520, N'Florida', N'D', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1521, N'Georgia', N'F', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1522, N'Hawaii', N'G', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1523, N'Idaho', N'H', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1524, N'Illinois', N'I', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1525, N'Indiana', N'I', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1526, N'Iowa', N'I', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1527, N'Kansas', N'I', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1528, N'Kentucky', N'K', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1529, N'Louisiana', N'K', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1530, N'Maine', N'L', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1531, N'Maryland', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1532, N'Massachusetts', N'a', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1533, N'Michigan', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1534, N'Minnesota', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1535, N'Mississippi', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1536, N'Missouri', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1537, N'Montana', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1538, N'Nebraska', N'M', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1539, N'Nevada', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1540, N'New Hampshire', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1541, N'New Jersey', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1542, N'New Mexico', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1543, N'New York', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1544, N'North Carolina', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1545, N'North Dakota', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1546, N'Ohio', N'N', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1547, N'Oklahoma', N'O', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1548, N'Oregon', N'O', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1549, N'Pennsylvania', N'O', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1550, N'Rhode Island', N'P', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1551, N'South Carolina', N'R', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1552, N'South Dakota', N'S', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1553, N'Tennessee', N'S', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1554, N'Texas', N'T', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1555, N'Utah', N'T', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1556, N'Vermont', N'U', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1557, N'Virginia', N'V', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1558, N'Washington', N'V', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1559, N'West Virginia', N'W', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1560, N'Wisconsin', N'W', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1561, N'Wyoming', N'W', N'1617998908382AvatarDefault.jpg', 75, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1562, N'Pinar del Río', N'W', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1563, N'Artemisa', N'P', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1564, N'Havana', N'A', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1565, N'Mayabeque', N'H', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1566, N'Matanzas', N'M', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1567, N'Cienfuegos', N'M', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1568, N'Villa Clara', N'C', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1569, N'Sancti Spíritus', N'V', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1570, N'Ciego de Ávila', N'S', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1571, N'Camagüey', N'C', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1572, N'Las Tunas', N'C', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1573, N'Granma', N'L', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1574, N'Holguín', N'G', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1575, N'Santiago de Cuba', N'H', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1576, N'Guantánamo', N'S', N'1617998908382AvatarDefault.jpg', 76, 1)
INSERT [dbo].[City] ([CityID], [CityName], [CityLetter], [Avatar], [CountryID], [Active]) VALUES (1577, N'Isla de la Juventud', N'G', N'1617998908382AvatarDefault.jpg', 76, 1)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (1, N'Georgia', N'G', N'1618019782612map-georgia.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (2, N'Iran', N'I', N'1618019776825map-iran.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (3, N'Iraq', N'I', N'1618019768861map-iraq.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (4, N'Israel', N'I', N'1618019761700destination-map-israel.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (5, N'Jordan', N'J', N'1618019748305map-jordan.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (6, N'Kuwait', N'K', N'1618019739208map-kuwait.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (7, N'Lebanon', N'L', N'1618019727301map-lebanon.png', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (8, N'Syria', N'S', N'1618019717796Syria.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (9, N'Turkey', N'T', N'1618019711144Turkey.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (10, N'Yemen', N'Y', N'1618019703600Yemen.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (11, N'India', N'I', N'1618019695753India.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (12, N'Kazakhstan', N'K', N'1618019674347Kazakhstan.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (14, N'Pakistan', N'P', N'1618019660202Pakistan.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (15, N'Sri Lanka', N'S', N'1618019654817Sri Lanka.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (16, N'China', N'C', N'1618019638779China.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (17, N'Japan', N'J', N'1618019631812Japan.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (18, N'Mongolia', N'M', N'1618019619297Mongolia.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (19, N'Korea', N'K', N'1618019603901Korea.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (20, N'Cambodia', N'C', N'1618019598762Cambodia.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (21, N'Indonesia', N'I', N'1618019593455Indonesia.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (22, N'Laos', N'L', N'1618019587817Laos.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (23, N'Malaysia', N'M', N'1618019583476Malaysia.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (24, N'Philippines', N'P', N'1618019578961Philippines.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (25, N'Singapore', N'S', N'1618019573631Singapore.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (26, N'Thailand', N'T', N'1618019564421Thailand.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (27, N'Vietnam', N'V', N'1618019544589Vietnam.jfif', 1, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (28, N'Denmark', N'D', N'1618019534379Denmark.jfif', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (29, N'England', N'E', N'1618019528089England.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (30, N'Finland', N'F', N'1618019519298Finland.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (31, N'Norway', N'N', N'1618019511509Norway.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (32, N'Scotland', N'S', N'1618019497372England.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (33, N'Sweden', N'S', N'1618019461919Sweden.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (34, N'Austria', N'A', N'1618019455606Austria.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (35, N'Belgium', N'B', N'1618019450105Belgium.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (36, N'France', N'F', N'1618019443102France.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (37, N'Germany', N'G', N'1618019436798Germany.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (38, N'Netherlands', N'N', N'1618019431303Netherlands.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (39, N'Switzerland', N'S', N'1618019422677Switzerland.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (40, N'Croatia', N'C', N'1618019416021Croatia.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (41, N'Greece', N'G', N'1618019409295Greece.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (42, N'Italy', N'I', N'1618019398998map-italy.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (43, N'Portugal', N'P', N'1618019390721Portugal.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (44, N'Serbia', N'S', N'1618019384313Serbia.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (45, N'Spain', N'S', N'1618019377851Spain.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (46, N'Belarus', N'B', N'1618019370495Belarus.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (47, N'Hungary', N'H', N'1618019364931Hungary.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (48, N'Russia', N'R', N'1618019356283Russia.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (49, N'Ukraine', N'U', N'1618019347925Ukraine.png', 3, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (50, N'Algeria', N'A', N'1618019331310Algeria.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (51, N'Egypt', N'E', N'1618019325416Egypt.jfif', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (52, N'Libya', N'L', N'1618019320263Libya.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (53, N'Morocco', N'M', N'1618019315028Morocco.jfif', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (54, N'Tunisia', N'T', N'1618019307309Tunisia.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (55, N'Ethiopia', N'E', N'1618019300971Ethiopia.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (56, N'Somalia', N'S', N'1618019295621Somalia.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (58, N'Tanzania', N'T', N'1618019280088Tanzania.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (59, N'Angola', N'A', N'1618019273925Angola.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (60, N'Madagascar', N'M', N'1618019265270Madagascar.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (61, N'Namibia', N'N', N'1618019258524Namibia.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (62, N'Zambia', N'Z', N'1618019251399Zambia.png', 4, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (63, N'Argentina', N'A', N'1618019227230Argentina.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (64, N'Bolivia', N'B', N'1618019217124Bolivia.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (65, N'Brazil', N'B', N'1618019208172Brazil.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (66, N'Chile', N'C', N'1618019200535Chile.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (67, N'Colombia', N'C', N'1618019194154Colombia.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (68, N'Ecuador', N'E', N'1618019186816Ecuador.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (69, N'Paraguay', N'P', N'1618019180673Paraguay.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (70, N'Peru', N'P', N'1618019096633Peru.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (71, N'Uruguay', N'U', N'1618019076494Uruguay.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (72, N'Venezuela', N'V', N'1618019069696Venezuela.png', 5, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (73, N'Canada', N'C', N'1618019058908Canada.png', 6, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (74, N'Mexico', N'M', N'1618019053319Mexico.png', 6, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (75, N'United States', N'U', N'1618019047717United States.png', 6, 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryLetter], [Avatar], [LocationID], [Active]) VALUES (76, N'Cuba', N'C', N'1618019042406Cuba.png', 6, 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [LocationName], [LocationLetter], [Avatar], [Active]) VALUES (1, N'Asia', N'A', N'1617679498764asia.png', 1)
INSERT [dbo].[Location] ([LocationID], [LocationName], [LocationLetter], [Avatar], [Active]) VALUES (3, N'Europe', N'E', N'1617934651060Europe.png', 1)
INSERT [dbo].[Location] ([LocationID], [LocationName], [LocationLetter], [Avatar], [Active]) VALUES (4, N'Africa', N'A', N'1617679717112Africa.png', 1)
INSERT [dbo].[Location] ([LocationID], [LocationName], [LocationLetter], [Avatar], [Active]) VALUES (5, N'North America', N'N', N'1617680960430North America.png', 1)
INSERT [dbo].[Location] ([LocationID], [LocationName], [LocationLetter], [Avatar], [Active]) VALUES (6, N'South America', N'S', N'1617680996711South America.png', 1)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [LocationID], [CountryID], [CityID], [DistrictID], [AreID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type]) VALUES (1, N'string', N'neo@gmail.com', N'Thanhtung09!', N'string', N'HN', N'string', 0, 0, 0, 0, 0, N'0987654321', N'string', 1, 0, 0, N'admin')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [LocationID], [CountryID], [CityID], [DistrictID], [AreID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type]) VALUES (4, N'tung', N'tungneo92001@gmail.com', N'Thanhtug09!', NULL, NULL, NULL, 0, 0, 0, 0, 0, N'0000000000', N'https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/133549349_1281976232160042_6231890056107915313_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=174925&_nc_ohc=iz0UXfScNF4AX_WeTKA&_nc_ht=scontent.fhan2-1.fna&oh=baa30ca55c3ef86e510aca541ac9a2f2&oe=6077C815', 1, 0, 0, N'seller')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [LocationID], [CountryID], [CityID], [DistrictID], [AreID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type]) VALUES (5, N'string', N'neo9921@gmail.com', N'Thanhtung09!', N'string', N'string', N'string', 0, 0, 0, 0, 0, N'00987654321', N'string', 1, 0, 0, N'admin')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [LocationID], [CountryID], [CityID], [DistrictID], [AreID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type]) VALUES (6, N'tung', N'nero@gmail.com', N'Thanhtung09!', NULL, NULL, NULL, 0, 0, 0, 0, 0, N'0000000000', N'https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/133549349_1281976232160042_6231890056107915313_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=174925&_nc_ohc=iz0UXfScNF4AX_WeTKA&_nc_ht=scontent.fhan2-1.fna&oh=baa30ca55c3ef86e510aca541ac9a2f2&oe=6077C815', 1, 0, 0, N'agent')
INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [Title], [Description], [NetWorkID], [LocationID], [CountryID], [CityID], [DistrictID], [AreID], [Phone], [Avatar], [Active], [PackageID], [ppID], [User_type]) VALUES (7, N'tung', N'neo9911@gmail.com', N'Tung09!', NULL, NULL, NULL, 0, 0, 0, 0, 0, N'0000000000', N'AvatarDefault.jpg', 1, 0, 0, N'agent')
SET IDENTITY_INSERT [dbo].[User] OFF
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
