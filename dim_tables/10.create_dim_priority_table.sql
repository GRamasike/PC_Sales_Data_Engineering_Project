DROP TABLE [computerstg].[dbo].[dim_priority];

CREATE TABLE [computerstg].[dbo].[dim_priority](
	[Priority_Id] [INT] Identity (1,1) PRIMARY KEY,
	[Priority_Name] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_priority](
[Priority_Name],
[LoadDate]
)

SELECT DISTINCT
[Priority],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_priority]
GO


