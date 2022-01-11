package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Models.ToDoList;

public class ToDoListDAO {
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
	private static final String INSERT_todo_SQL = "INSERT INTO todo_list(student_id, task) VALUES (?, ?);";
    private static final String SELECT_todo_BY_Student_ID = "select * from todo_list where student_id =?;";
    private static final String SELECT_ALL_todo = "select * from todo_list;";
    private static final String DELETE_todo_SQL = "delete from todo_list where task_id = ?;";
    private static final String UPDATE_todo_SQL = "update todo_list set student_id=?,task=? where task_id = ?;";
    
    public int insertTask(ToDoList s) throws SQLException {
    	int status = 0;
        // try-with-resource statement will auto close the connection.
        try{
        	Connection con = getConnection();
        	PreparedStatement ps = con.prepareStatement(INSERT_todo_SQL);
            ps.setInt(1, s.getStudent_id());
            ps.setString(2, s.getTask());
            status = ps.executeUpdate();
            System.out.println("Records Inserted!");
            con.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    public static int updateTask(ToDoList s) {
    	int status=0;
    		try {
    			Connection con = getConnection();
    			PreparedStatement ps = con.prepareStatement(UPDATE_todo_SQL);
    			ps.setInt(1, s.getStudent_id());
                ps.setString(2, s.getTask());
                ps.setInt(3, s.getTask_id());
    			status = ps.executeUpdate();
    			System.out.println("Records Updated!");
    			con.close();
    		} catch (SQLException e) {
                printSQLException(e);
            }
    		return status;
    	}
    public static int deleteTask(int id) {
		int status=0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE_todo_SQL);
			ps.setInt(1, id);
			status = ps.executeUpdate();
			System.out.println("Records Deleted!");
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return status;
	}
	public static ToDoList getTasksByStudentId(int id) {
		ToDoList s = new ToDoList();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_todo_BY_Student_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setTask_id(rs.getInt(1));
				s.setStudent_id(rs.getInt(2));
				s.setTask(rs.getString(3));
			}
			con.close();
		} catch (SQLException e) {
            printSQLException(e);
        }
		return s;
	}
	public static List<ToDoList> getAllTasks(){
		List<ToDoList> list = new ArrayList<ToDoList>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_todo);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ToDoList s= new ToDoList();
				s.setTask_id(rs.getInt(1));
				s.setStudent_id(rs.getInt(2));
				s.setTask(rs.getString(3));
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
