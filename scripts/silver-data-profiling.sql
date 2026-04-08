-- EDA/Data Profiling ---

SELECT * FROM crm_cust_info;
-- Customer Information -- Keys :- cst_id, cst_key (AW00011000)

SELECT * FROM crm_prd_info;
-- Product Information -- Keys:- prd_id, prd_key (CO-RF-FR-R92B-58)

SELECT * FROM crm_sales_details;
-- Sales Information -- Keys:- sales_ord_num(SO43697), sls_prd_key(BK-R93R-62), sls_cust_id(21768)

SELECT * FROM erp_cust_az12; -- kEY CID(NASAW00011000) , This table gives additional customer info - birthday and gender

SELECT * FROM erp_loc_a101; -- kEY CID(AW-00011000), Location of customer ie country

SELECT * FROM erp_px_cat_giv2; -- key ID(AC_BR) ,Product category, subcategory, maintenance 

-- Checking Number of Rows
SELECT COUNT(*) FROM erp_px_cat_giv2; -- 37
SELECT COUNT(*) FROM erp_loc_a101; -- 18484
SELECT COUNT(*) FROM erp_cust_az12; -- 18484
SELECT COUNT(*) FROM crm_sales_details; -- 60398
SELECT COUNT(*) FROM crm_prd_info; -- 397
SELECT COUNT(*) FROM crm_cust_info; -- 18446

-- Checking missing values
SELECT * FROM crm_cust_info where cst_create_date is null; -- no nulls

-- Checking missing values
SELECT * FROM crm_cust_info 
where cst_firstname is null or cst_firstname='' or cst_firstname='0'; -- 29433 is blank space

SELECT count(*) FROM crm_cust_info 
where cst_gndr is null or cst_gndr='' or cst_gndr='0'; -- 4555 has no values

-- Checking Distinct Values for Categories Like Gender, Marital Status
SELECT distinct cst_gndr FROM crm_cust_info; -- M,F and Blank
SELECT distinct cst_marital_status FROM crm_cust_info; -- M,S

-- identify duplicates
SELECT cst_id, count(*) 
FROM crm_cust_info 
group by cst_id 
having count(*) >1; -- cst_id 29433 2 counts , need to delete it

-- suspicious firstnam and lastname duplicates ??
SELECT cst_firstname, cst_lastname, cst_create_date, cst_marital_status, count(*) 
FROM crm_cust_info 
group by cst_firstname, cst_lastname, cst_create_date, cst_marital_status
having count(*) >1;

-- 
SELECT * FROM crm_cust_info; -- need to trim fname, lastname there are whitespaces trailing and preceding








