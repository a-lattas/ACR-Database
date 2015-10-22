/*

Athens Car Rental Database Project
@author Lattas Alexandros
		Katsigiannis Fotis
@date January 2015

Queries.sql
		
this file handles the 14 Queries for the
demonstration of the ACR Database Project.

*/

/* 1 */
/* Show a customer list with their codes, 
	surnames, addresses and numbers */

SELECT cust_code, cust_surname, city, street, 
		street_number, postal_code, phone_number
FROM Customer

/* 2 */
/* For every rental, show its code and its 
	duration, if its value is bigger than €200. */

SELECT R.rental_code, R1.rental_date, R2.return_date
FROM Rented_from R1, Return_to R2, Rental R
WHERE R.rental_value > 200.00 
		AND R1.rental_code = R.rental_code 
		AND R2.rental_code = R.rental_code

/* 3 */
/* For every customer, show his code,
	 name, surname, number and his rental codes. */

SELECT C.cust_code, C.cust_name, C.cust_surname, 
		C.phone_number, R.rental_code
FROM Customer C, Rental R, Rents Rs
WHERE C.cust_code = Rs.cust_code AND R.rental_code = Rs.rental_code
ORDER BY C.cust_code

/* 4 */
/* Show name, surname and number of customers who had a car 
	on 23/9/2010 and live in the region with code “10025”. */

SELECT C.cust_name, C.cust_surname, C.phone_number
FROM Customer C, Region R, Rented_from Rf, Return_to Rt, Rental Re, Lives_in L, Rents Rs
WHERE R.code = 10025 AND R.code = L.code AND L.cust_code = C.cust_code AND /* 10025 */
		Re.rental_code = Rs.rental_code AND Rs.cust_code = C.cust_code /* pelatis enoikiasi */
		AND Re.rental_code = Rf.rental_code AND Re.rental_code = Rt.rental_code/* hmerominies */
		AND Rf.rental_date < '20100923 00:00:00 AM' AND Rt.return_date > '20100923 00:00:00 AM' /*imera*/

/* 5 */
/* Decrease value of rentals by 5% */

UPDATE Rental
	SET rental_value = rental_value * 0.95

/* 6 */
/* Show for every month of 2010 the sum and average of payments. */

SELECT MONTH(P.date) Months, AVG(P.amount) Average, SUM(P.amount) Total
FROM Payment P
GROUP BY MONTH(P.date)

/* 7 */
/* Show the total value of rentals per category and region. */

SELECT Ct.cat_name, Rg.region_name, SUM(R.rental_value) as Total_Amount
FROM Category Ct, Region Rg, Rental R, Rental_of Rf, Belongs_to Bt, 
	Car Cr, Rents Rs, Customer C, Lives_in Li
WHERE Ct.cat_code = Bt.cat_code
AND Bt.VIN = Cr.VIN
AND Cr.VIN = Rf.VIN
AND Rf.rental_code = R.rental_code
AND Rs.rental_code = R.rental_code
AND Rs.cust_code = C.cust_code
AND C.cust_code = Li.cust_code
AND Li.code = Rg.code
GROUP BY Ct.cat_name, Rg.region_name

/* 8 */
/* Show the code of the customers who had for June 2010 more 
	than 4 rentals if their average value is more than €150. */

SELECT C0.cust_code
FROM Customer C0
WHERE C0.cust_code IN (
	SELECT C.cust_code
	FROM Customer C, Rental R, Rents Rs, Rented_from Rf
	WHERE R.rental_code = Rs.rental_code
	AND Rs.cust_code = C.cust_code
	AND R.rental_code = Rf.rental_code
	AND MONTH(Rf.rental_date) = 6
	AND YEAR(Rf.rental_date) = 2010
	GROUP BY C.cust_code
	HAVING AVG(R.rental_value) > 150 AND COUNT(R.rental_code) > 4
	)

/* 9 */
/* Show the code, name and surname of customers 
	who had a total of payments more than €1500 in April 2010 */

SELECT C0.cust_code, C0.cust_name, C0.cust_surname
FROM Customer C0
WHERE C0.cust_code IN (
	SELECT C.cust_code
	FROM Customer C, Rental R, Rents Rs, Rented_from Rf
	WHERE R.rental_code = Rs.rental_code
	AND Rs.cust_code = C.cust_code
	AND R.rental_code = Rf.rental_code
	AND Month(Rf.rental_date) = 4
	AND YEAR(Rf.rental_date) = 2010
	GROUP BY C.cust_code
	HAVING SUM(R.rental_value) > 1500
	)

/* 10 */
/* For every category, show its total rental value as a 
	percentage of the total value of all categories. */
	
DROP VIEW Cat_total
DROP VIEW Total

