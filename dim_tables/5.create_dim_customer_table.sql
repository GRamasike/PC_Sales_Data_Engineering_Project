DROP TABLE [computerstg].[dbo].[dim_customer];

CREATE TABLE [computerstg].[dbo].[dim_customer](
	[Customer_Id] [INT] Identity (1,1) PRIMARY KEY,
	[Full_Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Contact_Number] [nvarchar](50) NOT NULL,
	[Email_Address] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_customer](
[Full_Name],
[Surname],
[Contact_Number],
[Email_Address],
[LoadDate]
)

SELECT DISTINCT 
[Customer_Name],
[Customer_Surname],
[Customer_Contact_Number],
[Customer_Email_Address],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_customer];

GO


