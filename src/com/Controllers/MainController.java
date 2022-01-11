
package com.Controllers;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServletProg
 */
@WebServlet("/AddServletProg")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		float res1=0;
		float a = Float.parseFloat(request.getParameter("n1"));
		float b = Float.parseFloat(request.getParameter("n2"));
		String opr = request.getParameter("operation");
		
		if (opr.equals("Addition")) {res1=a+b;}
		else if (opr.equals("Subtraction")) {res1=a-b;}
		else if (opr.equals("Multiplication")) {res1=a*b;}
		else if (opr.equals("Division")) {res1=a/b;}
		out.println("<html>");
		out.println("<body>");
		out.println("<h1> The Result of "+opr+" of "+ a+" and "+b+" is "+res1+"</h1>");
		out.println("<h1>Servlet Welcome at "+request.getContextPath()+"</h1>");
		out.println("</body>");
		out.println("</html>");
		StudentDAO.getCon();
	}

}
