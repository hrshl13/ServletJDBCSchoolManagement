package com.Models;

public class Assignment {
	
	String assignment_topic, assignment_desp;
	int assignment_id, faculty_id, subject_id, submitted;
	public int getAssignment_id() {
		return assignment_id;
	}
	public void setAssignment_id(int assignment_id) {
		this.assignment_id = assignment_id;
	}
	public int getFaculty_id() {
		return faculty_id;
	}
	public void setFaculty_id(int faculty_id) {
		this.faculty_id = faculty_id;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public int getSubmitted() {
		return submitted;
	}
	public void setSubmitted(int submitted) {
		this.submitted = submitted;
	}
	
	public String getAssignment_topic() {
		return assignment_topic;
	}
	public void setAssignment_topic(String assignment_topic) {
		this.assignment_topic = assignment_topic;
	}
	public String getAssignment_desp() {
		return assignment_desp;
	}
	public void setAssignment_desp(String assignment_desp) {
		this.assignment_desp = assignment_desp;
	}
}
