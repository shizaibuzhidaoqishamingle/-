package com.slms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.slms.jdbc.JDBCTools;

public class PassJudge extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String studentId = req.getParameter("studentId");
		String passSql = "UPDATE leave_application SET judge = '3' WHERE judge='1' AND studentId="+studentId;
		JDBCTools.update(passSql);
		resp.sendRedirect("html/teacher/content.jsp");
	}
}
