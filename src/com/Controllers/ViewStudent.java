package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.DAO.StudentDAO;
import com.DAO.SyllabusDAO;
import com.Models.Principal;
import com.Models.Student;
import com.Models.Syllabus;
import com.Models.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * View student Details
*/

@WebServlet("/ViewStudent")
public class ViewStudent extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int stat=StudentDAO.delete(id);
		PrintWriter out = response.getWriter();
		if (stat > 0) {
			out.print(id);
		}else {
			out.print(-1);
		}
		
		out.flush();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		System.out.println("Inside get ");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);	
		RequestDispatcher rd = request.getRequestDispatcher("ViewStudent.jsp");
		rd.forward(request, response);
		System.out.println("Inside post ");
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String standard = request.getParameter("stdlist");
		List<Student> list=StudentDAO.getStudentByStandard(standard);	
		request.setAttribute("List", list);
		System.out.println("Inside process ");
	}
}
