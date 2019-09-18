package com.slms.javabeans;

import java.util.Date;

public class TeacherStudent {
	private String studentName;
	private String grade;
	private String className;
	private String phoneNumber;
	private String leaveReason;
	private Date startTime;
	private Date endTime;

	public TeacherStudent(String studentName, String grade, String className, String phoneNumber, String leaveReason,
			Date startTime, Date endTime) {
		super();
		this.studentName = studentName;
		this.grade = grade;
		this.className = className;
		this.phoneNumber = phoneNumber;
		this.leaveReason = leaveReason;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public TeacherStudent() {

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

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

}
