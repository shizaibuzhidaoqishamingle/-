package com.slms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.slms.jdbc.JDBCTools;

public class AddStudent extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String studentId = request.getParameter("studentId");
		String name= request.getParameter("name");
		String grade = request.getParameter("grade");
		String className = request.getParameter("className");
		String phone = request.getParameter("phone");
		System.out.println(name);
		
		String sql= "INSERT INTO student(studentId, name, grade, className, phone) "
				+ "VALUES(?,?,?,?,?)";
		JDBCTools.update(sql, studentId,name,grade,className,phone);
		
		response.sendRedirect("html/teacher/addstu.jsp");
	}

}
