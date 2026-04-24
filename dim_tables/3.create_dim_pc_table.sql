DROP TABLE [computerstg].[dbo].[dim_pc];

CREATE TABLE [computerstg].[dbo].[dim_pc](
	[PC_Id] [INT] Identity (1,1) PRIMARY KEY, 
	[PC_Manufacturer] [nvarchar](50) NOT NULL,
	[PC_Model] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_pc](
[PC_Manufacturer],
[PC_Model],
[LoadDate]
)

SELECT DISTINCT
[PC_Make],
[PC_Model],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_pc]

GO 
