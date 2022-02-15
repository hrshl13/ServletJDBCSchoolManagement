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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curpass = Hash.encode(request.getParameter("curpass"));
		String newpass = request.getParameter("newpass");
		String repass = request.getParameter("repass");
		RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
		if (curpass.isBlank()) {
			request.setAttribute("msg", "Please Enter Current Password!!!");
			rd.forward(request, response);
		}
		else if(newpass.isBlank()) {
			request.setAttribute("msg", "Please Enter New Password!!!");
			rd.forward(request, response);
		}
		else if(repass.isBlank()) {
			request.setAttribute("msg", "Please Re-enter New Password!!!");
			rd.forward(request, response);
		}
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("obj");
		if (!curpass.equals(user.getPasswd())) {
			request.setAttribute("msg", "Please Enter Correct Current Password!!!");
			rd.forward(request, response);
		}
		else if (!newpass.equals(repass)) {
			request.setAttribute("msg", "New Password and Retype Password should be same!!!");
			rd.forward(request, response);
		}
		else {
			if(session.getAttribute("type").equals("Student")) {
				Student student =  (Student) user;
				student.setPasswd(Hash.encode(newpass));
				int status = StudentDAO.update(student);
				if (status>0) {
					response.sendRedirect("Logout");
				}
				else {
					request.setAttribute("msg", "Unsuccessful!!!");
					rd.forward(request, response);
				}
			}
			else if (session.getAttribute("type").equals("Teacher")) {
				Teacher teacher = (Teacher) session.getAttribute("obj");
				teacher.setPasswd(Hash.encode(newpass));
				int status =TeacherDAO.updateTeacher(teacher);
				if (status>0) {
					response.sendRedirect("Logout");
				}
				else {
					request.setAttribute("msg", "Unsuccessful!!!");
					rd.forward(request, response);
				}
			}
			else if (session.getAttribute("type").equals("Principal")) {
				Principal principal = (Principal) session.getAttribute("obj");
				principal.setPasswd(Hash.encode(newpass));
				int status =PrincipalDAO.update(principal);
				if (status>0) {
					response.sendRedirect("Logout");
				}
				else {
					request.setAttribute("msg", "Unsuccessful!!!");
					rd.forward(request, response);
				}
			}
		}
	}

}
