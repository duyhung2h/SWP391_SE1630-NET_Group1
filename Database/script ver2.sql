USE master;
GO
ALTER DATABASE GlassShop 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE GlassShop
CREATE DATABASE GlassShop;
--DROP DATABASE glassShop

GO
USE GlassShop
GO

/***********PASTE TU DAY****************************/

USE [master]
GO
/****** Object:  Database [GlassShop]    Script Date: 10/30/2022 11:58:28 PM ******/
CREATE DATABASE [GlassShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GlassShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KTEAM\MSSQL\DATA\GlassShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GlassShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KTEAM\MSSQL\DATA\GlassShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GlassShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlassShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlassShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GlassShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GlassShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GlassShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GlassShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [GlassShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GlassShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GlassShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GlassShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GlassShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GlassShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GlassShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GlassShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GlassShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GlassShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GlassShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GlassShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GlassShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GlassShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GlassShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GlassShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GlassShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GlassShop] SET RECOVERY FULL 
GO
ALTER DATABASE [GlassShop] SET  MULTI_USER 
GO
ALTER DATABASE [GlassShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GlassShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GlassShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GlassShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GlassShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GlassShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GlassShop', N'ON'
GO
ALTER DATABASE [GlassShop] SET QUERY_STORE = OFF
GO
USE [GlassShop]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[AttributeID] [int] NOT NULL,
	[AttributeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributeList]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeList](
	[AttributeListID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[AttributeID] [int] NOT NULL,
 CONSTRAINT [PK_AttributeList] PRIMARY KEY CLUSTERED 
(
	[AttributeListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](1000) NULL,
	[icon] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[Star] [int] NULL,
	[FeedbackDetail] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback_Replies]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback_Replies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackID] [int] NULL,
	[UserID] [int] NULL,
	[RepliesText] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[description] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[fax] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderID] [int] NULL,
	[content] [char](1000) NULL,
	[status] [char](30) NULL,
	[time] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TotalPrice] [float] NULL,
	[Note] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[DayBuy] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[OriginalPrice] [int] NULL,
	[SellPrice] [int] NULL,
	[SalePercent] [int] NULL,
	[imageLink] [nvarchar](1000) NULL,
	[CategoryID] [int] NULL,
	[SellerID] [int] NULL,
	[Amount] [int] NULL,
	[StatusID] [int] NULL,
	[ManufacturerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](1000) NULL,
	[ShipPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipInfo]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[CustomerName] [nvarchar](1000) NULL,
	[ShippingAddress] [nvarchar](1000) NULL,
	[ShipCityID] [int] NULL,
	[PhoneNum] [varchar](20) NULL,
	[Note] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ShipName] [nvarchar](500) NULL,
	[ShipAddress] [nvarchar](1000) NULL,
	[ShipCityID] [int] NULL,
	[PhoneNum] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NULL,
	[Password] [nvarchar](1000) NULL,
	[email] [nvarchar](1000) NULL,
	[ActiveCode] [nvarchar](11) NULL,
	[isSeller] [int] NULL,
	[isAdmin] [int] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 10/30/2022 11:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (1, N'Kính Cận', N'<i class="fas fa-1"></i>')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (2, N'Kính Râm Thời Trang', N'<i class="fas fa-2"></i>')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (3, N'Kính Áp Tròng', N'<i class="far fa-3-open"></i>')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (4, N'Kính Lão-Viễn', N'<i class="far fa-4"></i>')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (5, N'Gọng Kính', N'<i class="fas fa-5-alt"></i>')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (6, N'Mắt Kính', N'<i class="fas fa-6-alt"></i>')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [icon]) VALUES (7, N'Kính Bơi', N'<i class="fas fa-7"></i>')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'TitanClub 1')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'TitanClub 2')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (3, N'TitanClub 3')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (4, N'TitanClub 4')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (5, N'TitanClub 5')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (6, N'TitanClub 6')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (7, N'TitanClub 7')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (8, N'TitanClub 8')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (9, N'TitanClub 9')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (10, N'TitanClub 10')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (11, N'TitanClub 11')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (12, N'TitanClub 12')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (13, N'TitanClub 13')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (14, N'TitanClub 14')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (15, N'TitanClub 15')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (16, N'TitanClub 16')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (17, N'TitanClub 17')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (18, N'TitanClub 18')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (19, N'TitanClub 19')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (20, N'TitanClub 20')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (21, N'TitanClub 21')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (22, N'TitanClub 22')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (1, N'Waiting for Confirmation')
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (2, N'Packaging')
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (3, N'Delivering')
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (4, N'Canceled')
INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (5, N'Completed')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (1, 2, 7020000, NULL, 3, CAST(N'2022-09-26T13:49:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (2, 3, 7020000, NULL, 3, CAST(N'2022-09-23T21:23:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (3, 4, 7020000, NULL, 3, CAST(N'2022-09-06T04:17:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (4, 5, 7020000, NULL, 3, CAST(N'2022-09-16T12:36:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (5, 5, 7020000, NULL, 3, CAST(N'2022-09-12T10:18:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (12, 3, 6720000, NULL, 3, CAST(N'2022-09-14T12:36:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (14, 1, 7020000, NULL, 3, CAST(N'2022-09-26T13:49:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (15, 2, 7020000, NULL, 3, CAST(N'2022-09-23T21:23:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (22, 5, 1020000, NULL, 3, CAST(N'2022-09-22T10:18:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (23, 1, 2370000, N'hello', 3, CAST(N'2022-09-23T21:23:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (24, 2, 8390000, N'black', 3, CAST(N'2022-09-06T04:17:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (25, 3, 6720000, NULL, 3, CAST(N'2022-09-14T04:17:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (30, 3, 6720000, NULL, 3, CAST(N'2022-09-14T12:36:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (32, 1, 7020000, NULL, 3, CAST(N'2022-09-26T13:49:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (33, 2, 7020000, NULL, 3, CAST(N'2022-09-23T21:23:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (35, 2, 7020000, NULL, 3, CAST(N'2022-09-10T13:49:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (36, 3, 7020000, NULL, 3, CAST(N'2022-09-11T21:23:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (37, 4, 7020000, NULL, 3, CAST(N'2022-09-12T04:17:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (38, 5, 7020000, NULL, 3, CAST(N'2022-09-13T12:36:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (39, 5, 7020000, NULL, 3, CAST(N'2022-09-15T10:18:00.000' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [DayBuy]) VALUES (47, 1, 7020000, NULL, 3, CAST(N'2022-09-27T13:49:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (1, N'Kính râm Titan011', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 17189000, 2000000, 10, N'chup-hinh-mat-kinh.jpg', 1, 3, 100, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (2, N'Kính cận Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 17189000, 2000000, 10, N'chup-hinh-mat-kinh.jpg', 1, 3, 100, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (3, N'Kính cận Titan002', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 18989000, 23000000, 0, N'chup-hinh-mat-kinh2.jpg', 1, 3, 100, 1, 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (4, N'Kính cận Titan003', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 189999000, 215900000, 10, N'chup-hinh-mat-kinh3.jpg', 1, 3, 100, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (5, N'Kính râm Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 14099000, 18000000, 10, N'chup-hinh-mat-kinh4.jpg', 2, 3, 100, 1, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (6, N'Kính râm Titan002', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 19999000, 25000000, 0, N'chup-hinh-mat-kinh5.jpg', 2, 3, 100, 1, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (7, N'Kính râm Titan003', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 15999000, 209899000, 10, N'chup-hinh-mat-kinh6.jpg', 2, 3, 100, 1, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (8, N'Kính áp tròng Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh7.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (9, N'Kính áp tròng Titan002', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh8.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (10, N'Kính áp tròng Titan003', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh9.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (11, N'Kính lão Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh10.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (12, N'Kính viễn Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh11.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (13, N'Gọng kính Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh12.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (14, N'Gọng kính Titan002', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh13.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (15, N'Mắt kính Titan001', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh14.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (16, N'Mắt kính Titan002', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh15.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (17, N'Mắt kính Titan003', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh16.jpg', 3, 3, 100, 1, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [imageLink], [CategoryID], [SellerID], [Amount], [StatusID], [ManufacturerID]) VALUES (18, N'Kính bơi Titan003', N'Kính Titan mang lại cảm giác thỏa mái nhẹ nhàng khi đeo', 3999000, 4310000, 10, N'chup-hinh-mat-kinh17.jpg', 3, 3, 100, 1, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([StatusID], [StatusName]) VALUES (1, N'Available')
INSERT [dbo].[ProductStatus] ([StatusID], [StatusName]) VALUES (2, N'StopBusiness')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Ship] ON 

INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (1, N'An Giang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (2, N'Bà Rịa-Vũng Tàu', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (3, N'Bạc Liêu', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (4, N'Bắc Kạn', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (5, N'Bắc Giang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (6, N'Bắc Ninh', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (7, N'Bến Tre', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (8, N'Bình Dương', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (9, N'Bình Định', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (10, N'Bình Phước', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (11, N'Bình Thuận', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (12, N'Cà Mau', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (13, N'Cao Bằng', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (14, N'Cần Thơ (TP)', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (15, N'Đà Nẵng (TP)', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (16, N'Đắk Lắk', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (17, N'Đắk Nông', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (18, N'Điện Biên', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (19, N'Đồng Nai', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (20, N'Đồng Tháp', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (21, N'Gia Lai', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (22, N'Hà Giang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (23, N'Hà Nam', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (24, N'Hà Nội(TP)', 20000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (25, N'Hà Tây', 20000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (26, N'Hà Tĩnh', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (27, N'Hải Dương', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (28, N'Hải Phòng(TP)', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (29, N'Hòa Bình', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (30, N'Hồ Chí Minh(TP)', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (31, N'Hậu Giang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (32, N'Hưng Yên', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (33, N'Khánh Hòa', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (34, N'Kiên Giang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (35, N'Kon Tum', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (36, N'Lai Châu', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (37, N'Lào Cai', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (38, N'Lạng Sơn', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (39, N'Lâm Đồng', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (40, N'Long An', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (41, N'Nam Định', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (42, N'Nghệ An', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (43, N'Ninh Bình', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (44, N'Ninh Thuận', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (45, N'Phú Thọ', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (46, N'Phú Yên', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (47, N'Quảng Bình', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (48, N'Quảng Nam', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (49, N'Quảng Ngãi', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (50, N'Quảng Ninh', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (51, N'Quảng Trị', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (52, N'Sóc Trăng', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (53, N'Sơn La', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (54, N'Tây Ninh', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (55, N'Thái Bình', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (56, N'Thái Nguyên', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (57, N'Thanh Hóa', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (58, N'Thừa Thiên - Huế', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (59, N'Tiền Giang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (60, N'Trà Vinh', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (61, N'Tuyên Quang', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (62, N'Vĩnh Long', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (63, N'Vĩnh Phúc', 50000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (64, N'Yên Bái', 50000)
SET IDENTITY_INSERT [dbo].[Ship] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (1, N'minh', N'minh', N'minhvnhe153050@fpr.edu.vn', N'aaaaa', 0, 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (2, N'hung', N'hung', N'hung@fpt.edu.vn', N'bbbbb', 1, 0, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (3, N'tuan', N'tuan', N'tuan@gmail.com', N'bbbbb', 1, 0, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (4, N'duc', N'duc', N'duc@fpt.edu.vn', N'bbbbb', 0, 0, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (5, N'hanh', N'hanh', N'hanh@fpt.edu.vn', N'bbbbb', 0, 0, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (6, N'duyhung2h', N'aladanh', N'duyhung2h@gmail.com', N'bbbbb', 0, 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [ActiveCode], [isSeller], [isAdmin], [StatusID]) VALUES (7, N'duyhung5h', N'aladanh', N'duyhung3h@gmail.com', N'rl4O5GFqSq', 1, 0, 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (2, N'Locked')
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (3, N'FB Login')
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (4, N'Unverified')
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[AttributeList]  WITH NOCHECK ADD  CONSTRAINT [FK_AttributeList_Attribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attribute] ([AttributeID])
GO
ALTER TABLE [dbo].[AttributeList] CHECK CONSTRAINT [FK_AttributeList_Attribute]
GO
ALTER TABLE [dbo].[AttributeList]  WITH CHECK ADD  CONSTRAINT [FK_AttributeList_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[AttributeList] CHECK CONSTRAINT [FK_AttributeList_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [productID_in_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [productID_in_product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [userID_in_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [userID_in_user]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [orderID_in_orders_6] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [orderID_in_orders_6]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [productID_in_feedback] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [productID_in_feedback]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [userID_in_user_3] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [userID_in_user_3]
GO
ALTER TABLE [dbo].[Feedback_Replies]  WITH CHECK ADD  CONSTRAINT [feedbackID_in_feedback] FOREIGN KEY([FeedbackID])
REFERENCES [dbo].[Feedback] ([ID])
GO
ALTER TABLE [dbo].[Feedback_Replies] CHECK CONSTRAINT [feedbackID_in_feedback]
GO
ALTER TABLE [dbo].[Feedback_Replies]  WITH CHECK ADD  CONSTRAINT [userID_in_user_4] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback_Replies] CHECK CONSTRAINT [userID_in_user_4]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [OrderID_in_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [OrderID_in_Orders]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [UserID_in_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [UserID_in_Users]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [orderID_in_order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [orderID_in_order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [productID_in_order_detail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [productID_in_order_detail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [statusID_in_order_status] FOREIGN KEY([Status])
REFERENCES [dbo].[Order_Status] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [statusID_in_order_status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [userID_in_user_order] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [userID_in_user_order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [ManufacturerID_in_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [ManufacturerID_in_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_in_category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_in_category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [SellerID_in_Users] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [SellerID_in_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [StatusID_in_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ProductStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [StatusID_in_Status]
GO
ALTER TABLE [dbo].[ShipInfo]  WITH CHECK ADD  CONSTRAINT [order_id_in_order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[ShipInfo] CHECK CONSTRAINT [order_id_in_order]
GO
ALTER TABLE [dbo].[ShipInfo]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_info] FOREIGN KEY([ShipCityID])
REFERENCES [dbo].[Ship] ([id])
GO
ALTER TABLE [dbo].[ShipInfo] CHECK CONSTRAINT [ship_city_in_ship_info]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_address] FOREIGN KEY([ShipCityID])
REFERENCES [dbo].[Ship] ([id])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [ship_city_in_ship_address]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [userID_in_user_address] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [userID_in_user_address]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Status_ID_in_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[UserStatus] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Status_ID_in_Status]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [valid_star] CHECK  (([Star]<(6) AND [Star]>(0)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [valid_star]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [GlassShop] SET  READ_WRITE 
GO
