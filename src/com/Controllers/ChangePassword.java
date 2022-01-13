package com.Controllers;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import com.Extras.Hash;
import com.Models.Principal;
import com.Models.Student;
import com.Models.Teacher;
import com.Models.User;
import com.DAO.StudentDAO;
import com.DAO.TeacherDAO;
import com.DAO.PrincipalDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curpass = Hash.encode(request.getParameter("curpass"));
		String newpass = Hash.encode(request.getParameter("newpass"));
		String repass = Hash.encode( request.getParameter("repass"));
		if (curpass.isBlank()) {
			request.setAttribute("msg", "Please Enter Current Password!!!");
		}
		else if(newpass.isBlank()) {
			request.setAttribute("msg", "Please Enter Current Password!!!");
		}
		else if(newpass.isBlank()) {
			request.setAttribute("msg", "Please Enter Current Password!!!");
		}
		RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("obj");
		if (!curpass.equals(user.getPasswd())) {
			request.setAttribute("msg", "Please Enter correct Current Password!!!");
		}
		else if (!newpass.equals(repass)) {
			request.setAttribute("msg", "New Password and Retype Password should be same!!!");
		}
		else {
			user.setPasswd(newpass);
			if(session.getAttribute("type").equals("Student")) {
				Student student = new Student();
				StudentDAO.update(student);
				response.sendRedirect("Logout");
			}
			else if (session.getAttribute("type").equals("Teacher")) {
				Teacher teacher = new Teacher();
				TeacherDAO.updateTeacher(teacher);
				response.sendRedirect("Logout");
			}
			else if (session.getAttribute("type").equals("Principal")) {
				Principal principal = new Principal();
				PrincipalDAO.insert(principal);
				response.sendRedirect("Logout");
			}
		}
	}

}
