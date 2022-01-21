package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Extras.createCon;
import com.Models.Student;
import com.Models.Syllabus;

public class StudentDAO {
	public static int insert(Student s) {
		int status=0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into student(student_id,fname,lname,dob,gender,email,phone_no,address,passwd,standard,result,admission_date,login_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			ps.setString(13, s.getLogin_id());
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
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set fname=?,lname=?,dob=?,gender=?,email=?,phone_no=?,address=?,standard=?,result=? where student_id=?;");
			ps.setString(1, s.getFname());
			ps.setString(2, s.getLname());
			ps.setString(3, s.getDob());
			ps.setString(4, s.getGender());
			ps.setString(5, s.getEmail());
			ps.setString(6, s.getPhone_no());
			ps.setString(7, s.getAddress());
			ps.setString(8, s.getStandard());
			ps.setString(9, s.getResult());
			ps.setInt(10, s.getStudent_id());
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
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from student where student_id=?;");
			ps.setInt(1, student_id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static Student getStudentByLoginId(String student_id) {
		Student s = new Student();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from student where login_id=?;");
			ps.setString(1, student_id);
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
				s.setLogin_id(rs.getString("login_id"));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public static Student getStudentById(int student_id) {
		Student s = new Student();
		try {
			Connection con = createCon.getConnection();
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
				s.setLogin_id(rs.getString(13));
				
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public static List<Student> getStudentByStandard(String Std) {
		List<Student> list = new ArrayList<Student>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from student where standard=?");
			ps.setString(1, Std);
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
				s.setLogin_id(rs.getString(13));
				list.add(s);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	public static List<Student> getAllStudents(){
		List<Student> list = new ArrayList<Student>();
		try {
			Connection con = createCon.getConnection();
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
				s.setLogin_id(rs.getString(13));
				list.add(s);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}













