<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>功能列表</title>
<style>
	body{
		background-color: #e9ecf5;
	}
	a{
		text-decoration: none;
	}
	li{
		list-style-type: none;
	}
	.list{
		width: 300px;
		height: 220px;
		margin-left: 20px;
		background-color: #fff;
		border-radius: 5px;
		margin-top: 10px;
	}
	.list h3{
		display: inline-block;
		margin-left: 20px;
		margin-top: 20px;
		color: #5d8dc2;
	}
	.con ul li a{
		
		font-size: 16px;
	}
	.con li{
		overflow: hidden;
	}
	.letter{
		width: 260px;
		height: 45px;
		line-height: 45px;
		margin-top: 2px;
		display: inline-block;
		background-color: #f2f6f9;
		padding-left: 10px;
		color: #7197c6;
		/*padding-bottom: 12px;*/
	}
</style>
</head>
<body>
	<div class="list">
		<h3>功能列表</h3>
		<div class="con">
			<ul>
				<li><a class="letter" href="content.jsp" target="right">申请假条</a></li>
				<li><a class="letter" href="mynote.jsp" target="right">我的假条</a></li>
				<li><a class="letter" href="../../index.jsp" target="_parent">退出系统</a></li>
			</ul>
		</div>
		
	</div>
</body>
</html>