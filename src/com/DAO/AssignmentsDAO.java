package com.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Models.Assignment;
import com.Models.Teacher;
public class AssignmentsDAO {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?characterEncoding=latin1","root","Sajet!2345");
			System.out.println("Connection Created");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	private static final String INSERT_assignment_SQL = "INSERT INTO assignment(faculty_id,subject_id,assignment_topic,assignment_desp,submitted) VALUES (?,?,?,?,?);";
    private static final String SELECT_assignment_BY_ID = "select * from assignment where assignment_id =?;";
    private static final String SELECT_ALL_assignment = "select * from assignment;";
    private static final String DELETE_assignment_SQL = "delete from assignment where assignment_id = ?;";
    private static final String UPDATE_assignment_SQL = "update faculty set faculty_id=? ,subject_id=? ,assignment_topic=? ,assignment_desp=? ,submitted=? where assignment_id = ?;";
    
    public int insertAssignment(Assignment ass) throws SQLException {
    	int status = 0;
        // try-with-resource statement will auto close the connection.
        try{
        	Connection con = getConnection();
        	PreparedStatement ps = con.prepareStatement(INSERT_assignment_SQL);
            ps.setInt(1, ass.getFaculty_id());
            ps.setInt(2, ass.getSubject_id());
            ps.setString(3, ass.getAssignment_topic());
            ps.setString(4, ass.getAssignment_desp());
            ps.setInt(5, ass.getSubmitted());
            status = ps.executeUpdate();
            System.out.println("Records Inserted!");
            con.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    public static int updateAssignment(Assignment ass) {
    	int status=0;
    		try {
    			Connection con = getConnection();
    			PreparedStatement ps = con.prepareStatement(UPDATE_assignment_SQL);
    			ps.setInt(1, ass.getFaculty_id());
                ps.setInt(2, ass.getSubject_id());
                ps.setString(3, ass.getAssignment_topic());
                ps.setString(4, ass.getAssignment_desp());
                ps.setInt(5, ass.getSubmitted());
    			status = ps.executeUpdate();
    			System.out.println("Records Updated!");
    			con.close();
    		} catch (SQLException e) {
                printSQLException(e);
            }
    		return status;
    	}
    public static int deleteAssignment(int id) {
		int status=0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE_assignment_SQL);
			ps.setInt(1, id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return status;
	}
	public static Assignment getAssignmentById(int id) {
		Assignment ass = new Assignment();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_assignment_BY_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ass.setFaculty_id(rs.getInt(1));
				ass.setSubject_id(rs.getInt(2));
				ass.setAssignment_topic(rs.getString(3));
				ass.setAssignment_desp(rs.getString(4));
				ass.setSubmitted(rs.getInt(5));
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return ass;
	}
	public static List<Assignment> getAllAssignments(){
		List<Assignment> list = new ArrayList<Assignment>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_assignment);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Assignment ass= new Assignment();
				ass.setFaculty_id(rs.getInt(1));
				ass.setSubject_id(rs.getInt(2));
				ass.setAssignment_topic(rs.getString(3));
				ass.setAssignment_desp(rs.getString(4));
				ass.setSubmitted(rs.getInt(5));
				list.add(ass);
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
