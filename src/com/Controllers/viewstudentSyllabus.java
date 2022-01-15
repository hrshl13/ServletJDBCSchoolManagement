package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.DAO.SyllabusDAO;
import com.Models.Student;
import com.Models.Syllabus;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 * Servlet implementation class viewstudentSyllabus
 */
@WebServlet("/viewstudentSyllabus")
public class viewstudentSyllabus extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int abc= Integer.parseInt(request.getParameter("subject"));
		System.out.println(abc);
		HttpSession session = request.getSession(false);
		Student obj = (Student) session.getAttribute("obj");
		List<Syllabus> list = SyllabusDAO.getSyllabusByStandardAndSubject(obj.getStandard(),abc );
		request.setAttribute("sub", list);
		RequestDispatcher dispatch = request.getRequestDispatcher("viewstudentSyllabus.jsp");
		dispatch.forward(request, response);
	}

}
