package com.DAO;
import java.sql.Connection;
import java.sql.DriverManager;

import com.Models.Assignment;
public class AssignmentsDAO {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?characterEncoding=latin1","sqluser","password");
			System.out.println("Connection Created");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}

}
