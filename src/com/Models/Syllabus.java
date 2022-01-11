package com.Models;

public class Syllabus {
	int syllabus_id, subject_id;
	String standard, chapter;
	public int getSyllabus_id() {
		return syllabus_id;
	}
	public void setSyllabus_id(int syllabus_id) {
		this.syllabus_id = syllabus_id;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	
}
