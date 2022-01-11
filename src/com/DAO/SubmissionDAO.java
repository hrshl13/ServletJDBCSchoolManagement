package com.DAO;

import java.sql.*;
import java.util.*;
import com.Models.Submission;

public class SubmissionDAO {
	protected static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management?characterEncoding=latin1","sqluser","password");
			System.out.println("Connection Created");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	private static final String INSERT_Subm_SQL = "INSERT INTO submission(assignment_id, student_id, marks) VALUES (?, ?, ?);";
    private static final String SELECT_Subm_BY_ID = "select submission_id, assignment_id, student_id, marks from subject where submission_id =?;";
    private static final String SELECT_ALL_Subm = "select * from submission;";
    private static final String DELETE_Subm_SQL = "delete from submission where submission_id = ?;";
    private static final String UPDATE_Subm_SQL = "update submission set assignment_id=?, student_id=?, marks=? where submission_id = ?;";
    
    public int insertSubmission(Submission s) throws SQLException {
    	int status = 0;
        // try-with-resource statement will auto close the connection.
        try{
        	Connection con = getConnection();
        	PreparedStatement ps = con.prepareStatement(INSERT_Subm_SQL);
            ps.setInt(1, s.getAssignment_id());
            ps.setInt(2, s.getStudent_id());
            ps.setInt(3, s.getMarks());
            status = ps.executeUpdate();
            System.out.println("Records Inserted!");
            con.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    public static int updateSubmission(Submission s) {
    	int status=0;
    		try {
    			Connection con = getConnection();
    			PreparedStatement ps = con.prepareStatement(UPDATE_Subm_SQL);
    			ps.setInt(1, s.getAssignment_id());
                ps.setInt(2, s.getStudent_id());
                ps.setInt(3, s.getMarks());
    			ps.setInt(4, s.getSubmission_id());
    			status = ps.executeUpdate();
    			System.out.println("Records Updated!");
    			con.close();
    		} catch (SQLException e) {
                printSQLException(e);
            }
    		return status;
    	}
    public static int deleteSubmission(int id) {
		int status=0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE_Subm_SQL);
			ps.setInt(1, id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return status;
	}
	public static Submission getSubmissionById(int id) {
		Submission s = new Submission();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_Subm_BY_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setSubmission_id(rs.getInt(1));
				s.setAssignment_id(rs.getInt(2));
				s.setStudent_id(rs.getInt(3));
				s.setMarks(rs.getInt(4));
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return s;
	}
	public static List<Submission> getAllSubmissions(){
		List<Submission> list = new ArrayList<Submission>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_Subm);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Submission s= new Submission();
				s.setSubmission_id(rs.getInt(1));
				s.setAssignment_id(rs.getInt(2));
				s.setStudent_id(rs.getInt(3));
				s.setMarks(rs.getInt(4));
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
