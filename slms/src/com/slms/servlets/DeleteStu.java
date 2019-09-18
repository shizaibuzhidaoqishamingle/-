package com.slms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.slms.jdbc.JDBCTools;

public class DeleteStu extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String studentId = request.getParameter("studentId");
		String deleteSql = "DELETE leave_application,student from leave_application LEFT JOIN student ON " +
				"leave_application.studentId=student.studentId WHERE leave_application.studentId="+studentId;
		JDBCTools.update(deleteSql);
		response.sendRedirect("html/teacher/stumessage.jsp");
	}

}
