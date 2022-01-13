package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.Models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.Models.Student;
import com.Models.Teacher;
import com.Models.Principal;
/**
 * Servlet implementation class MyProfile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	HttpSession session = request.getSession();
	if (session.getAttribute("type").equals("Student")) {
		Student student = (Student) session.getAttribute("obj");		
	}
	else if (session.getAttribute("type").equals("Teacher")) {
		Teacher teacher = (Teacher) session.getAttribute("obj");
	}
	else if (session.getAttribute("type").equals("Principal")) {
		Principal principal = (Principal) session.getAttribute("obj");
	}
	}

}
