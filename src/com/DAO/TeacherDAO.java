package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Extras.createCon;
import com.Models.Student;
import com.Models.Teacher;

public class TeacherDAO {
	private static final String INSERT_teacher_SQL = "INSERT INTO faculty(fname,lname,dob,gender,email,phone_no, address, subject_id, passwd, login_id) VALUES (?, ?,?,?,?,?,?,(select subject_id from subject where subject_id=?),?,?);";
    private static final String SELECT_teacher_BY_Login_ID = "select * from faculty where login_id =?;";
    private static final String SELECT_teacher_BY_Faculty_ID = "select * from faculty where faculty_id =?;";
    private static final String SELECT_ALL_teacher = "select * from faculty;";
    private static final String DELETE_teacher_SQL = "delete from faculty where faculty_id = ?;";
    private static final String UPDATE_teacher_SQL = "update faculty set fname=? ,lname=? ,dob=? ,gender=? ,email=? ,phone_no=? ,address=? ,subject_id=? ,passwd=? where faculty_id = ?;";
    
    public static int insertTeacher(Teacher s) throws SQLException {
    	int status = 0;
        // try-with-resource statement will auto close the connection.
        try{
        	Connection con = createCon.getConnection();
        	PreparedStatement ps = con.prepareStatement(INSERT_teacher_SQL);
            ps.setString(1, s.getFname());
            ps.setString(2, s.getLname());
            ps.setString(3, s.getDob());
            ps.setString(4, s.getGender());
            ps.setString(5, s.getEmail());
            ps.setString(6, s.getPhone_no());
            ps.setString(7, s.getAddress());
            ps.setInt(8, s.getSubject_id());
            ps.setString(9, s.getPasswd());
            ps.setString(10, s.getLogin_id());
            status = ps.executeUpdate();
            System.out.println("Records Inserted!");
            con.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    public static int updateTeacher(Teacher s) {
    	int status=0;
    		try {
    			Connection con = createCon.getConnection();
    			PreparedStatement ps = con.prepareStatement(UPDATE_teacher_SQL);
    			ps.setString(1, s.getFname());
                ps.setString(2, s.getLname());
                ps.setString(3, s.getDob());
                ps.setString(4, s.getGender());
                ps.setString(5, s.getEmail());
                ps.setString(6, s.getPhone_no());
                ps.setString(7, s.getAddress());
                ps.setInt(8, s.getSubject_id());
                ps.setString(9, s.getPasswd());
                ps.setInt(10, s.getFaculty_id());
    			status = ps.executeUpdate();
    			System.out.println("Records Updated!");
    			con.close();
    		} catch (SQLException e) {
                printSQLException(e);
            }
    		return status;
    	}
    public static int deleteTeacher(int id) {
		int status=0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE_teacher_SQL);
			ps.setInt(1, id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
        }
		return status;
	}
	public static Teacher getTeacherById(int id) {
		Teacher s = new Teacher();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_teacher_BY_Faculty_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setLogin_id(rs.getString("login_id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setDob(rs.getString("dob"));
				s.setGender(rs.getString("gender"));
				s.setEmail(rs.getString("email"));
				s.setPhone_no(rs.getString("phone_no"));
				s.setAddress(rs.getString("address"));
				s.setSubject_id(rs.getInt("subject_id"));
				s.setPasswd(rs.getString("passwd"));
				s.setFaculty_id(rs.getInt("faculty_id"));
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return s;
	}
	public static Teacher getTeacherByLoginId(String id) {
		Teacher s = new Teacher();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE login_id = ?;");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setFaculty_id(rs.getInt("faculty_id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setDob(rs.getString("dob"));
				s.setGender(rs.getString("gender"));
				s.setEmail(rs.getString("email"));
				s.setPhone_no(rs.getString("phone_no"));
				s.setAddress(rs.getString("address"));
				s.setSubject_id(rs.getInt("subject_id"));
				s.setPasswd(rs.getString("passwd"));
				s.setLogin_id(rs.getString("login_id"));
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return s;
	}
	public static List<Teacher> getAllTeachers(){
		List<Teacher> list = new ArrayList<Teacher>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_teacher);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Teacher s= new Teacher();
				s.setFaculty_id(rs.getInt("faculty_id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setDob(rs.getString("dob"));
				s.setGender(rs.getString("gender"));
				s.setEmail(rs.getString("email"));
				s.setPhone_no(rs.getString("phone_no"));
				s.setAddress(rs.getString("address"));
				s.setSubject_id(rs.getInt("subject_id"));
				s.setPasswd(rs.getString("passwd"));
				s.setLogin_id(rs.getString("login_id"));
				list.add(s);
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }	
		return list;
	}
	
	public static List<Teacher> getTeacherBySubjectId(int id) {
		List<Teacher> list = new ArrayList<Teacher>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from faculty where subject_id=?;");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Teacher s = new Teacher(); 
				s.setFaculty_id(rs.getInt("faculty_id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setDob(rs.getString("dob"));
				s.setGender(rs.getString("gender"));
				s.setEmail(rs.getString("email"));
				s.setPhone_no(rs.getString("phone_no"));
				s.setAddress(rs.getString("address"));
				s.setSubject_id(rs.getInt("subject_id"));
				s.setPasswd(rs.getString("passwd"));
				s.setLogin_id(rs.getString("login_id"));
				list.add(s);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	
    private static void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
