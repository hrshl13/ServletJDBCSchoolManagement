package com.Models;

public class Submission {
	int submission_id, assignment_id, student_id, marks;
	String student_fname, student_lname;
	public int getSubmission_id() {
		return submission_id;
	}
	public void setSubmission_id(int submission_id) {
		this.submission_id = submission_id;
	}
	public int getAssignment_id() {
		return assignment_id;
	}
	public void setAssignment_id(int assignment_id) {
		this.assignment_id = assignment_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public String getStudent_fname() {
		return student_fname;
	}
	public void setStudent_fname(String student_fname) {
		this.student_fname = student_fname;
	}
	public String getStudent_lname() {
		return student_lname;
	}
	public void setStudent_lname(String student_lname) {
		this.student_lname = student_lname;
	}
	
}
