-- Creating Medallion Architecture in MySQL
-- For representing the Medallion Architecture, 3 separate databases will be created namely Bronze, Silver and Gold.

CREATE DATABASE Bronze;
CREATE DATABASE Silver;
CREATE DATABASE Gold;

-- Now we will be working on Bronze layer where we will be importing the csv files from the source. 
-- Here, I have used the MYSQL Workbench GUI to import the data.

USE Bronze;

SELECT count(*) FROM bronze.crm_cust_info; -- 18446 rows imported successfully via GUI File Import

SELECT count(*) FROM bronze.crm_prd_info; -- 397 rows

-- crm sales Details couldn't be done due to the disabling of LOCAL INline and other security cincerns so used python for importing
CREATE TABLE crm_sales_details(
	sls_ord_num text,
    sls_prd_key TEXT,
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE, 
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);

-- To use infile used the following line of code and went to connection settings to change it.
-- OPT_LOCAL_INFILE=1
SET GLOBAL local_infile = 1;
-- 

CREATE TABLE erp_cust_az12(
CID int,
BDATE date,
GEN TEXT
);

LOAD DATA LOCAL INFILE 'D:\\sql-data-warehouse-project-main\\sql-data-warehouse-project-main\\datasets\\source_erp\\CUST_AZ12.csv'
INTO TABLE erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from erp_cust_az12;

ALTER TABLE erp_cust_az12
MODIFY COLUMN CID TEXT;

truncate table erp_cust_az12;

CREATE TABLE erp_loc_a101(
CID TEXT,
CNTRY TEXT
);

LOAD DATA LOCAL INFILE 'D:\\sql-data-warehouse-project-main\\sql-data-warehouse-project-main\\datasets\\source_erp\\LOC_A101.csv'
INTO TABLE erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE PX_CAT_G1V2(
	ID TEXT,
    CAT TEXT,
    SUBCAT TEXT,
    MAINTENANCE TEXT
);

ALTER TABLE PX_CAT_G1V2
RENAME TO erp_px_cat_giv2;

LOAD DATA LOCAL INFILE 'D:\\sql-data-warehouse-project-main\\sql-data-warehouse-project-main\\datasets\\source_erp\\PX_CAT_G1V2.csv'
INTO TABLE erp_px_cat_giv2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from erp_px_cat_giv2;

-- THE BRONZE LAYER IS NOW FILLED ----
-- THIS WILL ACT AS SOURCE OF TRUTH ---



