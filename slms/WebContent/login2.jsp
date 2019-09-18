<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
	<meta charset="utf-8">
	<title>教师登录</title>
	<script src="js/register.js"></script>
	<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
</head>
<body>
	<table class="main" border="0" cellspacing="0" cellpadding="0">
		<tr>
		
			<td class="hr_1">教师登录</td>
		</tr>
		<tr>
			<td style="height:15px;"></td>
		</tr>
		<form action="teacherLoginServlet" method="post" name="myform">
		<tr>
			<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="left">账号：</td>
			<td class="center"><input name="teacherId" id="user" type="text" class="in" onblur="checkUser()" /></td>
			<td><div id="user_prompt">请输入您的职工号</div></td>
		</tr>
		<tr>
			<td class="left">密码：</td>
			<td class="center"><input name="password" id="pwd" type="password" class="in"  onblur="checkPwd()"/></td>
			<td><div id="pwd_prompt">密码由英文字母和数字组成的4-10位字符</div></td>
		</tr>
		<tr>
			<td colspan="3" class="zhuce"><input type="submit" value="登录" class="on"></td>
		</tr>
</body>
</html>