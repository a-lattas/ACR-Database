/*

Athens Car Rental Database Project
@author Lattas Alexandros
		Katsigiannis Fotis
@date January 2015

Java1.java
A Java Application that connects to the database, 
receives input of a rental code and deletes that rental.

*/

import java.io.*;
import java.text.*;
import java.util.*;
import java.sql.*;

public class Java1 {
	
	public static void main(String[] args) {
		
		int code;
		String url = "jdbc:odbc:4040"
		Connection dbcon;
		Statement stmt;
		
		Scanner input = new Scanner(System.in);
		System.out.print("Insert Rental Code:");
		code = input.nextInt();
		
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		} catch (java.lang.ClassNotFoundExeption e) {
			System.out.print("ClassNotFoundExeption: ");
			System.out.println(e.getMessage());
		}
		
		try {
			dbcon = DriveManager.getConnection(url,/*Database*/"",/*Password*/"",);
			stmt = dbcon.createStatement();
			/* Deletes data only in Rental */
			String delR = "DELETE FROM Rental WHERE rental_code = " + (String) code;
			/* If we want to delete data from Rental's Connection: */
			/* from here... */
			String delRf = "DELETE FROM Rented_from WHERE rental_code = " + (String) code;
			String delRt = "DELETE FROM Return_to WHERE rental_code = " + (String) code;
			String delRs = "DELETE FROM Rents WHERE rental_code = " + (String) code;
			String delRo = "DELETE FROM Rental_of WHERE rental_code = " + (String) code;
			String delPo = "DELETE FROM Payment_of WHERe rental_code = " + (String) code;
			
			stmt.executeUpdate(delRf);
			stmt.executeUpdate(delRt);
			stmt.executeUpdate(delRs);
			stmt.executeUpdate(delRo);
			stmt.executeUpdate(delPo);
			/* ... to here */
			/* Deletes data only in Rental */
			stmt.executeUpdate(delR);
			
			stmt.close();
			dbcon.close();
			
		} catch (SQLException e) {
			System.out.print("SQLException: ");
			System.out.println(e.getMessage());
		}
		
	}
}