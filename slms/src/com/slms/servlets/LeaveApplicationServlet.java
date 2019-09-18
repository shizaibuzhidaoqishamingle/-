package com.slms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.slms.jdbc.JDBCTools;

public class LeaveApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String studentId = request.getParameter("studentId");
		String studentName = request.getParameter("studentName");
		String className = request.getParameter("className");
		String phone = request.getParameter("phone");
		
		String startDay = request.getParameter("startDay");
		String startMonth = request.getParameter("startMonth");
		String startYear = request.getParameter("startYear");
		String startTime = startYear + "-" + startMonth + "-" + startDay ;
		
		String endDay = request.getParameter("endDay");
		String endMonth = request.getParameter("endMonth");
		String endYear = request.getParameter("endYear");
		String endTime = endYear + "-" + endMonth + "-" + endDay;
		
		String reason = request.getParameter("reason");
		String teacher = request.getParameter("teacher");
		String judge = request.getParameter("judge");
		
		String sql = "INSERT INTO leave_application (studentId, studentName,"
				+ " grade, className, "
				+ "phoneNumber, startTime, endTime, leaveReason, teacher,judge) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
		
		JDBCTools.update(sql, studentId, studentName, className, 
				className,phone, startTime, endTime, reason, teacher,judge);
		
		response.sendRedirect("html/student/mynote.jsp");
	}

}
