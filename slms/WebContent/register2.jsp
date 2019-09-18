<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<title>学生注册</title>
	<script src="js/register.js"></script>
	<link rel="stylesheet" type="text/css" href="css/register.css" />
</head>
<body>
	<form action="registerServlet" method="post" name="myform">
	<table class="main" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="hr_1">学生注册</td>
		</tr>
		<tr>
			<td style="height:15px;"></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="left">学号：</td>
			<td class="center"><input name="studentId" id="user" type="text" class="in" onblur="checkUser()" /></td>
			<td><div id="user_prompt">请输入您的八位学号</div></td>
		</tr>
		<tr>
			<td class="left">姓名：</td>
			<td class="center"><input name="name" id="user" type="text" class="in" onblur="checkUser()" /></td>
			<td><div id="user_prompt">请输入您的姓名</div></td>
		</tr>
		<tr>
			<td class="left">密码：</td>
			<td class="center"><input name="password" id="pwd" type="password" class="in"  onblur="checkPwd()"/></td>
			<td><div id="pwd_prompt">密码由英文字母和数字组成的4-10位字符</div></td>
		</tr>
		<tr>
			<td class="left">确认密码：</td>
			<td class="center"><input id="repwd" type="password" class="in"  onblur="checkRepwd()"/></td>
			<td><div id="repwd_prompt"></div></td>
		</tr>
		<tr>
			<td class="left">年级：</td>
			<td class="center">
				<select name="grade">
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
				</select></td>
			<td><div id="repwd_prompt"></div></td>
		</tr>
		<tr>
			<td class="left">班级：</td>
			<td class="center">
				<select name="className">
					<option value="161401">161401</option>
					<option value="161402">161402</option>
					<option value="171401">171401</option>
					<option value="171402">171402</option>
					<option value="181401">181401</option>
					<option value="181402">181402</option>
				</select></td>
			<td><div id="repwd_prompt"></div></td>
		</tr>
		<tr>
			<td class="left">手机号码：</td>
			<td class="center"><input name="phone" id="phone" type="text" class="in" onblur="checkPhone()"/></td>
		</tr>
		<tr>
			<td colspan="2" class="zhuce"><input type="submit" value="注册" class="on"></td>
			<td class="zhuce"> <a href="login.jsp"><input type="button" value="已注册，直接登录" class="on"></a></td>
		</tr>
</html>