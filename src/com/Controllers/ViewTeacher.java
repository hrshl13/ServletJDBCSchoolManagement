package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.DAO.StudentDAO;
import com.DAO.SubjectDAO;
import com.DAO.TeacherDAO;
import com.Models.Student;
import com.Models.Subject;
import com.Models.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewTeacher")
public class ViewTeacher extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ViewTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		System.out.println("Inside get ");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);	
		RequestDispatcher rd = request.getRequestDispatcher("ViewTeacher.jsp");
		rd.forward(request, response);
		System.out.println("Inside post ");
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int subject_id = Integer.parseInt(request.getParameter("sbjlist"));
		List<Teacher> list = TeacherDAO.getTeacherBySubjectId(subject_id);	
		request.setAttribute("List", list);
		System.out.println("Inside process ");
	}
}
