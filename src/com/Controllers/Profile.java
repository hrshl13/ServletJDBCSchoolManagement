package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.util.Dictionary;
import java.util.Hashtable;
import java.io.IOException;
import com.Models.User;
import jakarta.servlet.RequestDispatcher;
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
	
		HttpSession session = request.getSession(false);
		RequestDispatcher rd = request.getRequestDispatcher("Profile.jsp");
		User user = (User)session.getAttribute("obj");
		Dictionary D = new Hashtable();
		D.put("Name", user.getFname()+user.getLname());
		D.put("Date of Birth", user.getDob());
		D.put("Gender", user.getGender());
		D.put("Email", user.getEmail());
		D.put("Phone Number", user.getPhone_no());
		D.put("Address", user.getAddress());
		D.put("Login ID", user.getLogin_id());
		
	if (session.getAttribute("type").equals("Student")) {
		Student student = (Student) session.getAttribute("obj");	
		D.put("ID", student.getStudent_id());
		D.put("Standard", student.getStandard());
		D.put("Admission Date", student.getAdmission_date());
		session.setAttribute("Details", D);
		rd.forward(request, response);
	}
	else if (session.getAttribute("type").equals("Teacher")) {
		Teacher teacher = (Teacher) session.getAttribute("obj");
		D.put("ID", teacher.getFaculty_id());
		D.put("Subject ID", teacher.getSubject_id());
		session.setAttribute("Details", D);
		rd.forward(request, response);
	}
	else if (session.getAttribute("type").equals("Principal")) {
		Principal principal = (Principal) session.getAttribute("obj");
		D.put("ID", principal.getPrincipal_id());
		session.setAttribute("Details", D);
		rd.forward(request, response);
	}
	
	}

}
