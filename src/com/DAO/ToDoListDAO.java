package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Extras.createCon;
import com.Models.ToDoListModel;

public class ToDoListDAO {

	private static final String INSERT_todo_SQL = "INSERT INTO todo_list(user_login_id, task) VALUES (?, ?);";
	private static final String SELECT_todo_BY_User_ID = "select * from todo_list where user_login_id =?;";
	private static final String SELECT_todo_BY_ID = "select * from todo_list where task_id =?;";
	private static final String DELETE_todo_SQL = "delete from todo_list where task_id = ?;";
	private static final String UPDATE_todo_SQL = "update todo_list set user_login_id=?,task=? where task_id = ?;";

	public static int insertTask(ToDoListModel s) throws SQLException {
		int status = 0;
		// try-with-resource statement will auto close the connection.
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(INSERT_todo_SQL);
			ps.setString(1, s.getUser_id());
			ps.setString(2, s.getTask());
			status = ps.executeUpdate();
			System.out.println("Records Inserted!");
			con.close();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return status;
	}

	public static int updateTask(ToDoListModel s) {

		int status = 0;
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(UPDATE_todo_SQL);
			ps.setString(1, s.getUser_id());
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
		int status = 0;
		try {
			Connection con = createCon.getConnection();
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

	public static ToDoListModel getTasksById(int id) {
		ToDoListModel s = new ToDoListModel();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_todo_BY_ID);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setTask_id(rs.getInt("task_id"));
				s.setUser_id(rs.getString("user_login_id"));
				s.setTask(rs.getString("task"));
			}
			con.close();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s;
	}

	public static List<ToDoListModel> getAllTasksByUserId(String id) {
		List<ToDoListModel> list = new ArrayList<ToDoListModel>();
		try {
			Connection con = createCon.getConnection();
			PreparedStatement ps = con.prepareStatement(SELECT_todo_BY_User_ID);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ToDoListModel s = new ToDoListModel();
				s.setTask_id(rs.getInt("task_id"));
				s.setUser_id(rs.getString("user_login_id"));
				s.setTask(rs.getString("task"));
				list.add(s);
			}
			con.close();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return list;
	}

	private static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
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
