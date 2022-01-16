package com.Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.DAO.AssignmentsDAO;
import com.DAO.StudentDAO;
import com.DAO.SubmissionDAO;
import com.Models.AssignmentModel;
import com.Models.Submission;
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
	
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response){
		
		int id=0;
		String sid ;
		sid = request.getParameter("assid");
		id=Integer.parseInt(sid);
		List<Submission> list = SubmissionDAO.getSubmissionsBy_Assignment_ID(id);
		
		for (Submission i: list){
			int mk;
			mk= Integer.parseInt(request.getParameter("marks_"+i.getSubmission_id()));
			i.setMarks(mk);
			
			int add;
			add = SubmissionDAO.updateSubmission(i);	
		  } 
		
		AssignmentModel assm = AssignmentsDAO.getAssignmentByAssign_ID(id);
		assm.setSubmitted(1);
		int upd= AssignmentsDAO.updateAssignment(assm);
		
		try {
			response.sendRedirect("editassignment.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
