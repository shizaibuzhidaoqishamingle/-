<%@page import="com.slms.javabeans.Application"%>
<%@page import="java.util.List"%>
<%@page import="com.slms.javabeans.TeacherLogin"%>
<%@page import="com.slms.javabeans.Student"%>
<%@page import="com.slms.jdbc.JDBCTools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息</title>
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
		padding-left: 75px;
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
<h3 style="color: #5598d8;">班级信息</h3>
	<hr style="">
	<div class="bbox">
		<table>
			<tr>
				<td>级别</td>
				<td>班级名称</td>
				<td>学生人数</td>
				<td>缺勤人数</td>
			</tr>
			<%
				out.println("<tr>");
				//获取该老师对应的年级
				out.println("<td>");
				//获取老师id
				String teacherId = session.getAttribute("teacherId").toString();
				String gradeSql = "SELECT grade FROM teacher WHERE teacherId=" + teacherId;
				List<TeacherLogin> gradeList = JDBCTools.query(TeacherLogin.class, gradeSql);
				out.println(gradeList.get(0).getGrade());
				out.println("</td>");
				
				//获取该老师对应的班级
				out.println("<td>");
				//获取老师id
				String classSql = "SELECT className FROM teacher WHERE teacherId=" + teacherId;
				List<TeacherLogin> classList = JDBCTools.query(TeacherLogin.class, classSql);
				out.println(classList.get(0).getClassName());
				out.println("</td>");
				
				//根据student表，获取该班学生人数
				out.println("<td>");
				String stuSql = "SELECT className FROM student WHERE className="+classList.get(0).getClassName();
				List<Student> stuList = JDBCTools.query(Student.class, stuSql);
				out.println(stuList.size());
				out.println("</td>");

				//获取该班缺勤人数
				out.println("<td>");
				String lostSql = "SELECT studentName FROM leave_application WHERE className=" + classList.get(0).getClassName() + 
						" AND judge = '3' ";
				List<Application> lostList = JDBCTools.query(Application.class, lostSql);
				out.println(lostList.size());
				out.println("</td>");
				
			%>
		</table>
	</div>
</body>
</html>