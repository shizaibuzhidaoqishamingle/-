<%@page import="com.slms.javabeans.TeacherLogin"%>
<%@page import="com.slms.jdbc.JDBCTools"%>
<%@page import="com.slms.javabeans.TeacherStudent"%>
<%@page import="com.slms.javabeans.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<style>
	body{
		background-color: #e9ecf5;
	}
	h3{
		margin-left: 20px;
		font-size: 22px;
		color: #198b89;
	}
	.bbox{
		width: 95%;
		margin: 20px auto;
	}
	.bbox td{
		padding-left: 80px;
		color: #6b6b6b;
	}
	.num{
		float: right;
		margin-right: 50px;
		margin-top: 40px;
	}
	a{
		text-decoration: none;
		color: #148fcb;
	}
	.hbox{
		margin-left: 20px;
	}
	.yes{
		background-color: #148fcb;
		border: 1px solid #148fcb;
		color: #fff;
		height: 25px;
		width: 50px;
	}
</style>
</head>
<body>
<h3 style="color: #5598d8;">学生信息</h3>
	<hr style="">
	<div class="bbox">
		<table>
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>联系方式</td>
				<td>删除学生</td>
				<%-- <%
					//获取老师id
					String teacherId = session.getAttribute("teacherId").toString();
					String classSql = "SELECT className FROM teacher WHERE teacherId=" + teacherId;
					List<TeacherLogin> teacherList = JDBCTools.query(TeacherLogin.class, classSql);
					//获取该老师对应班级
					String stuClass = teacherList.get(0).getClassName();
					//根据student表，获取该班学生集合
					String stuSql = "SELECT studentId, name, phone FROM student WHERE className="+stuClass;
					List<Student> stuList = JDBCTools.query(Student.class, stuSql);
					for(int i=0; i<stuList.size();i++){
						out.println("<tr>");
						out.println("<td>" +stuList.get(i).getStudentId()+ "</td>");
						out.println("<td>" +stuList.get(i).getName()+ "</td>");
						out.println("<td>" +stuList.get(i).getPhone()+ "</td>");
						out.println("</tr>");
					}
				%> --%>
				
				
				<%
				//获取老师id
					String teacherId = session.getAttribute("teacherId").toString();
					String classSql = "SELECT className FROM teacher WHERE teacherId=" + teacherId;
					List<TeacherLogin> teacherList = JDBCTools.query(TeacherLogin.class, classSql);
					//获取该老师对应班级
					String stuClass = teacherList.get(0).getClassName();
					//根据student表，获取该班学生集合
					String stuSql = "SELECT studentId, name, phone FROM student WHERE className="+stuClass;
					List<Student> stuList = JDBCTools.query(Student.class, stuSql);
					for(int i=0; i<stuList.size();i++){
				%>	
					
				<tr>
					<td><%= stuList.get(i).getStudentId()%></td>
					<td><%= stuList.get(i).getName()%></td>
					<td><%= stuList.get(i).getPhone()%></td>
					<td><form action="../../deleteStu" method="get"><input type="hidden" name="studentId" value=<%= stuList.get(i).getStudentId()%> /><input type="submit" value="删除"></form></td>
				</tr>
				<%} %>
		</table>
	</div>
</body>
</html>