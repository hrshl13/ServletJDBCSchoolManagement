package com.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.AssignmentsDAO;
import com.Models.AssignmentModel;
import com.Models.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class assignDetails extends HttpServlet {
private static final long serialVersionUID= 1L;
	
	protected void doGet (HttpServletRequest request, HttpServletResponse response){
		String assid;
		
		assid=request.getParameter("assid");
		request.setAttribute("getassid", assid);
		RequestDispatcher rd= request.getRequestDispatcher("AssignmentDetails.jsp");
		rd.forward(request, response);
	}
	
}
