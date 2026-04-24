--Create stored procedure to create dim_date table

CREATE PROCEDURE create_dim_date AS

BEGIN
DROP TABLE [computerstg].[dbo].[dim_date];

CREATE TABLE [computerstg].[dbo].[dim_date](
[Date_Id] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
[FullDate] [DATE],
[Year] [SMALLINT],
MonthName [VARCHAR](10),
[Day] [TINYINT],
[LoadDate] DATETIME DEFAULT GETDATE()
    );

SET IDENTITY_INSERT [computerstg].[dbo].[dim_date] ON;

INSERT INTO [computerstg].[dbo].[dim_date](
[Date_Id],
[FullDate],
[Year],
MonthName,
[Day]
    )
    VALUES (1, NULL, NULL, 'Unknown', NULL);

SET IDENTITY_INSERT [computerstg].[dbo].[dim_date] OFF;

  
INSERT INTO [computerstg].[dbo].[dim_date](
[FullDate],
[Year],
MonthName,
[Day]
    )
    SELECT
        d.FullDate,
        YEAR(d.FullDate),
        DATENAME(MONTH, d.FullDate),
        DAY(d.FullDate)
    FROM (
        SELECT CAST(Purchase_Date AS DATE) AS FullDate
        FROM [computerstg].[dbo].[raw_data]
        WHERE Purchase_Date IS NOT NULL

        UNION

        SELECT CAST(Ship_Date AS DATE)
        FROM [computerstg].[dbo].[raw_data]
        WHERE Ship_Date != 'N/A'
          AND TRY_CONVERT(DATE, Ship_Date) IS NOT NULL
    ) d;



SELECT *
FROM [computerstg].[dbo].[dim_date]
ORDER BY Date_Id;


END;
