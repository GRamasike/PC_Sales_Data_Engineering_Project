--CREATE dim_specification_table

DROP TABLE [computerstg].[dbo].[dim_specification];

CREATE TABLE [computerstg].[dbo].[dim_specification](
	[Spec_Id] [INT] Identity (1,1) PRIMARY KEY,
	[Storage_Type] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[Storage_Capacity] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_specification](
[Storage_Type],
[RAM],
[Storage_Capacity],
[LoadDate]
)

SELECT DISTINCT
[Storage_Type],
[RAM],
[Storage_Capacity],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_specification]

GO





