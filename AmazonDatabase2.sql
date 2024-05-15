use master
ALTER DATABASE [db_AmazonFood] SET SINGLE_USER WITH ROLLBACK IMMEDIATE    
drop database [db_AmazonFood]
create database [db_AmazonFood]
USE [db_AmazonFood]	

USE [db_AmazonFood]
GO
/****** Object:  Table [dbo].[Mst_tblItemMaster]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mst_tblItemMaster](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](30) NOT NULL,
	[ItemTypeId] [int] NULL,
	[UnitId] [int] NULL,
	[SaleAmount] [decimal](18, 2) NULL,
	[PurchaseAmount] [decimal](18, 2) NULL,
	[ItemImagePath] [varchar](150) NULL,
	[ItemCode] [varchar](6) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mst_tblItemType]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mst_tblItemType](
	[ItemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ItemTypeName] [varchar](30) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
	[UnitId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mst_tblItemUnit]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mst_tblItemUnit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](30) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mst_tblUserRegistraion]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mst_tblUserRegistraion](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeId] [int] NULL,
	[UserName] [varchar](80) NOT NULL,
	[DivisionId] [int] NULL,
	[DistrictId] [int] NULL,
	[Email] [varchar](80) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Gender] [tinyint] NULL,
	[Address] [varchar](200) NULL,
	[ShopName] [varchar](100) NULL,
	[PanNo] [varchar](10) NULL,
	[ShopAddress] [varchar](200) NULL,
	[UserImage] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mst_tblUserType]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mst_tblUserType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](7) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDistrict]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDistrict](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [varchar](40) NOT NULL,
	[DivisionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDivision]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDivision](
	[DivisionId] [int] IDENTITY(1,1) NOT NULL,
	[DivisionName] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_tblAddStock]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_tblAddStock](
	[AddStockId] [int] IDENTITY(1,1) NOT NULL,
	[SalerId] [int] NULL,
	[ItemId] [int] NULL,
	[PurchaseAmount] [decimal](18, 2) NULL,
	[TotalPurchaseQty] [int] NULL,
	[TotalPurchaseAmount] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[CreatedByIp] [varchar](15) NULL,
 CONSTRAINT [PK_tblAddStock] PRIMARY KEY CLUSTERED 
(
	[AddStockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_tblAddStockChild]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_tblAddStockChild](
	[AddStockChildId] [int] IDENTITY(1,1) NOT NULL,
	[AddStockId] [int] NULL,
	[ItemId] [int] NULL,
	[PurchaseAmount] [decimal](18, 2) NULL,
	[PurchaseQty] [int] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tblAddStockChild] PRIMARY KEY CLUSTERED 
(
	[AddStockChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_tblCart]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_tblCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ItemId] [int] NULL,
	[SalerId] [int] NULL,
	[BuyerId] [int] NULL,
	[SaleAmount] [decimal](18, 2) NULL,
	[TotalSaleQty] [int] NULL,
	[TotalSaleAmount] [decimal](18, 2) NULL,
	[IsOrdered] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[CreatedByIp] [varchar](15) NULL,
 CONSTRAINT [PK_tblCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_tblOrder]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_tblOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[BuyerId] [int] NULL,
	[SaleAmount] [decimal](18, 2) NULL,
	[TotalSaleQty] [int] NULL,
	[TotalSaleAmount] [decimal](18, 2) NULL,
	[OrderStatus] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[CreatedByIp] [varchar](15) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trn_tblStock]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_tblStock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[StockType] [varchar](50) NULL,
	[SalerId] [int] NULL,
	[BuyerId] [int] NULL,
	[SaleAmount] [decimal](18, 2) NULL,
	[PurchaseAmount] [decimal](18, 2) NULL,
	[TotalPurchaseQty] [int] NULL,
	[TotalSaleQty] [int] NULL,
	[TotalPurchaseAmount] [decimal](18, 2) NULL,
	[TotalSaleAmount] [decimal](18, 2) NULL,
	[TotalQty] [int] NULL,
	[TotalAmt] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [date] NULL,
	[CreatedByIp] [varchar](15) NULL,
 CONSTRAINT [PK_tblStock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mst_tblItemType] ON 
GO
INSERT [dbo].[Mst_tblItemType] ([ItemTypeId], [ItemTypeName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp], [UnitId]) VALUES (1, N'Pizza', 1, 1, CAST(N'2024-05-10T14:31:28.383' AS DateTime), N'::1', 5)
GO
SET IDENTITY_INSERT [dbo].[Mst_tblItemType] OFF
GO
SET IDENTITY_INSERT [dbo].[Mst_tblItemUnit] ON 
GO
INSERT [dbo].[Mst_tblItemUnit] ([UnitId], [UnitName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (1, N'Kilogram', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Mst_tblItemUnit] ([UnitId], [UnitName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (2, N'Gram', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Mst_tblItemUnit] ([UnitId], [UnitName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (3, N'Liter', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Mst_tblItemUnit] ([UnitId], [UnitName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (4, N'Milliliter', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Mst_tblItemUnit] ([UnitId], [UnitName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (5, N'Packages ', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Mst_tblItemUnit] ([UnitId], [UnitName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (6, N'Pieces', 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Mst_tblItemUnit] OFF
GO
SET IDENTITY_INSERT [dbo].[Mst_tblUserRegistraion] ON 
GO
INSERT [dbo].[Mst_tblUserRegistraion] ([UserId], [UserTypeId], [UserName], [DivisionId], [DistrictId], [Email], [Password], [Mobile], [Gender], [Address], [ShopName], [PanNo], [ShopAddress], [UserImage], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (1, 2, N'Sagar', 1, 1, N'Sagar@123mail.com', N'6DOz6zulmvbnsEveGgjKKcGMNI/S7uo7gQmlu40wsc0lezD9BmVl/1B4zzwvRPkY2jsWZIjfCbuKR5JQz0c4jw==', N'8975642310', 1, N'at Bhopal', NULL, NULL, NULL, N'User_Avatar.png', 1, NULL, CAST(N'2024-05-08T14:51:41.367' AS DateTime), N'::1')
GO
INSERT [dbo].[Mst_tblUserRegistraion] ([UserId], [UserTypeId], [UserName], [DivisionId], [DistrictId], [Email], [Password], [Mobile], [Gender], [Address], [ShopName], [PanNo], [ShopAddress], [UserImage], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (2, 2, N'dd', 1, 1, N'dd@dd.dd', N'6DOz6zulmvbnsEveGgjKKcGMNI/S7uo7gQmlu40wsc0lezD9BmVl/1B4zzwvRPkY2jsWZIjfCbuKR5JQz0c4jw==', N'7894561230', 1, N'yyty', NULL, NULL, NULL, N'kheer.jpg', 1, NULL, CAST(N'2024-05-08T18:34:30.967' AS DateTime), N'::1')
GO
INSERT [dbo].[Mst_tblUserRegistraion] ([UserId], [UserTypeId], [UserName], [DivisionId], [DistrictId], [Email], [Password], [Mobile], [Gender], [Address], [ShopName], [PanNo], [ShopAddress], [UserImage], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (3, 2, N'aman', 1, 4, N'aman@gmail.com', N'8jXrMkFVXfUeqcwN5RwARUf/FpppW4VeFlGtXRA6PMYRcgy+yd+tgoOgqzEP021EHTSSmFiO0fzXbmO4fCBpRw==', N'8527419630', 1, N'aman', NULL, NULL, NULL, N'Ice_Cream.jpg', 1, NULL, CAST(N'2024-05-08T18:35:59.270' AS DateTime), N'::1')
GO
INSERT [dbo].[Mst_tblUserRegistraion] ([UserId], [UserTypeId], [UserName], [DivisionId], [DistrictId], [Email], [Password], [Mobile], [Gender], [Address], [ShopName], [PanNo], [ShopAddress], [UserImage], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (4, 3, N'Vipul', 1, 3, N'Vipul@gmail.com', N'FR+kNC3mWzeWK3pe5TthhkNC78LVHl1ivt7iJx8VqlEDyIi1O+JylV7gb/7Ev5FoyxDJLcv5bL2eFpkpMvOutQ==', N'9583692580', 1, N'At Rajgarh', N'Vipul Food Stall', N'hhgfh4568f', N'At rajgarh ,main rode', N'food-pizza.jpg', 1, 1, CAST(N'2024-05-08T19:48:10.047' AS DateTime), N'::1')
GO
INSERT [dbo].[Mst_tblUserRegistraion] ([UserId], [UserTypeId], [UserName], [DivisionId], [DistrictId], [Email], [Password], [Mobile], [Gender], [Address], [ShopName], [PanNo], [ShopAddress], [UserImage], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (5, 3, N'Manoj', 2, 7, N'Manoj@gmail.com', N'oZO7To6b/7BINnYItjN9pVZLeo5P/+A6wqaMZyF4oqITxZqCkdefemOk5RkpTu/Pp+3/Q7V2j8igg+QVR8CxRw==', N'7884561230', 1, N'at burhanpur, post salidhana', N'Veg and Nonveg Stall', N'werty1234y', N'at heerapur, post salidhana', N'User_Avatar.png', 1, 1, CAST(N'2024-05-08T19:55:07.403' AS DateTime), N'::1')
GO
SET IDENTITY_INSERT [dbo].[Mst_tblUserRegistraion] OFF
GO
SET IDENTITY_INSERT [dbo].[Mst_tblUserType] ON 
GO
INSERT [dbo].[Mst_tblUserType] ([UserTypeId], [UserTypeName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (1, N'admin', 1, 1, CAST(N'2024-05-08T12:26:02.683' AS DateTime), N'127.0.0.1')
GO
INSERT [dbo].[Mst_tblUserType] ([UserTypeId], [UserTypeName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (2, N'Buyer', 1, 1, CAST(N'2024-05-08T12:26:02.683' AS DateTime), N'127.0.0.1')
GO
INSERT [dbo].[Mst_tblUserType] ([UserTypeId], [UserTypeName], [IsActive], [CreatedBy], [CreatedOn], [CreatedByIp]) VALUES (3, N'Seller', 1, 1, CAST(N'2024-05-08T12:26:02.683' AS DateTime), N'127.0.0.1')
GO
SET IDENTITY_INSERT [dbo].[Mst_tblUserType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDistrict] ON 
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (1, N'Bhopal', 1)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (2, N'Raisen', 1)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (3, N'Rajgarh', 1)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (4, N'Sehore', 1)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (5, N'Vidisha', 1)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (6, N'Harda', 2)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (7, N'Hoshangabad', 2)
GO
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictName], [DivisionId]) VALUES (8, N'Betul', 2)
GO
SET IDENTITY_INSERT [dbo].[tblDistrict] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDivision] ON 
GO
INSERT [dbo].[tblDivision] ([DivisionId], [DivisionName]) VALUES (1, N'Bhopal')
GO
INSERT [dbo].[tblDivision] ([DivisionId], [DivisionName]) VALUES (2, N'Narmadapuram')
GO
SET IDENTITY_INSERT [dbo].[tblDivision] OFF
GO
ALTER TABLE [dbo].[Mst_tblItemMaster]  WITH CHECK ADD FOREIGN KEY([ItemTypeId])
REFERENCES [dbo].[Mst_tblItemType] ([ItemTypeId])
GO
ALTER TABLE [dbo].[Mst_tblItemMaster]  WITH CHECK ADD FOREIGN KEY([UnitId])
REFERENCES [dbo].[Mst_tblItemUnit] ([UnitId])
GO
ALTER TABLE [dbo].[Mst_tblUserRegistraion]  WITH CHECK ADD FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[Mst_tblUserType] ([UserTypeId])
GO
/****** Object:  StoredProcedure [dbo].[UspMst_RegItemType]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[UspMst_RegItemType]
@TypeName					varchar(30)         =       Null       ,
@UnitId						int                 =       null       ,
@CreatedBy					int                 =       null       ,
@CreatedByIp				varchar(15)			=       null       

as 
begin
declare @status bit,@msg varchar(100);
begin try

begin transaction
	if not exists(select * from [Mst_tblItemType] where [ItemTypeName]=@TypeName)
	begin

		INSERT INTO [dbo].[Mst_tblItemType]
				   ([ItemTypeName]
				   ,[UnitId]
				   ,[IsActive]
				   ,[CreatedBy]
				   ,[CreatedOn]
				   ,[CreatedByIp])
			 VALUES
				   (@TypeName
				   ,@UnitId
				   ,1
				   ,@CreatedBy
				   ,CURRENT_TIMESTAMP
				   ,@CreatedByIp)
				   
		select @msg ='Item type declared Successfully', @status=1
	end
	else
	begin
		select @msg ='Item type Already exists', @status=0
	end
commit
end try
begin catch
  rollback
  select @msg =ERROR_MESSAGE(), @status=0
end	catch
select @msg as [msg], @status as [status]
end
GO
/****** Object:  StoredProcedure [dbo].[UspMst_UserReg]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[UspMst_UserReg]

@UserTypeId					int                 =       null       ,
@UserName					varchar(80)         =       null       ,
@DivisionId					int                 =       null       ,
@DistrictId					int                 =       null       ,
@Email						varchar(80)         =       null       ,
@Password					varchar(100)         =       null       ,
@Mobile						varchar(10)         =       null       ,
@Gender						tinyint             =       null       ,
@Address					varchar(200)        =       null       ,
@ShopName					varchar(100)        =       null       ,
@PanNo						varchar(10)         =       null       ,
@ShopAddress				varchar(200)        =       null       ,
@UserImage					varchar(100)        =       null       ,
@CreatedBy					int                 =       null       ,
@CreatedByIp				varchar(15)			=       null       

as 
begin
declare @status bit,@msg varchar(100);
begin try

begin transaction
	if not exists(select * from Mst_tblUserRegistraion where Mobile=@Mobile or Email=@Email)
	begin
		insert into Mst_tblUserRegistraion(
		UserTypeId,  UserName,  DivisionId,  DistrictId,  Email,  Password,   Mobile, Gender,  Address,  ShopName,  PanNo,  ShopAddress,  UserImage, IsActive, CreatedBy,  CreatedOn    ,       CreatedByIp)
		values (
		@UserTypeId, @UserName, @DivisionId, @DistrictId, @Email, @Password, @Mobile, @Gender, @Address, @ShopName, @PanNo, @ShopAddress, @UserImage,   1   ,  @CreatedBy, CURRENT_TIMESTAMP , @CreatedByIp)
		select @msg ='Registration SuccessFull', @status=1
	end
	else
	begin
		select @msg ='Already Registered', @status=0
	end
commit
end try
begin catch
  rollback
  select @msg =ERROR_MESSAGE(), @status=0
end	catch
select @msg as [msg], @status as [status]
end
GO
/****** Object:  StoredProcedure [dbo].[UspTrn_BindDDL]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[UspTrn_BindDDL]
@Id int =null,
@table varchar (100)
as
begin
declare @msg varchar (50) ='', @Status bit=0
	 if (@table='Division')
		 begin
			select tbl.DivisionId  Id,tbl.DivisionName Name from  tblDivision tbl 
			set @Status= 1
			set  @msg ='Division  Drop Down filids Successfully'
		 end
	 else if (@table='District')
		 begin
		select tbl.DistrictId  Id,tbl.DistrictName Name from  tblDistrict tbl where DivisionId=@Id or  (@Id = '' or @Id is null)
			set @Status= 1
			set  @msg ='District  Drop Down filids Successfully'
		 end
	else if (@table='Unit')
		 begin
		select tbl.UnitId  Id,tbl.UnitName Name from  Mst_tblItemUnit tbl where UnitId=@Id or  (@Id = '' or @Id is null)
			set @Status= 1
			set  @msg ='Unit  Drop Down filids Successfully'
		 end
	 else
	 begin
			set @Status= 0
	 set @msg= 'Invalid Table Name'
	 end
	 end
GO
/****** Object:  StoredProcedure [dbo].[Usptrn_GetItemType]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Usptrn_GetItemType]

as 
begin
declare @status bit,@msg varchar(100);
begin try

begin transaction
	if exists(select 1 from [Mst_tblItemType])
	begin

		select [type].[ItemTypeId] 
					,[type].[ItemTypeName] 
				   ,[unit].[UnitName]
				   ,case 
				   When [type].[IsActive]=0 then 'No'  When [type].[IsActive]=1 then 'Yes' else 'Undefined' end [IsActive]
				   ,[user].[UserName]
				   ,FORMAT([type].[CreatedOn],'dd/MM/yyyy hh:mm:s tt') [CreatedOn]
				   

				    ,case 
				   When [type].[CreatedByIp]='::1' then '127.0.0.1' else [type].[CreatedByIp] end [CreatedByIp]
				  
			from [dbo].[Mst_tblItemType] [type]
			join Mst_tblItemUnit unit on [type].[UnitId]=[unit].UnitId
			join Mst_tblUserRegistraion [user] on [user].[UserId]=[type].[CreatedBy]
		select @msg ='Item type Selected Successfully', @status=1
	end
	else
	begin
		select @msg ='Item type  Not Found', @status=0
	end
commit
end try
begin catch
  rollback
  select @msg =ERROR_MESSAGE(), @status=0
end	catch
select @msg as [msg], @status as [status]
end
GO
/****** Object:  StoredProcedure [dbo].[UspTrn_Login]    Script Date: 10-May-24 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[UspTrn_Login]
@UserName					varchar(10)         =       null    ,    
@Password					varchar(100)        =       null      

as 
begin
declare @status bit,@msg varchar(100);
begin try

	begin transaction
		if  exists(select 1  from Mst_tblUserRegistraion where Mobile=@UserName and Password=@Password and IsActive=1)
			begin
				select  UserId Id, UserName name,UserImage img,UserTypeId  Usertype from Mst_tblUserRegistraion where Mobile=@UserName and Password=@Password and IsActive=1
				select @msg ='Login SuccessFull', @status=1
			end
		else if exists(select * from Mst_tblUserRegistraion where Mobile=@UserName and Password=@Password)
			begin
				select @msg ='User Not Active', @status=0
			end
		else if exists(select * from Mst_tblUserRegistraion where Mobile=@UserName )
			begin
				select @msg =' Wrong Password', @status=0
			end
		else 
			begin
				select @msg =' User Doesn''t Exists', @status=0
			end
	commit
end try
begin catch
  rollback
  select @msg =ERROR_MESSAGE(), @status=0
end	catch
select @msg as [msg], @status as [status]
end
GO

