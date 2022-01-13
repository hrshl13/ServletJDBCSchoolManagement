package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Models.Teacher;
import com.Models.Student;
import com.Models.Principal;
import com.DAO.TeacherDAO;
import com.DAO.StudentDAO;
import com.DAO.PrincipalDAO;
import com.Extras.Hash;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Authenticating login details
		processRequest(request, response);
	}
	
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String uname=request.getParameter("uname");
			String passwd= Hash.encode(request.getParameter("passwd"));
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			
			if (uname.toLowerCase().startsWith("s")){
				Student cur = StudentDAO.getStudentByLoginId(uname);
				 if(cur.getPasswd()==null) {
					 request.setAttribute("msg", "No Registrations with the given Login ID!!!");
					 rd.forward(request, response);
				 }else if(cur.getPasswd().equals(passwd)) {
					 //On Successful Authentication, Creating a session and redirecting to homepage
					 HttpSession session = request.getSession();
					 session.setAttribute("type", "Student");
					 session.setAttribute("obj", cur);
					 response.sendRedirect("HomePage.jsp");
					 
				 }else {
					 request.setAttribute("msg", "Wrong Password!!!");
					 rd.forward(request, response);
				 }
				}
			else if (uname.toLowerCase().startsWith("t")) {
				Teacher cur = TeacherDAO.getTeacherByLoginId(uname);
				if(cur.getPasswd().equals(null)) {
					 request.setAttribute("msg", "No Registrations with the given Login ID!!!");
					 rd.forward(request, response);
				 }else if(cur.getPasswd().equals(passwd)) {
					 //On Successful Authentication, Creating a session and redirecting to homepage
					 HttpSession session = request.getSession();
					 session.setAttribute("type", "Teacher");
					 session.setAttribute("obj", cur);
					 response.sendRedirect("HomePage.jsp");
				 }else {
					 request.setAttribute("msg", "Wrong Password!!!");
					 rd.forward(request, response);
				 }
				}
			else if (uname.toLowerCase().startsWith("p")) {
				Principal cur = PrincipalDAO.getPrincipalByLoginId(uname);
				if(cur.getPasswd().equals(null)) {
					 request.setAttribute("msg", "No Registrations with the given Login ID!!!");
					 rd.forward(request, response);
				 }else if(cur.getPasswd().equals(passwd)) {
					 //On Successful Authentication, Creating a session and redirecting to homepage
					 HttpSession session = request.getSession();
					 session.setAttribute("type", "Principal");
					 session.setAttribute("obj", cur);
					 response.sendRedirect("HomePage.jsp");
				 }else {
					 request.setAttribute("msg", "Wrong Password!!!");
					 rd.forward(request, response);
				 }
			}
			else {
				request.setAttribute("msg", "Invalid Username!!!");
				rd.forward(request, response);
			}
			
	 }
}
