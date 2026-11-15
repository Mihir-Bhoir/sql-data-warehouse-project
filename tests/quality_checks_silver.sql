/*
==============================================================================
Quality Checks 
==============================================================================
Script  Purpose:
    This script perform various quality checks for data consistency, accuracy,
    and standardization accross the 'silver' schema. It includes checks for: 
    - Null or duplicate primary keys.
    - Unwanted speces in string fields.
    - Data standardization and consistency.
    - Invaide date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading in Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
==============================================================================
*/
    
-- =============================================================
-- Checking 'silver.crm_cust_info'
-- =============================================================
-- Check for Nulls or Duplicates in Primary Key
-- Expectation:No Result  
SELECT 
cst_id,
COUNT(*)
FROM 
bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

--Check for unwanted spaces
-- Expectation:No Result  crm_cust_info
SELECT 
cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT 
cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);

-- Data Standardization & Consistency  crm_cust_info
FROM bronze.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info;

-- =============================================================
-- Checking 'silver.crm_prd_info'
-- =============================================================
-- Check for Nulls or Duplicates in Primary Key
-- Expectation:No Result bronze.
SELECT 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) >1 OR prd_id IS NULL;


--Check for unwanted spaces
-- Expectation:No Result  bronze.crm_prd_info

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)	

--Check for NULLS or Negative Numbers
-- Expectation:No Result  bronze.crm_prd_info

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standardization & Consistency bronze.crm_prd_info
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;


-- Check for Invalid Date Orders (end date must not be earlier than start date)
-- End Date= Start Date of 'NEXT' Record -1 

SELECT 
prd_id,
prd_key,
prd_nm,
prd_start_dt,
LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS prd_end_dt
FROM bronze.crm_prd_info
WHERE prd_key in ('AC-HE-HL-U509-R', 'AC-HE-HL-U509');

SELECT * FROM silver.crm_prd_info;


-- =============================================================
-- Checking 'silver.crm_sales_details'
-- =============================================================
-- Check for Invalid Dates silver.crm_sales_details
SELECT 
NULLIF(sls_order_dt, 0) AS sls_order_dt
FROM silver.crm_sales_details
WHERE sls_order_dt <= 0        -- Negative number or 0 can't be cast to a date
OR LEN(sls_order_dt) != 8      -- length should be 8 only
OR sls_order_dt > 20500101     -- Outliers for validating boundaries
OR sls_order_dt < 19000101; 
																										 
						
SELECT 
NULLIF(sls_ship_dt, 0) AS sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0        -- Negative number or 0 can't be cast to a date
OR LEN(sls_ship_dt) != 8      -- length should be 8 only
OR sls_ship_dt > 20500101     -- Outliers for validating boundaries
OR sls_ship_dt < 19000101; 


SELECT 
NULLIF(sls_due_dt, 0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0        -- Negative number or 0 can't be cast to a date
OR LEN(sls_due_dt) != 8      -- length should be 8 only
OR sls_due_dt > 20500101     -- Outliers for validating boundaries
OR sls_due_dt < 19000101;

-- Check for Invalid Dates Orders silver.crm_sales_details
SELECT 
* 
FROM silver.crm_sales_details 
WHERE sls_order_dt > sls_ship_dt OR sls_ship_dt > sls_due_dt;

-- Check Data Consistency: Between Sales, Quantity and Price
-- >> Sales = Quantity * Price
-- >> Values must not be negative, zero or Negative.
-- RULES: If Sales  is Negative, Zero, or NULL, derived it using quantity and price.
--        If Price is zero or NULL, calculate it using Sales and Quantury
--        If Price is Negative, convert it into positive value
SELECT DISTINCT
sls_sales ,
sls_quantity,
sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

SELECT * FROM silver.crm_sales_details


-- =============================================================
-- Checking 'silver.erp_cust_az12'
-- =============================================================
-- Check for Nulls or Duplicates in Primary Key
-- Expectation:No Result bronze.erp_cust_az12

SELECT 
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4,LEN(cid)) 
	 ELSE cid
END AS cid,
bdate,
CASE WHEN bdate > GETDATE() THEN NULL
	 ELSE bdate
END AS bdate,
gen,
CASE WHEN UPPER(TRIM(gen)) = 'F' THEN 'FEMALE'
	 WHEN UPPER(TRIM(gen)) = 'M' THEN 'MALE'
	 WHEN UPPER(TRIM(gen)) = '' or gen = NULL  THEN 'n\a'
	 ELSE gen
END AS gen
FROM bronze.erp_cust_az12;

SELECT 
* 
FROM bronze.crm_cust_info;

SELECT 
*FROM silver.erp_cust_az12;


-- Identify Out-Of-Range Date
SELECT DISTINCT bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1926-01-01' OR bdate > GETDATE()

-- Data Standardization & Consistency
SELECT 
DISTINCT gen
FROM silver.erp_cust_az12

SELECT 
*
FROM bronze.erp_cust_az12

-- =============================================================
-- Checking 'silver.erp_loc_a101'
-- =============================================================
-- Converting primery key into suitable code bronze.erp_loc_a101

SELECT REPLACE(cid, '-', '') AS cid,
cntry,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('United States', 'US', 'USA') THEN 'United Sates'
	 WHEN TRIM(cntry) IS NULL OR TRIM(cntry) = '' THEN 'n\a'
	 ELSE TRIM(cntry)
END AS cntry
FROM bronze.erp_loc_a101;


-- Data Standardization & Consistency

SELECT 
DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

SELECT * FROM silver.crm_prd_info


-- =============================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- =============================================================
-- Checking for bronze.erp_px_cat_g1v2
SELECT 
id,
cat,
subcat,
maintenance
FROM bronze.erp_px_cat_g1v2;

-- Checking unwanted Spaces
SELECT 
id,
cat,
subcat,
maintenance
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance);

-- Data Standardization & Consistency
SELECT DISTINCT maintenance 
FROM bronze.erp_px_cat_g1v2;

SELECT * FROM silver.erp_px_cat_g1v2;
