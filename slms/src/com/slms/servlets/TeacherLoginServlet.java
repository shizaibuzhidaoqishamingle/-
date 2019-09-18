package com.slms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slms.jdbc.JDBCTools;

public class TeacherLoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String teacherId = request.getParameter("teacherId");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		session.setAttribute("teacherId", teacherId);
		
		try {
			if (JDBCTools.teacherLoginCheck(teacherId, password)) {
				//servlet将页面跳转到主页
				response.sendRedirect("html/teacher/index.jsp");
			}else{
				response.sendRedirect("loginfailed.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
