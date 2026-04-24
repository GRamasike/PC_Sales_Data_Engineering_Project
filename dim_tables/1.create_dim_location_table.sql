--Create dim_location table 

DROP TABLE [computerstg].[dbo].[dim_location];

CREATE TABLE [computerstg].[dbo].[dim_location](
	[LocationId] [INT] Identity (1,1) PRIMARY KEY,
	[Continent] [nvarchar](50) NOT NULL,
	[Country_or_State] [nvarchar](50) NOT NULL,
	[Province_or_City] [nvarchar](100) NOT NULL,
	[LoadDate] DATETIME DEFAULT GETDATE()
) 

INSERT INTO [computerstg].[dbo].[dim_location](
[Continent],
[Country_or_State],
[Province_or_City],
[LoadDate]
)

SELECT DISTINCT
[Continent],
[Country_or_State],
[Province_or_City],
GETDATE()

FROM [computerstg].[dbo].[raw_data]

SELECT *
FROM [computerstg].[dbo].[dim_location]





