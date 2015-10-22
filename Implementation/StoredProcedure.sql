/*

Athens Car Rental Database Project
@author Lattas Alexandros
		Katsigiannis Fotis
@date January 2015

Stored Procedure.sql
		
A stored procedure that for a given customer code 
prints his data from the ACR Database Project.

*/

/* DROP PROCEDURE er_1*/

CREATE PROCEDURE ACR_SP
	(@code INT)
AS
BEGIN

SET NOCOUNT ON;

IF @code IN (SELECT Co.cust_code
				FROM Corporational Co)
BEGIN
SELECT C.*, Co.tax_id_num, Co.discount_percentage
FROM Customer C, Corporational Co
WHERE C.cust_code = Co.cust_code
	AND C.cust_code = @code
END

IF @code IN (SELECT S.cust_code
				FROM Simple S)
BEGIN
SELECT C.*, S.date_of_birth
FROM Customer C, Simple S
WHERE C.cust_code = S.cust_code
	AND C.cust_code = @code
END
END

/* EXECUTE ACR_SP @code = 1 */
