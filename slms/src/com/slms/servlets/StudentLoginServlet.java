package com.slms.servlets;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.junit.Test;

import com.slms.javabeans.Student;
import com.slms.jdbc.JDBCTools;

public class StudentLoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String studentId = request.getParameter("studentId");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		session.setAttribute("studentId",studentId);
		
		try {
			if (JDBCTools.loginCheck(studentId, password)) {
				//servlet将页面跳转到主页
				response.sendRedirect("html/student/index.jsp");
			}else{
				response.sendRedirect("loginfailed.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//String sql = "SELECT student_id studentId,password FROM student";
		/*List<Student> list = JDBCTools.query(Student.class, sql);
		for(int i=0 ; i<list.size() ; i++ ) {
			Student student = list.get(i);
			if( (student.getStudentId() == Integer.parseInt(studentId)) && 
					(student.getPassword().equals(password)) ) {
				response.sendRedirect("success.html");
				if( !(student.getStudentId() == Integer.parseInt(studentId) &&
						student.getPassword().equals(password)) ) {
					response.sendRedirect("fail.html");
				}
			}
		}*/
		
	}

}
