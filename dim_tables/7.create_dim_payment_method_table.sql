DROP TABLE [computerstg].[dbo].[dim_payment_method];

CREATE TABLE [computerstg].[dbo].[dim_payment_method](
	[Payment_Id] [INT] Identity (1,1) PRIMARY KEY,
	[Payment_Method] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_payment_method](
[Payment_Method],
[LoadDate]
)

SELECT DISTINCT
[Payment_Method],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT * 
FROM [computerstg].[dbo].[dim_payment_method]
GO


