package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import com.DAO.StudentDAO;
import com.Models.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//iooioojoi
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AddStudent() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside do get");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		System.out.println("Inside do post");
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("Inside process request");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String phone_no = request.getParameter("phone_no");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String admission_date = request.getParameter("admission_date");
		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");
		String standard = request.getParameter("standard");
		String login_id = request.getParameter("login_id");
		
		Student s = new Student();
		s.setFname(fname);
		s.setLname(lname);
		s.setGender(gender);
		s.setPhone_no(phone_no);
		s.setEmail(email);
		s.setDob(dob);
		s.setAdmission_date(admission_date);
		s.setAddress(address);
		s.setPasswd(passwd);
		s.setStandard(standard);
		s.setLogin_id(login_id);
	
		int status = StudentDAO.insert(s);
		if(status>0) {
			System.out.println("Inside IF");
			request.setAttribute("msg", "Wrong Password!!!");
			response.sendRedirect("ViewStudent.jsp");
		}
		else {
	    	request.setAttribute("msg", "Wrong Password!!!");
	    	response.sendRedirect("Login.jsp");
	    	System.out.println("Unsuccessful");
		}
	}

}



























