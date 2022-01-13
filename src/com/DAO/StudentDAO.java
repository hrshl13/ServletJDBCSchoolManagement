package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Models.Student;

public class StudentDAO {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?characterEncoding=latin1","root","Shrutika");
			System.out.println("Connection Created");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	public static int insert(Student s) {
		int status=0;
		try {
			Connection con = StudentDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into student(student_id,fname,lname,dob,gender,email,phone_no,address,passwd,standard,result,admission) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, s.getStudent_id());
			ps.setString(2, s.getFname());
			ps.setString(3, s.getLname());
			ps.setString(4, s.getDob());
			ps.setString(5, s.getGender());
			ps.setString(6, s.getEmail());
			ps.setString(7, s.getPhone_no());
			ps.setString(8, s.getAddress());
			ps.setString(9, s.getPasswd());
			ps.setString(10, s.getStandard());
			ps.setString(11, s.getResult());
			ps.setString(12, s.getAdmission_date());
			status = ps.executeUpdate();
			System.out.println("Records Inserted !!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int update(Student s) {
		int status =0;
		try {
			Connection con = StudentDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set student_id=?,fname=?,lname=?,dob=?,gender=?,email=?,phone_no=?,address=?,passwd=?,standard=?,result=?,admission=?");
			ps.setInt(1, s.getStudent_id());
			ps.setString(2, s.getFname());
			ps.setString(3, s.getLname());
			ps.setString(4, s.getDob());
			ps.setString(5, s.getGender());
			ps.setString(6, s.getEmail());
			ps.setString(7, s.getPhone_no());
			ps.setString(8, s.getAddress());
			ps.setString(9, s.getPasswd());
			ps.setString(10, s.getStandard());
			ps.setString(11, s.getResult());
			ps.setString(12, s.getAdmission_date());
			status = ps.executeUpdate();
			System.out.println("Records Updated !!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int delete(int student_id) {
		int status = 0;
		try {
			Connection con = StudentDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from student where student_id=?");
			ps.setInt(1, student_id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static Student getStudentById(int student_id) {
		Student s = new Student();
		try {
			Connection con = StudentDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from student where student_id=?");
			ps.setInt(1, student_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				s.setStudent_id(rs.getInt(1));
				s.setFname(rs.getString(2));
				s.setLname(rs.getString(3));
				s.setDob(rs.getString(4));
				s.setGender(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setPhone_no(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setPasswd(rs.getString(9));
				s.setStandard(rs.getString(10));
				s.setResult(rs.getString(11));
				s.setAdmission_date(rs.getString(12));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public static List<Student> getAllStudents(){
		List<Student> list = new ArrayList<Student>();
		try {
			Connection con = StudentDAO.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from student");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Student s = new Student();
				s.setStudent_id(rs.getInt(1));
				s.setFname(rs.getString(2));
				s.setLname(rs.getString(3));
				s.setDob(rs.getString(4));
				s.setGender(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setPhone_no(rs.getString(7));
				s.setAddress(rs.getString(8));
				s.setPasswd(rs.getString(9));
				s.setStandard(rs.getString(10));
				s.setResult(rs.getString(11));
				s.setAdmission_date(rs.getString(12));
				list.add(s);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}













