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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDoList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			this.handleRequest(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
		HttpSession session = request.getSession(false);
		  if (session == null)
		  {
		    RequestDispatcher rd = request.getRequestDispatcher("Forbidden.jsp");
		    rd.forward(request,response);
		  }
		  
		  ToDoListModel obj = new ToDoListModel();
		  obj.setStudent_id(Integer.parseInt(request.getParameter("userId")));
		  obj.setTask(request.getParameter("taskDes"));
		  
		  ToDoListDAO.insertTask(obj);
		 
		  response.sendRedirect("ToDoList.jsp");
		  
		
	}
}
