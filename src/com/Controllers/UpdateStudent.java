package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.DAO.StudentDAO;
import com.Models.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateStudent() {
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
		String admission_date = request.getParameter("admission_date");
		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");
		String standard = request.getParameter("standard");
		String login_id = request.getParameter("login_id");
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		
		System.out.println(student_id);
		
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
		s.setStudent_id(student_id);
	
		int status = StudentDAO.update(s);
		if(status>0) {
			System.out.println("Inside IF");
			RequestDispatcher rd = request.getRequestDispatcher("ViewStudent.jsp");
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
		if(request.getParameter("Student_id")!=null) {
			int Student_id = Integer.parseInt(request.getParameter("Student_id"));
			Student list=StudentDAO.getStudentById(Student_id);
			request.setAttribute("List", list);
			System.out.println("Inside process ");
			RequestDispatcher rd = request.getRequestDispatcher("UpdateStudent.jsp");
			rd.forward(request, response);
		}
		
	}

}
