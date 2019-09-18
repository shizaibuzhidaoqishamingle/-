package com.slms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slms.jdbc.JDBCTools;

public class Judge extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String studentId = req.getParameter("studentId");
		String refuseSql = "UPDATE leave_application SET judge = '2' WHERE judge='1' AND studentId="+studentId;
		JDBCTools.update(refuseSql);
		resp.sendRedirect("html/teacher/content.jsp");
	}
}
