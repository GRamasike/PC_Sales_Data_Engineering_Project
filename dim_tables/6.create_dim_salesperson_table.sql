DROP TABLE [computerstg].[dbo].[dim_salesperson];

CREATE TABLE [computerstg].[dbo].[dim_salesperson](
	[Saleperson_Id] [INT] Identity (1,1) PRIMARY KEY,
	[Salesperson_Name] [nvarchar](50) NOT NULL,
	[Salesperson_Department] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
	
) 

INSERT INTO [computerstg].[dbo].[dim_salesperson](
[Salesperson_Name],
[Salesperson_Department],
[LoadDate]
)

SELECT DISTINCT
[Sales_Person_Name],
[Sales_Person_Department],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_salesperson]

GO


