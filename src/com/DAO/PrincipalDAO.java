package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Models.Principal;

public class PrincipalDAO {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?characterEncoding=latin1","root","Shrutika");
			System.out.println("Connection created !!");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static int insert(Principal s) {
		int status = 0;
		try {
			Connection con = PrincipalDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into principal(principal_id,fname,lname,dob,gender,email,phone_no,address,passwd,login_id) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, s.getPrincipal_id());
			ps.setString(2, s.getFname());
			ps.setString(3, s.getLname());
			ps.setString(4, s.getDob());
			ps.setString(5, s.getGender());
			ps.setString(6, s.getEmail());
			ps.setString(7, s.getPhone_no());
			ps.setString(8, s.getAddress());
			ps.setString(9, s.getPasswd());
			ps.setString(10, s.getLogin_id());
			status = ps.executeUpdate();
			System.out.println("Records Inserted!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int update(Principal s) {
		int status =0 ;
		try {
			Connection con =PrincipalDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set principal_id=?,fname=?,lname=?,dob=?,gender=?,email=?,phone_no=?,address=?,passwd=?,login_id=?");
			ps.setInt(1, s.getPrincipal_id());
			ps.setString(2, s.getFname());
			ps.setString(3, s.getLname());
			ps.setString(4, s.getDob());
			ps.setString(5, s.getGender());
			ps.setString(6, s.getEmail());
			ps.setString(7, s.getPhone_no());
			ps.setString(8, s.getAddress());
			ps.setString(9, s.getPasswd());
			ps.setString(10, s.getLogin_id());
			System.out.println("Records Updated!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int delete(int principal_id) {
		int status = 0;
		try {
			Connection con = PrincipalDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from principal where principal_id=?");
			ps.setInt(1, principal_id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static Principal getPrincipalById(int principal_id) {
		Principal s = new Principal();
		try {
			Connection con = PrincipalDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from principal where principal_id=?");
			ps.setInt(1, principal_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				s.setPrincipal_id(rs.getInt(1));
				s.setFname(rs.getString(2));
				s.setLname(rs.getString(3));
				s.setDob(rs.getString(4));
				s.setGender(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setPhone_no(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setPasswd(rs.getString(9));
				s.setLogin_id(rs.getString(10));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public static Principal getPrincipalByLoginId(String principal_id) {
		Principal s = new Principal();
		try {
			Connection con = PrincipalDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from principal where login_id=?");
			ps.setString(1, principal_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				s.setPrincipal_id(rs.getInt(1));
				s.setFname(rs.getString(2));
				s.setLname(rs.getString(3));
				s.setDob(rs.getString(4));
				s.setGender(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setPhone_no(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setPasswd(rs.getString(9));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public static List<Principal> getAllPrincipals(){
		List<Principal> list = new ArrayList<Principal>();
		try {
			Connection con = PrincipalDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from principal");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Principal s = new Principal();
				s.setPrincipal_id(rs.getInt(1));
				s.setFname(rs.getString(2));
				s.setLname(rs.getString(3));
				s.setDob(rs.getString(4));
				s.setGender(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setPhone_no(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setPasswd(rs.getString(9));
				s.setLogin_id(rs.getString(10));
				list.add(s);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
















