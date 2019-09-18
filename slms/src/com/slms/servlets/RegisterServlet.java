package com.slms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.slms.jdbc.JDBCTools;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String studentId = request.getParameter("studentId");
		String studentName = request.getParameter("name");
		String password = request.getParameter("password");
		String grade = request.getParameter("grade");
		String className = request.getParameter("className");
		String phone = request.getParameter("phone");
		//String academy = request.getParameter("academy");
		
		String sql = "INSERT INTO student (studentId,name,password,grade,className,phone) "
				+ "VALUES(?,?,?,?,?,?)";
		
		JDBCTools.update(sql,studentId,studentName,password,grade,className,phone);
		response.sendRedirect("login.jsp");
	}

}
