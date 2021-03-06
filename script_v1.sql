USE [master]
GO
/****** Object:  Database [FoodMarket]    Script Date: 4/25/2018 9:06:29 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 4/25/2018 9:06:29 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[CustomerTitles]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[EmployeeTitles]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[ProductPhotos]    Script Date: 4/25/2018 9:06:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhotos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhotoPath] [varchar](1000) NULL,
	[ProductID] [varchar](10) NULL,
 CONSTRAINT [PK_ProductPhotos_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/25/2018 9:06:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](10) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[SupplierID] [varchar](10) NULL,
	[CategoryID] [varchar](10) NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitPrice] [decimal](12, 2) NULL,
	[InStock] [int] NULL,
	[OnOrder] [int] NULL,
	[Discontinue] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 4/25/2018 9:06:30 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 4/25/2018 9:06:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](254) NOT NULL,
	[HashString] [varchar](65) NULL,
	[Salt] [varchar](64) NULL,
	[CustomerID] [varchar](10) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
ALTER TABLE [dbo].[ProductPhotos]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhotos_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductPhotos] CHECK CONSTRAINT [FK_ProductPhotos_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
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
USE [master]
GO
ALTER DATABASE [FoodMarket] SET  READ_WRITE 
GO
