package com.slms.javabeans;

public class Student {

	private int studentId;
	private String name;
	private String password;
	private String className;
	private String academy;
	private String phone;

	public Student(int studentId, String name, String password, String className, String academy, String phone) {
		super();
		this.studentId = studentId;
		this.name = name;
		this.password = password;
		this.className = className;
		this.academy = academy;
		this.phone = phone;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Student() {

	}

}
