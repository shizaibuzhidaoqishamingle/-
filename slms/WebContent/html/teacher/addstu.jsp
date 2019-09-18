<%@page import="java.util.List"%>
<%@page import="com.slms.javabeans.TeacherLogin"%>
<%@page import="com.slms.jdbc.JDBCTools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
		body{
		background-color: #e9ecf5;
		}
		.house{
		width: 100%;
		background-color: #d2e9ff;
		border-radius: 5px;
		margin: 0 auto;
		height: 600px;
		}
		table{
			width: 600px;
			margin: 0 auto;
		}
		.shiying{
			width: 350px;
			height: 25px;
		}
		.shiying1{
			width: 354.8px;
			height: 25px;
		}
		.tijiao{
			width: 100px;
			height: 25px;
			color: #fff;
			background-color: #148fcb;
			border: 1px solid #148fcb;
		}
		td{
			padding-top: 20px;
		}
		span{
			color: #6b6b6b;
		}
	</style>
</head>
<body>
<h3 style="color: #5598d8;">添加学生</h3>
	<hr>
	<form action="../../addStudent" method="post">
	<div class="house">
		<table>
			<tr>
				<td><span>学号</span></td>
				<td><input type="text" name="studentId" placeholder="请输入八位学号" class="shiying"></td>
			</tr>
			<tr>
				<td><span>姓名</span></td>
				<td><input type="text" name="name" placeholder="请输入学生姓名" class="shiying"></td>
			</tr>
			<tr>
				<td><span>手机号</span></td>
				<td><input type="text" name="phone" placeholder="请输入学生手机号" class="shiying"></td>
			</tr>
			<tr>
				<td>
					<input name="grade" type="hidden" value= <%
						String teacherId = session.getAttribute("teacherId").toString();
						String gradeSql = "SELECT grade FROM teacher WHERE teacherId=" + teacherId;
						List<TeacherLogin> gradeList = JDBCTools.query(TeacherLogin.class, gradeSql);
						out.println(gradeList.get(0).getGrade());%> >
				</td>
			</tr>
			<tr>
				<td>
					<input name="className" type="hidden" value=<%
						String classSql = "SELECT className FROM teacher WHERE teacherId=" + teacherId;
						List<TeacherLogin> classList = JDBCTools.query(TeacherLogin.class, classSql);
						out.println(classList.get(0).getClassName()); %> /> 
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="" value="添加信息" class="tijiao"></td>
			</tr>
		</table>
	</div>
	</form>

</body>
</html>