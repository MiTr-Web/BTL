USE [master]
GO
/****** Object:  Database [FoodMarket]    Script Date: 5/16/2018 10:15:27 AM ******/
CREATE DATABASE [FoodMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodMarket', FILENAME = N'E:\SQLServerMS\MSSQL13.SQLEXPRESS\MSSQL\DATA\FoodMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodMarket_log', FILENAME = N'E:\SQLServerMS\MSSQL13.SQLEXPRESS\MSSQL\DATA\FoodMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FoodMarket] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodMarket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FoodMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodMarket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodMarket] SET  MULTI_USER 
GO
ALTER DATABASE [FoodMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodMarket] SET QUERY_STORE = OFF
GO
USE [FoodMarket]
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
USE [FoodMarket]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/16/2018 10:15:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [varchar](10) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[PhotoPath] [varchar](2000) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/16/2018 10:15:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](10) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[SupplierID] [varchar](10) NULL,
	[CategoryID] [varchar](10) NULL,
	[UnitPrice] [decimal](12, 2) NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitMeasurement] [int] NULL,
	[Container] [int] NULL,
	[InStock] [int] NULL,
	[OnOrder] [int] NULL,
	[Discontinue] [bit] NULL,
	[Thumbnail] [nvarchar](256) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/16/2018 10:15:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [varchar](10) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](11) NULL,
	[Homepage] [varchar](100) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Product]    Script Date: 5/16/2018 10:15:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[View_Product] as
