package com.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Extras.createCon;
import com.Models.AssignmentModel;
import com.Models.Teacher;
public class AssignmentsDAO {
	
	private static final String INSERT_assignment_SQL = "INSERT INTO assignment(faculty_id,subject_id,assignment_topic,assignment_desp,submitted,standard) VALUES (?,?,?,?,?,?);";
    private static final String SELECT_assignment_BY_Faculty_ID = "select * from assignment where faculty_id =?";
    private static final String SELECT_assignment_BY_standard = "select * from assignment where standard =?;";
    private static final String SELECT_ALL_assignment = "select * from assignment;";
    private static final String DELETE_assignment_SQL = "delete from assignment where assignment_id = ?;";
    private static final String UPDATE_assignment_SQL = "update faculty set faculty_id=? ,subject_id=? ,assignment_topic=? ,assignment_desp=? ,submitted=?, standard=? where assignment_id = ?;";
    
    public static int insertAssignment(AssignmentModel ass) throws SQLException {
    	int status = 0;
        // try-with-resource statement will auto close the connection.
        try{
        	Connection con = createCon.getConnection();
        	PreparedStatement ps = con.prepareStatement(INSERT_assignment_SQL);
            ps.setInt(1, ass.getFaculty_id());
            ps.setInt(2, ass.getSubject_id());
            ps.setString(3, ass.getAssignment_topic());
            ps.setString(4, ass.getAssignment_desp());
            ps.setInt(5, ass.getSubmitted());
            ps.setString(6, ass.getStd());
            status = ps.executeUpdate();
            System.out.println("Records Inserted!");
            con.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    public static int updateAssignment(AssignmentModel ass) {
    	int status=0;
    		try {
    			Connection con = createCon.getConnection();
    			PreparedStatement ps = con.prepareStatement(UPDATE_assignment_SQL);
    			ps.setInt(1, ass.getFaculty_id());
                ps.setInt(2, ass.getSubject_id());
                ps.setString(3, ass.getAssignment_topic());
                ps.setString(4, ass.getAssignment_desp());
                ps.setInt(5, ass.getSubmitted());
                ps.setString(6, ass.getStd());
                ps.setInt(7, ass.getAssignment_id());
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
			Connection con = createCon.getConnection();
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
	public static List<AssignmentModel> getAssignmentByFacultyId(int id) {
		List<AssignmentModel> list = new ArrayList<AssignmentModel>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_assignment_BY_Faculty_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AssignmentModel ass = new AssignmentModel();
				ass.setAssignment_id(rs.getInt("assignment_id"));
				ass.setFaculty_id(rs.getInt("faculty_id"));
				ass.setSubject_id(rs.getInt("subject_id"));
				ass.setAssignment_topic(rs.getString("assignment_topic"));
				ass.setAssignment_desp(rs.getString("assignment_desp"));
				ass.setSubmitted(rs.getInt("submitted"));
				ass.setStd(rs.getString("standard"));
				list.add(ass);
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return list;
	}
	public static List<AssignmentModel> getAssignmentByStandard(String std) {
		List<AssignmentModel> list = new ArrayList<AssignmentModel>();
		
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_assignment_BY_standard);
			ps.setString(1, std);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AssignmentModel ass = new AssignmentModel();
				ass.setAssignment_id(rs.getInt("assignment_id"));
				ass.setFaculty_id(rs.getInt("faculty_id"));
				ass.setSubject_id(rs.getInt("subject_id"));
				ass.setAssignment_topic(rs.getString("assignment_topic"));
				ass.setAssignment_desp(rs.getString("assignment_desp"));
				ass.setSubmitted(rs.getInt("submitted"));
				ass.setStd(rs.getString("standard"));
				list.add(ass);
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return list;
	}
	public static List<AssignmentModel> getAllAssignments(){
		List<AssignmentModel> list = new ArrayList<AssignmentModel>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_assignment);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AssignmentModel ass= new AssignmentModel();
				ass.setAssignment_id(rs.getInt("assignment_id"));
				ass.setFaculty_id(rs.getInt("faculty_id"));
				ass.setSubject_id(rs.getInt("subject_id"));
				ass.setAssignment_topic(rs.getString("assignment_topic"));
				ass.setAssignment_desp(rs.getString("assignemnt_desp"));
				ass.setSubmitted(rs.getInt("submitted"));
				ass.setStd(rs.getString("standard"));
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
