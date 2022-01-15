package com.DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Extras.createCon;
import com.Models.Subject;

public class SubjectDAO {
	private static final String INSERT_Sub_SQL = "INSERT INTO subject(subject_name, faculty_id) VALUES (?, ?);";
    private static final String SELECT_Sub_BY_ID = "select subject_id, subject_name, faculty_id from subject where subject_id =?;";
    private static final String SELECT_ALL_Sub = "select * from subject;";
    private static final String DELETE_Sub_SQL = "delete from subject where subject_id = ?;";
    private static final String UPDATE_Sub_SQL = "update subject set subject_name = ?,faculty_id = ? where subject_id = ?;";
    
    public int insertSubject(Subject s) throws SQLException {
    	int status = 0;
        // try-with-resource statement will auto close the connection.
        try{
        	Connection con = createCon.getConnection();
        	PreparedStatement ps = con.prepareStatement(INSERT_Sub_SQL);
            ps.setString(1, s.getSubject_name());
            ps.setInt(2, s.getFaculty_id());
            status = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    public static int updateSubject(Subject s) {
    	int status=0;
    		try {
    			Connection con = createCon.getConnection();
    			PreparedStatement ps = con.prepareStatement(UPDATE_Sub_SQL);
    			ps.setString(1, s.getSubject_name());
    			ps.setInt(2, s.getFaculty_id());
    			ps.setInt(3, s.getSubject_id());
    			status = ps.executeUpdate();
    			System.out.println("Records Updated!");
    			con.close();
    		} catch (SQLException e) {
                printSQLException(e);
            }
    		return status;
    	}
    public static int deleteSubject(int id) {
		int status=0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE_Sub_SQL);
			ps.setInt(1, id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return status;
	}
	public static Subject getSubjectById(int id) {
		Subject s = new Subject();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_Sub_BY_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setSubject_id(rs.getInt(1));
				s.setSubject_name(rs.getString(2));			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return s;
	}
	public static List<Subject> getAllSubjects(){
		List<Subject> list = new ArrayList<Subject>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_Sub);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s= new Subject();
				s.setSubject_id(rs.getInt(1));
				s.setSubject_name(rs.getString(2));
				list.add(s);
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
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
