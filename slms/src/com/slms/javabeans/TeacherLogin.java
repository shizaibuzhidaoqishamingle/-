package com.slms.javabeans;

public class TeacherLogin {
	private int teacherId;
	private String teacherName;
	private String grade;
	private String className;

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
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

	public TeacherLogin(int teacherId, String teacherName, String grade, String className) {
		super();
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.grade = grade;
		this.className = className;
	}

	public TeacherLogin() {

	}

}
