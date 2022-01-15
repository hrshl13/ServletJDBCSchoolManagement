package com.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.AssignmentsDAO;
import com.Models.AssignmentModel;
import com.Models.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/assignDetails")
public class assignDetails extends HttpServlet {
private static final long serialVersionUID= 1L;
	
	protected void doGet (HttpServletRequest request, HttpServletResponse response){
		int assid;
		String sassid;
		sassid=request.getParameter("assid");
		assid= Integer.parseInt(sassid);
		request.setAttribute("getassid", assid);
		RequestDispatcher rd= request.getRequestDispatcher("AssignmentDetails.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
