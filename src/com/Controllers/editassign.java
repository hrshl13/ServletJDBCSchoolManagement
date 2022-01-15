package com.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.AssignmentsDAO;
import com.Models.AssignmentModel;
import com.Models.Teacher;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/editassign")
public class editassign extends HttpServlet {
	private static final long serialVersionUID= 1L;
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response){
		String top, desc,stdlist;
		
		top=request.getParameter("asstopic");
		desc=request.getParameter("assdesc");
		stdlist=request.getParameter("stdlist");
		
		HttpSession session = request.getSession();
	
		Teacher fac = (Teacher)session.getAttribute("obj");
		
		AssignmentModel assmodel = new AssignmentModel();
		
		assmodel.setAssignment_topic(top);
		assmodel.setAssignment_desp(desc);
		assmodel.setStd(stdlist);
		assmodel.setFaculty_id(fac.getFaculty_id());
		assmodel.setSubject_id(fac.getSubject_id());
		assmodel.setSubmitted(0);
		
		try {
			int stat;
			stat = AssignmentsDAO.insertAssignment(assmodel);
			System.out.println("Values added!!");
			try {
				response.sendRedirect("editassignment.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
	

}
