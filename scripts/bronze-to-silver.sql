-- BRONZE TO SILVER -- 

USE silver;

-- Creating tables in sILVER FROM BRONZE

CREATE TABLE crm_cust_info AS
SELECT *
FROM bronze.crm_cust_info;

CREATE TABLE crm_prd_info AS
SELECT *
FROM bronze.crm_prd_info;

CREATE TABLE crm_sales_details AS
SELECT *
FROM bronze.crm_sales_details;

CREATE TABLE erp_cust_az12 AS
SELECT *
FROM bronze.erp_cust_az12;

CREATE TABLE erp_loc_a101 AS
SELECT *
FROM bronze.erp_loc_a101;

CREATE TABLE erp_px_cat_giv2 AS
SELECT *
FROM bronze.erp_px_cat_giv2;

-- COPY TABLES FROM BRONZE LAYER DONE --


