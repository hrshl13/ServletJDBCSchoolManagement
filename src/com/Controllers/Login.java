package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;

import com.DAO.TeacherDAO;
import com.Models.Teacher;
import com.DAO.StudentDAO;
import com.DAO.PrincipalDAO;

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
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}	
	protected boolean getUnamePassword(String uname,String passwd) {
		boolean ans = false;
		 List<Teacher> teacherList = TeacherDAO.getAllTeachers();
		 for (Teacher t: teacherList) {
			 if (uname.equals(t.getFaculty_id()) && passwd.equals(t.getPasswd())){
				 ans = true;
			 }
		 }
		 return ans;
	}
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			PrintWriter out = response.getWriter();
			String uname=request.getParameter("uname");
			String passwd=request.getParameter("passwd");
			
			if (uname.equals("harshal") && passwd.equals("gondkar")){
				HttpSession session = request.getSession();
				response.sendRedirect("HomePage.jsp");
				}
			else {
				   out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
				   out.println("<p style='color:red;'>User or password incorrect!</p>");
				}
	 }
}
