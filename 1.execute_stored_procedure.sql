USE computerstg;

BEGIN

EXEC [computerstg].[dbo].[sp_create_dim_location];
EXEC [computerstg].[dbo].[sp_create_dim_shop];
EXEC [computerstg].[dbo].[sp_create_dim_pc];
EXEC [computerstg].[dbo].[sp_create_dim_specification];
EXEC [computerstg].[dbo].[sp_create_dim_customer];
EXEC [computerstg].[dbo].[sp_create_dim_salesperson];
EXEC [computerstg].[dbo].[sp_create_dim_payment_method];
EXEC [computerstg].[dbo].[sp_create_dim_date];
EXEC [computerstg].[dbo].[sp_create_dim_channel];
EXEC [computerstg].[dbo].[sp_create_dim_priority];
EXEC [computerstg].[dbo].[sp_create_fact_table];

GO
