/*

Athens Car Rental Database Project
@author Lattas Alexandros
		Katsigiannis Fotis
@date January 2015

T-SQL.sql
		
A T-SQL Application that prints line 
by line information about the cars of ACR.

*/

DECLARE @VIN AS CHAR(17);
DECLARE @Company AS VARCHAR(15);
DECLARE @Model AS VARCHAR(15);
DECLARE @DOP AS DATETIME;

DECLARE @car_cursor AS CURSOR;
SET @car_cursor = CURSOR FOR 
	SELECT * 
	FROM Car;

OPEN @car_cursor;

FETCH NEXT FROM @car_cursor
	INTO @VIN, @Company, @Model, @DOP;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'VIN = ' + @VIN
		+ ', Company = ' + @Company 
		+ ', Model = ' + @Model 
		+ ', Date of Purchase = ' + CAST(@DOP AS VARCHAR(30));
	FETCH NEXT FROM @car_cursor
	INTO @VIN, @Company, @Model, @DOP;
END

CLOSE @car_cursor;
DEALLOCATE @car_cursor