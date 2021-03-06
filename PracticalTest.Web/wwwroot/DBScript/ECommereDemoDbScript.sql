USE [ECommerceDemo]
GO
/****** Object:  UserDefinedTableType [dbo].[ProductAttributesType]    Script Date: 15-08-2021 19:32:57 ******/
CREATE TYPE [dbo].[ProductAttributesType] AS TABLE(
	[AttributeId] [int] NULL,
	[AttributeValue] [varchar](250) NULL
)
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15-08-2021 19:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProdCatId] [int] NOT NULL,
	[ProdName] [varchar](250) NOT NULL,
	[ProdDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 15-08-2021 19:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ProductId] [bigint] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[AttributeValue] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributeLookup]    Script Date: 15-08-2021 19:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributeLookup](
	[AttributeId] [int] IDENTITY(1,1) NOT NULL,
	[ProdCatId] [int] NOT NULL,
	[AttributeName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ProductAttributeLookup] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 15-08-2021 19:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProdCatId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](250) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProdCatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (1, 2, N'Iphone 12', N'Apple Brand')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (2, 1, N'Alto K10', N'Maruti Suzuki')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (3, 2, N'Nokia 3310', N'Nokia Brand')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (4, 1, N'SPreesso', N'Maruti Suzuki')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (5, 2, N'Samsung 12', N'Fourty Keypad')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (6, 1, N'I10', N'Hundai')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (7, 1, N'I20', N'Hundai')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (8, 2, N'Nokia N95', N'Nokia')
INSERT [dbo].[Product] ([ProductId], [ProdCatId], [ProdName], [ProdDescription]) VALUES (9, 1, N'Swift', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (1, 4, N'16')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (1, 5, N'Yes')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (1, 6, N'Yes')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (2, 1, N'White')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (2, 2, N'200')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (2, 3, N'2020')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (3, 4, N'10')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (3, 5, N'No')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (3, 6, N'No')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (6, 1, N'White')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (6, 2, N'2021')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (6, 3, N'2021')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (7, 1, N'Black')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (7, 2, N'2021')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (7, 3, N'2021')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (4, 1, N'Yellow')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (4, 2, N'2012')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (4, 3, N'2021')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (5, 4, N'5')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (5, 5, N'No')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (5, 6, N'Yes')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (9, 1, N'White')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (9, 2, N'2021')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (9, 3, N'20121')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (8, 4, N'2')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (8, 5, N'Yes')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [AttributeValue]) VALUES (8, 6, N'Yes')
SET IDENTITY_INSERT [dbo].[ProductAttributeLookup] ON 

INSERT [dbo].[ProductAttributeLookup] ([AttributeId], [ProdCatId], [AttributeName]) VALUES (1, 1, N'Color')
INSERT [dbo].[ProductAttributeLookup] ([AttributeId], [ProdCatId], [AttributeName]) VALUES (2, 1, N'Make')
INSERT [dbo].[ProductAttributeLookup] ([AttributeId], [ProdCatId], [AttributeName]) VALUES (3, 1, N'Model')
INSERT [dbo].[ProductAttributeLookup] ([AttributeId], [ProdCatId], [AttributeName]) VALUES (4, 2, N'RAM')
INSERT [dbo].[ProductAttributeLookup] ([AttributeId], [ProdCatId], [AttributeName]) VALUES (5, 2, N'Front Camera')
INSERT [dbo].[ProductAttributeLookup] ([AttributeId], [ProdCatId], [AttributeName]) VALUES (6, 2, N'Rear Camera')
SET IDENTITY_INSERT [dbo].[ProductAttributeLookup] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProdCatId], [CategoryName]) VALUES (1, N'Car')
INSERT [dbo].[ProductCategory] ([ProdCatId], [CategoryName]) VALUES (2, N'Mobile')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProdCatId])
REFERENCES [dbo].[ProductCategory] ([ProdCatId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_ProductAttributeLookup] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[ProductAttributeLookup] ([AttributeId])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_ProductAttributeLookup]
GO
ALTER TABLE [dbo].[ProductAttributeLookup]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeLookup_ProductCategory] FOREIGN KEY([ProdCatId])
REFERENCES [dbo].[ProductCategory] ([ProdCatId])
GO
ALTER TABLE [dbo].[ProductAttributeLookup] CHECK CONSTRAINT [FK_ProductAttributeLookup_ProductCategory]
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 15-08-2021 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategory]
AS
BEGIN
	SELECT * FROM ProductCategory
