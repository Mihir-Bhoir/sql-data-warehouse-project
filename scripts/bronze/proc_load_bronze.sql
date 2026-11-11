/* 
=====================================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=====================================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema  from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading the data.
    - Uses the 'BULK INSERT' command to load the data csv files to bronze tables.

Parameters:
    None.
  This store procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
=====================================================================================================
*/
-- Bulk Insert into crm_cust_info table

EXEC bronze.load_bronze;  -- Save frequently used SQL code in stored procedure in database 

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE()
		PRINT '==============================================';
		PRINT 'Loading the bronze layer';
		PRINT '==============================================';

		PRINT '----------------------------------------------';
		PRINT 'Loading the CRM Tables';
		PRINT '----------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating the table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;-- To avoiding duplicate data run togather (1st TRUNCATE then INSERT)
	
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info 
		FROM 'C:\Users\mihir bhoir\OneDrive\Desktop\SQL Server\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------'

		-- QUALITY CHECK: Check that the data has not shifted and is in the correct columns.

		-- Bulk Insert into crm_prd_info table
		SET @start_time = GETDATE();
		PRINT '>> Truncating the table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\mihir bhoir\OneDrive\Desktop\SQL Server\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		-- Bulk Insert into crm_sales_details table
		SET @start_time = GETDATE();
		PRINT '>> Truncating the table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_sales_details;


		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\mihir bhoir\OneDrive\Desktop\SQL Server\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT ' Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds'

		-- Bulk Insert into erp_cust_az12 table

		PRINT '----------------------------------------------';
		PRINT 'Loading the ERP Tables';
		PRINT '----------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating the table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\mihir bhoir\OneDrive\Desktop\SQL Server\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT ' Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds'

		-- Bulk Insert into erp_loc_a101 table

		SET @start_time = GETDATE()
		PRINT '>> Truncating the table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\mihir bhoir\OneDrive\Desktop\SQL Server\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT ' Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds'
	
		-- Bulk Insert into erp_px_cat_g1v2 table

		SET @start_time = GETDATE()
		PRINT '>> Truncating the table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\mihir bhoir\OneDrive\Desktop\SQL Server\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT ' Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '--------------------------------'

		SET @batch_end_time = GETDATE()
		PRINT '=============================================================='
		PRINT 'Loading Bronze Layer is Completed';
		PRINT ' - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=============================================================='

	END TRY              -- SQL run the TRY block, and if it fails, it runs the CATCH block to handle the error.

	BEGIN CATCH
		PRINT '================================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '================================================='

	END CATCH
END
