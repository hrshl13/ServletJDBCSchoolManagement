package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.DAO.StudentDAO;
import com.DAO.TeacherDAO;
import com.Models.Student;
import com.Models.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTeacher")
public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateTeacher() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("Inside do update");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String phone_no = request.getParameter("phone_no");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");
		String login_id = request.getParameter("login_id");
		int faculty_id = Integer.parseInt(request.getParameter("faculty_id"));
		int subject_id = Integer.parseInt(request.getParameter("subject_id"));
		
		
		Teacher s = new Teacher();
		s.setFname(fname);
		s.setLname(lname);
		s.setGender(gender);
		s.setPhone_no(phone_no);
		s.setEmail(email);
		s.setDob(dob);
		s.setAddress(address);
		s.setPasswd(passwd);
		s.setLogin_id(login_id);
		s.setFaculty_id(faculty_id);
		s.setSubject_id(subject_id);
	
		int status = TeacherDAO.updateTeacher(s);
		if(status>0) {
			System.out.println("Inside IF");
			RequestDispatcher rd = request.getRequestDispatcher("ViewTeacher.jsp");
			rd.forward(request, response);
		}
		else {
	    	request.setAttribute("msg", "Wrong Password!!!");
	    	response.sendRedirect("Login.jsp");
	    	System.out.println("Unsuccessful");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		System.out.println("Inside get ");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside post ");
		String yes = request.getParameter("submit_update");
		if (yes==null) {
			processRequest(request,response);
		}else {
			doUpdate(request,response);
		
		}
		
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(request.getParameter("Faculty_id")!=null) {
			int Faculty_id = Integer.parseInt(request.getParameter("Faculty_id"));
			Teacher list=TeacherDAO.getTeacherById(Faculty_id);
			request.setAttribute("List", list);
			System.out.println("Inside process ");
			RequestDispatcher rd = request.getRequestDispatcher("UpdateTeacher.jsp");
			rd.forward(request, response);
		}
		
	}

}
