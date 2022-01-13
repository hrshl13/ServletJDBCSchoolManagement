package com.Extras;

import java.sql.Connection;
import java.sql.DriverManager;

public class createCon {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management?characterEncoding=latin1","qltyDbg","kltpwd");
			System.out.println("Connection Created");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
