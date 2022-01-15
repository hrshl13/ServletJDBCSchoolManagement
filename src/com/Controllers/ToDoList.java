package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.ToDoListDAO;
import com.Models.ToDoListModel;

/**
 * Servlet implementation class ToDoList
 */
@WebServlet("/ToDoList")
public class ToDoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("ToDoList.jsp");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ToDoListDAO.deleteTask(id);
		PrintWriter out = response.getWriter();

		out.print(id);
		out.flush();
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			this.handleRequest(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
		HttpSession session = request.getSession(false);
		  if (session == null)
		  {
		    RequestDispatcher rd = request.getRequestDispatcher("Forbidden.jsp");
		    rd.forward(request,response);
		  }
		  
		  ToDoListModel obj = new ToDoListModel();
		  obj.setUser_id(request.getParameter("userId"));
		  obj.setTask(request.getParameter("taskDes"));
		  if (obj.getTask().isBlank()) {
			  RequestDispatcher rd = request.getRequestDispatcher("ToDoList.jsp");
			  request.setAttribute("msg", "Task Cannot be empty!!!");
			  rd.forward(request,response);
		  }else {
			  ToDoListDAO.insertTask(obj);
			  response.sendRedirect("ToDoList.jsp");
		  }
		  
		  
		
	}
}
