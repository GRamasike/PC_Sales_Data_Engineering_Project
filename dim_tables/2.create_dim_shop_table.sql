DROP TABLE [computerstg].[dbo].[dim_shop];

CREATE TABLE [computerstg].[dbo].[dim_shop](
	[ShopId] [INT] Identity (1,1) PRIMARY KEY,
	[Shop_Name] [nvarchar](50) NOT NULL,
	[Shop_Age] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_shop](
[Shop_Name],
[Shop_Age],
[LoadDate]

)

SELECT DISTINCT
[Shop_Name],
[Shop_Age],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_shop]

GO