GO
CREATE VIEW Cat_total (cat_name, S_amount) AS
	SELECT C.cat_name, SUM(R.rental_value)
	FROM Car Cr, Category C, Belongs_to Bt, Rental R, Rental_of Rf
	WHERE C.cat_code = Bt.cat_code
	AND Bt.VIN = Cr.VIN
	AND Cr.VIN = Rf.VIN
	AND Rf.rental_code = R.rental_code
	GROUP BY cat_name

GO
CREATE VIEW Total (S_total) AS
	SELECT SUM(R.rental_value)
	FROM Rental R

GO
SELECT C.cat_name, CAST(C.S_amount AS FLOAT)/CAST(T.S_total AS FLOAT) AS Percentage
FROM Cat_total C, Total T

/* 11*/
/* For every month of 2010 and 2011, 
	compare their total payments as a percentage. */

DROP VIEW SUM_monthly_value_2010
DROP VIEW SUM_monthly_value_2009

GO
CREATE VIEW SUM_monthly_value_2010 (Month_of_2010, amount) AS
	SELECT MONTH(P.date), SUM(P.amount)
	FROM Payment P
	WHERE YEAR(P.date) = 2010
	GROUP BY MONTH(P.date)


GO
CREATE VIEW SUM_monthly_value_2009 (Month_of_2009, amount) AS
	SELECT MONTH(P.date), SUM(P.amount)
	FROM Payment P
	WHERE YEAR(P.date) = 2009
	GROUP BY MONTH(P.date)

GO
SELECT Smv10.Month_of_2010, CAST(Smv10.amount AS FLOAT)/CAST(Smv9.amount AS FLOAT) AS Percentage
FROM SUM_monthly_value_2010 Smv10, SUM_monthly_value_2009 Smv9
WHERE Smv10.Month_of_2010 = Smv9.Month_of_2009

/* 12 */
/* Show the codes of the regions who had an 
	average total rental value bigger than the total average. */

DROP VIEW AVG_regional_rental_value
DROP VIEW AVG_rental_value

GO
CREATE VIEW AVG_rental_value (amount) AS
	SELECT AVG(R.rental_value)
	FROM Rental R

GO
CREATE VIEW AVG_regional_rental_value (amount,code) AS
	SELECT AVG(R.rental_value), Rg.code
	FROM Rental R, Rents Rs, Customer C, Lives_in Li, Region Rg
	WHERE R.rental_code = Rs.rental_code
	AND Rs.cust_code = C.cust_code
	AND Li.cust_code = C.cust_code
	AND Li.code = Rg.code
	GROUP BY Rg.code

GO
SELECT Ra.code
FROM AVG_regional_rental_value Ra, AVG_rental_value A
WHERE Ra.amount > A.amount

/* 13 */
/* For every month, count how many customers have an average rental
	value bigger than the total average value of that month. */

DROP VIEW AVG_monthly_value
DROP VIEW AVG_monthly_value_perCust

GO
CREATE VIEW AVG_monthly_value (Years, Months, amount) AS
	SELECT YEAR(Rf.rental_date), MONTH(Rf.rental_date), AVG(R.rental_value)
	FROM Rented_from Rf, Rental R
	WHERE R.rental_code = Rf.rental_code
	GROUP BY YEAR(Rf.rental_date), MONTH(Rf.rental_date)

GO 
CREATE VIEW AVG_monthly_value_perCust (Years, Months, cust_code, amount) AS
	SELECT YEAR(Rf.rental_date), MONTH(Rf.rental_date), C.cust_code, AVG(R.rental_value)
	FROM Rented_from Rf, Rental R, Rents Rs, Customer C
	WHERE R.rental_code = Rf.rental_code
	AND Rs.rental_code = R.rental_code
	AND Rs.cust_code = C.cust_code
	GROUP BY YEAR(Rf.rental_date), MONTH(Rf.rental_date), C.cust_code 

GO
SELECT Amv.Years , Amv.Months , COUNT(Amvp.cust_code) AS Customers
FROM AVG_monthly_value Amv, AVG_monthly_value_perCust Amvp
WHERE Amv.Years = Amvp.Years
AND Amv.Months = Amv.Months
AND Amvp.amount > Amv.amount
GROUP BY Amv.Years, Amv.Months

/* 14 */
/* For every month of 2010, show the average duration of rentals. */

SELECT MONTH(Rf.rental_date) AS Month_of_2010, AVG(DATEDIFF(DAY, Rf.rental_date, Rt.return_date)) AS AVG_rental_period
FROM Rented_from Rf, Return_to Rt
WHERE Rf.rental_code = Rt.rental_code
AND YEAR(Rf.rental_date) = 2010
GROUP BY MONTH(Rf.rental_date)
