package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import com.DAO.SyllabusDAO;
import com.DAO.ToDoListDAO;
import com.Models.Syllabus;
import com.Models.Teacher;
import com.Models.ToDoListModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewEditSyllabus
 */
@WebServlet("/ViewEditSyllabus")
public class ViewEditSyllabus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewEditSyllabus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("ViewEditSyllabus.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//processRequest(request,response);	
		//RequestDispatcher rd = request.getRequestDispatcher("ViewEditSyllabus.jsp");
		//rd.forward(request, response);
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
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String standard = request.getParameter("stdlist");
		List<Syllabus> s = SyllabusDAO.getSyllabusByStandard(standard);		
		session.setAttribute("List", s);
	}
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
		HttpSession session = request.getSession(false);
		  if (session == null)
		  {
		    RequestDispatcher rd = request.getRequestDispatcher("Forbidden.jsp");
		    rd.forward(request,response);
		  }
		  Syllabus syl = new Syllabus();
		  Teacher teacher= (Teacher)session.getAttribute("obj");
		  syl.setChapter(request.getParameter("newSyl"));
		  syl.setStandard(request.getParameter("std"));
		  syl.setSubject_id(teacher.getSubject_id());
		  if (syl.getChapter().isBlank()) {
			  RequestDispatcher rd = request.getRequestDispatcher("ToDoList.jsp");
			  request.setAttribute("msg", "Task Cannot be empty!!!");
			  rd.forward(request,response);
		  }else {
			  SyllabusDAO.insert(syl);
			  response.sendRedirect("ViewEditSyllabus.jsp");
		  }

	}
 
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int stat = SyllabusDAO.delete(id);
		PrintWriter out = response.getWriter();
		if (stat > 0) {
			out.print(id);
		}else {
			out.print(-1);
		}		
		out.flush();
		
	}	  
		
	
}
