package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.DAO.StudentDAO;
import com.DAO.TeacherDAO;
import com.Models.Student;
import com.Models.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public AddTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		System.out.println("Inside do get");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
			System.out.println("Inside do post ");
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
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		System.out.println("Inside do process ");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String phone_no = request.getParameter("phone_no");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");
		int subject_id = Integer.parseInt(request.getParameter("subject_id"));
		String login_id = request.getParameter("login_id");
		
		Teacher s = new Teacher();
		s.setFname(fname);
		s.setLname(lname);
		s.setGender(gender);
		s.setPhone_no(phone_no);
		s.setEmail(email);
		s.setDob(dob);
		s.setAddress(address);
		s.setPasswd(passwd);
		s.setSubject_id(subject_id);
		s.setLogin_id(login_id);
	
		int status = TeacherDAO.insertTeacher(s);
		if(status>0) {
			System.out.println("Inside IF");
			request.setAttribute("msg", "Wrong Password!!!");
			response.sendRedirect("ViewTeacher.jsp");
		}
		else {
	    	request.setAttribute("msg", "Wrong Password!!!");
	    	response.sendRedirect("Login.jsp");
	    	System.out.println("Unsuccessful");
		}
	}
}
