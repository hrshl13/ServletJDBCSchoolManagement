package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Extras.createCon;
import com.Models.Syllabus;


public class SyllabusDAO {
	
	public static int insert(Syllabus s) {
		int status=0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into syllabus(syllabus_id, subject_id,standard,chapter) values(?,?,?,?)");
			ps.setInt(1, s.getSyllabus_id());
			ps.setInt(2, s.getSubject_id());
			ps.setString(3, s.getStandard());
			ps.setString(4, s.getChapter());
			status = ps.executeUpdate();
			System.out.println("Records Inserted!");
			con.close();		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static int update(Syllabus s) {
		int status=0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("Update syllabus set syllabus_id=?, subject_id=? ,standard=?, chapter=?"); 
			ps.setInt(1, s.getSyllabus_id());
			ps.setInt(2, s.getSubject_id());
			ps.setString(3, s.getStandard());
			ps.setString(4, s.getChapter());
			status = ps.executeUpdate();
			System.out.println("Records Updated!");
			con.close();		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static int delete(int syllabus_id) {
		int status=0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("Delete from syllabus where syllabus_id=?"); 
			ps.setInt(1, syllabus_id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static Syllabus getSyllabusById(int syllabus_id) {
		Syllabus s = new Syllabus();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from syllabus where syllabus_id=?");
			ps.setInt(1, syllabus_id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setSyllabus_id(rs.getInt(1));
				s.setSubject_id(rs.getInt(2));
				s.setStandard(rs.getString(3));
				s.setChapter(rs.getString(4));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public static Syllabus getSyllabusBySubject(int id) {
		Syllabus s = new Syllabus();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from syllabus where subject_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setSyllabus_id(rs.getInt(1));
				s.setSubject_id(rs.getInt(2));
				s.setStandard(rs.getString(3));
				s.setChapter(rs.getString(4));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public static List<Syllabus> getAllSyllabus(){
		List<Syllabus> list = new ArrayList<Syllabus>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from syllabus");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Syllabus s = new Syllabus(); 
				s.setSyllabus_id(rs.getInt(1));
				s.setSubject_id(rs.getInt(2));
				s.setStandard(rs.getString(3));
				s.setChapter(rs.getString(4));
				list.add(s);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}		

}

















