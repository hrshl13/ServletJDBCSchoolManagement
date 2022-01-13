package com.Models;

public class Student extends User{
	int student_id;
	String  standard, result, admission_date;

	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", standard=" + standard + ", result=" + result
				+ ", admission_date=" + admission_date + ", fname=" + fname + ", lname=" + lname + ", dob=" + dob
				+ ", gender=" + gender + ", email=" + email + ", address=" + address + ", passwd=" + passwd
				+ ", phone_no=" + phone_no + ", login_id=" + login_id + ", getStandard()=" + getStandard()
				+ ", getResult()=" + getResult() + ", getAdmission_date()=" + getAdmission_date() + ", getStudent_id()="
				+ getStudent_id() + ", getLogin_id()=" + getLogin_id() + ", getFname()=" + getFname() + ", getLname()="
				+ getLname() + ", getDob()=" + getDob() + ", getGender()=" + getGender() + ", getEmail()=" + getEmail()
				+ ", getAddress()=" + getAddress() + ", getPasswd()=" + getPasswd() + ", getPhone_no()=" + getPhone_no()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAdmission_date() {
		return admission_date;
	}
	public void setAdmission_date(String admission_date) {
		this.admission_date = admission_date;
	}
	
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
}
