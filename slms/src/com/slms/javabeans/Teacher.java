package com.slms.javabeans;

public class Teacher {

	private int teacherId;
	private String password;

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Teacher() {

	}

	public Teacher(int teacherId, String password) {
		super();
		this.teacherId = teacherId;
		this.password = password;
	}

	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", password=" + password + "]";
	}

}
