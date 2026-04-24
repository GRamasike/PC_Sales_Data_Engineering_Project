--Create fact_pcsale table

DROP TABLE [computerstg].[dbo].[fact_pcsales];

CREATE TABLE [computerstg].[dbo].[fact_pcsales](
	[pcsales_id] [INT] Identity (1,1) NOT NULL, 

	[Location_id] [INT] NOT NULL,
	[Shop_Id] [INT] NOT NULL,
	[PC_Id] [INT] NOT NULL,
	[Spec_Id] [INT] NOT NULL,
	[Customer_Id] [INT] NOT NULL,
	[Salesperson_Id] [INT] NOT NULL,
	[Payment_method_Id] [INT] NOT NULL,
	[Date_Id] [INT] NOT NULL,
	[Channel_Id] [INT] NOT NULL,
	[Priority_Id] [INT] NOT NULL,

	[Cost_Price] [DECIMAL] (10,2) NOT NULL,
	[Sale_Price] [DECIMAL] (10,2) NOT NULL,
	[Discount_Amount] [DECIMAL] (10,2) NOT NULL,
	[Finance_Amount] [DECIMAL] (10,2) NOT NULL,
	[Credit_Score] [int] NOT NULL,
	[Cost_of_Repairs] [DECIMAL](10,2) NOT NULL,
	[Total_Sales_per_Employee] [DECIMAL] (10,2) NOT NULL,
	[PC_Market_Price] [DECIMAL] (10,2) NOT NULL,

	FOREIGN KEY (Location_Id) REFERENCES dim_location (Location_Id),
	FOREIGN KEY (Shop_Id) REFERENCES dim_shop (Shop_Id),
	FOREIGN KEY (PC_Id) REFERENCES dim_pc (PC_Id),
	FOREIGN KEY (Spec_Id) REFERENCES dim_specification (Spec_Id),
	FOREIGN KEY (Customer_Id) REFERENCES dim_customer (Customer_Id),
	FOREIGN KEY (Salesperson_Id) REFERENCES dim_salesperson (Salesperson_Id),
	FOREIGN KEY (Payment_method_Id) REFERENCES dim_payment_method (Payment_method_Id),
	FOREIGN KEY (Date_Id) REFERENCES dim_date (Date_Id),
	FOREIGN KEY (Channel_Id) REFERENCES dim_channel (Channel_Id),
	FOREIGN KEY (Priority_Id) REFERENCES dim_priority (Priority_Id),
) 

INSERT INTO [computerstg].[dbo].[fact_pcsales] (
	[Location_id],
	[Shop_Id],
	[PC_Id],
	[Spec_Id],
	[Customer_Id],
	[Salesperson_Id],
	[Payment_method_Id],
	[Date_Id],
	[Channel_Id],
	[Priority_Id],
	[Cost_Price],
	[Sale_Price],
	[Discount_Amount],
	[Finance_Amount],
	[Credit_Score],
	[Cost_of_Repairs],
	[Total_Sales_per_Employee],
	[PC_Market_Price]
)
SELECT 
    dl.location_id,
    ds.shop_id,
    dp.pc_id,
    dspec.spec_id,
    dc.customer_id,
    dsp.salesperson_id,
    dpm.payment_method_id,
    dd.date_id,
    dch.channel_id,
    dpr.priority_id,

    sr.cost_price,
    sr.sale_price,
    sr.discount_amount,
    sr.finance_amount,
    sr.credit_score,
    sr.cost_of_repairs,
    sr.Total_Sales_per_Employee,
    sr.pc_market_price

FROM raw_data sr
-- ✅ LOCATION (composite)
JOIN dim_location dl 
    ON sr.continent = dl.continent
   AND sr.country_or_state = dl.country_or_state
   AND sr.province_or_city = dl.province_or_city

-- ✅ SHOP
JOIN dim_shop ds 
    ON sr.shop_name = ds.shop_name
    AND sr.Shop_Age=ds.Shop_Age

-- ✅ PC (composite)
JOIN dim_pc dp 
    ON sr.PC_Make = dp.PC_Manufacturer
   AND sr.pc_model = dp.pc_model

-- ✅ SPECIFICATIONS (composite)
JOIN dim_specifications dspec
    ON sr.storage_type = dspec.storage_type
   AND sr.ram = dspec.ram
   AND sr.storage_capacity = dspec.storage_capacity

-- ✅ CUSTOMER (composite)
JOIN dim_customer dc
    ON sr.Customer_Name = dc.full_name
   AND sr.Customer_Surname = dc.Surname
   AND sr.Customer_Email_Address = dc.email_address
   AND sr.Customer_Contact_Number = dc.Contact_Number

-- ✅ SALESPERSON
JOIN dim_salesperson dsp
    ON sr.Sales_Person_Name = dsp.salesperson_name
   AND sr.Sales_Person_Department = dsp.salesperson_department

-- ✅ PAYMENT
JOIN dim_payment_method dpm
    ON sr.payment_method = dpm.Payment_Method

-- ✅ DATE
JOIN dim_date dd
    ON sr.purchase_date = dd.FullDate


-- ✅ CHANNEL
JOIN dim_channel dch
    ON sr.channel = dch.channel_name

-- ✅ PRIORITY
JOIN dim_priority dpr
    ON sr.priority = dpr.priority_name;
;

SELECT *
FROM [computerstg].[dbo].[fact_pcsales]