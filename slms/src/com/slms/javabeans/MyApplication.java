package com.slms.javabeans;

public class MyApplication {
	private int studentId;
	private String studentName;
	private String grade;
	private String className;
	private String phoneNumber;

	public MyApplication(int studentId, String studentName, String grade, String className, String phoneNumber) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.grade = grade;
		this.className = className;
		this.phoneNumber = phoneNumber;
	}

	public MyApplication() {

	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "MyApplication [studentId=" + studentId + ", studentName=" + studentName + ", grade=" + grade
				+ ", className=" + className + ", phoneNumber=" + phoneNumber + "]";
	}

}
