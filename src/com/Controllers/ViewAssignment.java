package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.DAO.SubmissionDAO;
import com.DAO.ToDoListDAO;
import com.Models.Student;
import com.Models.Submission;
import com.Models.ToDoListModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewAssignment
 */
@WebServlet("/ViewAssignment")
public class ViewAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("ViewAssignemnt.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Submission sub = new Submission();
		sub.setAssignment_id(id);
		HttpSession session = request.getSession(false);
		Student student = (Student)session.getAttribute("obj");
		sub.setStudent_id(student.getStudent_id());
		int status = SubmissionDAO.insertSubmission(sub);
		PrintWriter out = response.getWriter();
		if (status > 0) {
			out.print(id);
		}else {
			out.print(-1);
		}
		
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