select A.ProductID,A.ProductName,B.CompanyName,C.CategoryName,A.QuantityPerUnit,A.UnitPrice,A.InStock,A.OnOrder,A.Discontinue
from Products as A
inner join Suppliers as B on B.SupplierID = A.SupplierID
inner join Categories as C on C.CategoryID = A.CategoryID
GO
/****** Object:  Table [dbo].[Container]    Script Date: 5/16/2018 10:15:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](10) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MobilePhone] [varchar](11) NULL,
	[JoinDate] [date] NULL,
	[MembershipTitle] [varchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTitles]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTitles](
	[CustomerTitleID] [varchar](10) NOT NULL,
	[TitleName] [nvarchar](50) NULL,
	[CustomerID] [varchar](10) NULL,
	[Discount] [decimal](2, 1) NULL,
 CONSTRAINT [PK_CustomerTitles] PRIMARY KEY CLUSTERED 
(
	[CustomerTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [varchar](10) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[IDNumber] [varchar](20) NULL,
	[Birthday] [date] NULL,
	[HiredDay] [date] NULL,
	[Address] [nvarchar](100) NULL,
	[MobilePhone] [nvarchar](20) NULL,
	[HomePhone] [nchar](20) NULL,
	[PhotoPath] [text] NULL,
	[Title] [varchar](10) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeTitles]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTitles](
	[TitleID] [varchar](10) NOT NULL,
	[TitleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmployeeTitles] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](10) NOT NULL,
	[CustomerID] [varchar](10) NULL,
	[EmployeeID] [varchar](10) NULL,
	[ShipperID] [varchar](10) NULL,
	[OrderDate] [date] NULL,
	[RequiredDate] [date] NULL,
	[ShipAddress] [nvarchar](1000) NULL,
	[Paid] [bit] NULL,
	[Delivered] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](254) NOT NULL,
	[HashString] [varchar](65) NULL,
	[Salt] [varchar](16) NULL,
	[CustomerID] [varchar](10) NULL,
	[Privilege] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [PhotoPath]) VALUES (N'0', N'Vegetable', N'https://www.organicfacts.net/wp-content/uploads/2013/05/Vegetables4.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [PhotoPath]) VALUES (N'1', N'Meat', N'http://www.australianmeatcompany.com.au/gallery/meat2full.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [PhotoPath]) VALUES (N'2', N'Fish', N'https://www.seafoodwatch.org/-/m/sfw/images/recommendations/fish/cod/atlantic-cod.png?w=600&amp;mh=350&amp;bc=ffffff')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [PhotoPath]) VALUES (N'3', N'Dairy product', N'http://i0.wp.com/corporateethos.com/wp-content/uploads/2018/02/dairy-products.jpg?fit=700%2C410')
SET IDENTITY_INSERT [dbo].[Container] ON 

INSERT [dbo].[Container] ([ID], [name]) VALUES (1, N'không')
INSERT [dbo].[Container] ([ID], [name]) VALUES (2, N'gói')
INSERT [dbo].[Container] ([ID], [name]) VALUES (3, N'cốc')
INSERT [dbo].[Container] ([ID], [name]) VALUES (4, N'chai')
INSERT [dbo].[Container] ([ID], [name]) VALUES (5, N'tuýp')
INSERT [dbo].[Container] ([ID], [name]) VALUES (6, N'lọ')
INSERT [dbo].[Container] ([ID], [name]) VALUES (7, N'túi')
INSERT [dbo].[Container] ([ID], [name]) VALUES (8, N'lon')
INSERT [dbo].[Container] ([ID], [name]) VALUES (9, N'ly')
INSERT [dbo].[Container] ([ID], [name]) VALUES (10, N'hộp')
SET IDENTITY_INSERT [dbo].[Container] OFF
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([ID], [name]) VALUES (1, N'kg')
INSERT [dbo].[Measurement] ([ID], [name]) VALUES (2, N'g')
INSERT [dbo].[Measurement] ([ID], [name]) VALUES (5, N'ml')
INSERT [dbo].[Measurement] ([ID], [name]) VALUES (6, N'lít')
INSERT [dbo].[Measurement] ([ID], [name]) VALUES (7, N'cái')
INSERT [dbo].[Measurement] ([ID], [name]) VALUES (8, N'chiếc')
INSERT [dbo].[Measurement] ([ID], [name]) VALUES (9, N'miếng')
SET IDENTITY_INSERT [dbo].[Measurement] OFF
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [QuantityPerUnit], [UnitMeasurement], [Container], [InStock], [OnOrder], [Discontinue], [Thumbnail]) VALUES (N'0', N'Broccoli', N'0', N'0', CAST(100.00 AS Decimal(12, 2)), 1, 1, 1, 10, 10, 0, N'https://www.producemarketguide.com/sites/default/files/Commodities.tar/Commodities/broccoli_commodity-page.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [QuantityPerUnit], [UnitMeasurement], [Container], [InStock], [OnOrder], [Discontinue], [Thumbnail]) VALUES (N'0003', N'Milk', N'0', N'0', CAST(30.00 AS Decimal(12, 2)), 1, 6, 4, 10, NULL, 0, N'https://cdn0.woolworths.media/content/wowproductimages/large/015311.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [QuantityPerUnit], [UnitMeasurement], [Container], [InStock], [OnOrder], [Discontinue], [Thumbnail]) VALUES (N'01', N'Pork', N'0', N'1', CAST(200.00 AS Decimal(12, 2)), 100, 2, 1, 20, NULL, 0, N'https://cdn.shopify.com/s/files/1/1434/7912/products/Bacon_Ends_c4580759-eb1b-486d-9f97-d387e82ee213_580x@2x.jpg?v=1508190087')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone], [Homepage]) VALUES (N'0', N'Red Star', NULL, N'01237741050', NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [Phone], [Homepage]) VALUES (N'1', N'Pepsico', NULL, N'12345678910', NULL)
INSERT [dbo].[Users] ([Username], [HashString], [Salt], [CustomerID], [Privilege]) VALUES (N'guest@gmail.com', N'0DAB22AA64AECDE73BAA3FBCF4850FD513278611462BF5268FB899C35775A0B8', N'77184B9D190FCD73', NULL, 1)
INSERT [dbo].[Users] ([Username], [HashString], [Salt], [CustomerID], [Privilege]) VALUES (N'trungdang97@gmail.com', N'C3421FED5EE166466B1A9E1CB83D67DA42CC69F8A5CCB51A978ED745D7A8B55A', N'F5B4D452B491F782', NULL, 0)
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerTitles] FOREIGN KEY([MembershipTitle])
REFERENCES [dbo].[CustomerTitles] ([CustomerTitleID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerTitles]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeeTitles] FOREIGN KEY([Title])
REFERENCES [dbo].[EmployeeTitles] ([TitleID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeeTitles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Container] FOREIGN KEY([UnitMeasurement])
REFERENCES [dbo].[Measurement] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Container]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Container1] FOREIGN KEY([Container])
REFERENCES [dbo].[Container] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Container1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Customers]
GO
/****** Object:  StoredProcedure [dbo].[getSalt]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSalt](@username varchar(256))
as
begin
	select Salt from Users where Username = @username
end
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Login](@username varchar(256), @hashstring varchar(65))
as
begin 
	select CustomerID, Privilege
	from Users
	where Username = @username and HashString = @hashstring
end

GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 5/16/2018 10:15:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Register](@username varchar(256), @hashstring varchar(65), @salt varchar(64))
as
begin
	insert into Users(Username,HashString,Salt,Privilege)
	values (@username,@hashstring,@salt,'1')
end
GO
USE [master]
GO
ALTER DATABASE [FoodMarket] SET  READ_WRITE 
GO