END
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 15-08-2021 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProduct]
(
	@Offset INT,
	@PageSize INT
)
AS
BEGIN
	SELECT 
		COUNT(ProductId)
	FROM [ECommerceDemo].[dbo].[Product]

	SELECT P.*,PC.CategoryName
	FROM [ECommerceDemo].[dbo].[Product] p
	INNER JOIN [ECommerceDemo].[dbo].[ProductCategory] PC 
	ON P.ProdCatId=PC.ProdCatId
	ORDER BY ProductId
	OFFSET @Offset ROWS
	FETCH NEXT @PageSize ROWS ONLY

	SELECT PA.ProductId
      ,PA.AttributeId
      ,PA.AttributeValue
	  ,PAL.AttributeName
  FROM [ECommerceDemo].[dbo].[ProductAttribute] PA
  INNER JOIN [ECommerceDemo].[dbo].[ProductAttributeLookup] PAL
  ON PA.AttributeId=PAL.AttributeId
  WHERE PA.ProductId IN (SELECT P.ProductId
	FROM [ECommerceDemo].[dbo].[Product] p
	INNER JOIN [ECommerceDemo].[dbo].[ProductCategory] PC 
	ON P.ProdCatId=PC.ProdCatId
	ORDER BY ProductId
	OFFSET @Offset ROWS
	FETCH NEXT @PageSize ROWS ONLY)

END
GO
/****** Object:  StoredProcedure [dbo].[GetProductAttributeLookup]    Script Date: 15-08-2021 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductAttributeLookup]
(
	@ProdCatId INT
)
AS
BEGIN
	SELECT AttributeId,AttributeName FROM ProductAttributeLookup WHERE ProdCatId=@ProdCatId;
END
GO
/****** Object:  StoredProcedure [dbo].[SaveProduct]    Script Date: 15-08-2021 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveProduct]
(
	@ProductId BIGINT=0,
	@ProdCatId INT,
	@ProdName VARCHAR(250),
	@ProdDescription VARCHAR(max)=NULL,
	@ProductAttributes as ProductAttributesType READONLY	
)
AS
BEGIN
	BEGIN TRY 
	IF(@ProductId=0)
	BEGIN
		BEGIN TRANSACTION
		INSERT INTO [dbo].[Product]
			   ([ProdCatId]
			   ,[ProdName]
			   ,[ProdDescription])
		 VALUES
			   (@ProdCatId, 
				@ProdName,
				@ProdDescription);

		SET @ProductId=SCOPE_IDENTITY();

		INSERT INTO [dbo].[ProductAttribute](ProductId,AttributeId,AttributeValue)
			SELECT @ProductId,items.AttributeId,items.AttributeValue FROM @ProductAttributes AS items;
		COMMIT TRANSACTION
		SELECT 1 as [IsSuccess],'Record saved successfully' as [Message];
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION
		  UPDATE [dbo].[Product]
		   SET [ProdCatId] = @ProdCatId
			  ,[ProdName] = @ProdName
			  ,[ProdDescription] = @ProdDescription
		 WHERE ProductId=@ProductId;

		 DELETE FROM [dbo].[ProductAttribute] WHERE ProductId=@ProductId;

		 INSERT INTO [dbo].[ProductAttribute](ProductId,AttributeId,AttributeValue)
			SELECT @ProductId,items.AttributeId,items.AttributeValue FROM @ProductAttributes AS items;
		COMMIT TRANSACTION
		SELECT 1 as [IsSuccess],'Record updated successfully' as [Message];
	END
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
			SELECT 0 as [IsSuccess],'Error while operation.' as [Message];
	END  CATCH
END

GO
