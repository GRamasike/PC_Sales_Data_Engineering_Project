DROP TABLE [computerstg].[dbo].[dim_channel];

CREATE TABLE [computerstg].[dbo].[dim_channel](
	[Channel_Id] [INT] Identity (1,1) PRIMARY KEY,
	[Channel_Name] [nvarchar](50) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_channel](
[Channel_Name],
[LoadDate]
)
SELECT DISTINCT
[Channel],
GETDATE()
FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_channel]

GO


