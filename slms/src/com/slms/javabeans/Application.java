package com.slms.javabeans;

import java.util.Date;

public class Application {

	private int studentId;
	private String studentName;
	private String grade;
	private String className;
	private String phoneNumber;
	private Date startTime;
	private Date endTime;
	private String judge;
	private String leaveReason;

	public Application() {

	}

	public Application(int studentId, String studentName, String grade, String className, String phoneNumber,
			Date startTime, Date endTime, String judge, String leaveReason) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.grade = grade;
		this.className = className;
		this.phoneNumber = phoneNumber;
		this.startTime = startTime;
		this.endTime = endTime;
		this.judge = judge;
		this.leaveReason = leaveReason;
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

	public String getJudge() {
		return judge;
	}

	public void setJudge(String judge) {
		this.judge = judge;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

}
