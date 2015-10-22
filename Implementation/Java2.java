/*

Athens Car Rental Database Project
@author Lattas Alexandros
		Katsigiannis Fotis
@date January 2015

Java2.java
A Java Application that connects to the database,
 receives input of a customer code and prints all of 
 his rentals in 2005 and their data, line by line.

*/


import java.io.*;
import java.text.*;
import java.util.*;
import java.sql.*;

public class Java2 {

	public static void main(String[] args) {

		int code;
		String url = "jdbc:odbc:4040";
		Connection dbcon ;
		Statement stmt;
  		ResultSet rs;
		Scanner input = new Scanner(System.in);
		System.out.print("Insert Customer Code");
		code = input.nextInt();

		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.print("ClassNotFoundException: ");
			System.out.println(e.getMessage());
		}

		try {
			dbcon = DriverManager.getConnection(url,/*Database*/"",/*Password*/"");
			stmt = dbcon.createStatement();
			rs = stmt.executeQuery("SELECT R.rental_code, Rf.rental_date, Rt.return_date,
										Lf.street, Lf.street_num, Lf.postal_code, Lf.city,
										Lt.street, Lt.street_num, Lt.postal_code, Lt.city,
										R.rental_value

									FROM Rental R, Rented_from Rf, Return_to Rt, Location Lf,
										Location Lt, Customer C, Rents Rs

									WHERE C.cust_code = Rs.cust_code
										AND Rs.rental_code = R.rental_code
										AND Rf.rental_code = R.rental_code
										AND Rt.rental_code = R.rental_code
										AND Rt.loc_code = Lt.loc_code
										AND Rf.loc_code = Lf.loc_code
										AND YEAR(Rf.rental_date) = 2005
										AND C.cust_code = @code");

			while (rs.next()) {
				System.out.println(
					"Rental: " + rs.getString(1) +
					", Rental Date: " + rs.getString(2) +
					", Return Date: " + rs.getString(3) +
					", Rented from: " + rs.getString(4) + " " + rs.getString(5)
					+ " "+ rs.getString(6) + " " + rs.getString(7) +
					", Returned to: " + rs.getString(8) + " " + rs.getString(9)
					+ " "+ rs.getString(10) + " " + rs.getString(11) +
					", Rental Value: " + rs.getString(12) + "."
					);
			}

			rs.close();
			stmt.close();
			dbcon.close();

		} catch(SQLException e) {
			System.out.print("SQLException: ");
			System.out.println(e.getMessage());
		}
	}
}
