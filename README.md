# ACR-Database
Athens Car Rental Database

Athens Car Rental is a car renting firm that needs a database from scratch. It has a car fleet in different regions of Athens which rents B2C or B2B. It needs the database to store important information about its cars, its customers, branches, rentals and payments.

Using SQL Server, we firstly analysed the basic information needed to operate such a business in a simple way and created a map of the Tables needed on draw.io, diagram matrices and the Relational Models. Then we created the tables and inserted some information for testing.

Later, to demonstrate some real life functions we created the following 14 SQL Queries:
s input of a customer code and prints all of his rentals in 2005 and their data, line by line.

1. Show a customer list with their codes, surnames, addresses and numbers.
1. For every rental, show its code and its duration, if its value is bigger than €200.
1. For every customer, show his code, name, surname, number and his rental codes.
1. Show name, surname and number of customers who had a car on 23/9/2010 and live in the region with code “10025”.
1. Decrease value of rentals by 5%
1. Show for every month of 2010 the sum and average of payments.
1. Show the total value of rentals per category and region.
1. Show the code of the customers who had for June 2010 more than 4 rentals if their average value is more than €150. 
1. Show the code, name and surname of customers who had a total of payments more than €1500 in April 2010.
1. For every category, show its total rental value as a percentage of the total value of all categories.
1. For every month of 2010 and 2011, compare their total payments as a percentage.
1. Show the codes of the regions who had an average total rental value bigger than the total average.
1. For every month, count how many customers have an average rental value bigger than the total average value of that month.
1. For every month of 2010, show the average duration of rentals.

Also, because a database has more uses than just queries, we also created the following files:

1. A stored procedure that for a given customer code prints his data.
1. A Java Application that connects to the database, receives input of a rental code and deletes that rental.
1. A Java Application that connects to the database, receives input of a customer code and prints all of his rentals in 2005 and their data, line by line.
1. A T-SQL Application that prints line by line information about the cars of ACR.


The above Project was implemented by Lattas Alexander and Fotis Katsigiannis with the guidance of the Professor Mr. Damianos Chatziantoniou.
