<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>功能列表</title>
<style>
	a{
		text-decoration: none;
	}
	li{
		list-style-type: none;
		margin-bottom: 20px;
	}
	.list{
		width: 300px;
		height: 500px;
		margin-left: 20px;
		background-color: #fff;
		border-radius: 5px;
		margin-top: 10px;
	}
	.list h4{
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
	li ul {
		position: absolute;
		left: 13%;
		display: none;
		z-index: 1;
	}
	li:hover ul {
		display: block;
	}
	.erji a{
		color: #7197c6;
	}
</style>
</head>
<body>
	<div class="list">
		<h4>功能列表</h4>
		<div class="con">
			<ul>
				<li><a class="letter" href="content.jsp" target="right">请假管理</a></li>
				<li><a class="letter" class="letter" href="stumessage.jsp" target="right">学生信息</a></li>
				<li><a class="letter" href="clamessage.jsp" target="right">班级信息</a></li>
				<li><a class="letter" href="addstu.jsp" target="right">添加学生信息</a></li>
				<li><a class="letter" href="../../index.jsp" target="_parent">退出系统</a></li>
			</ul>
		</div>
		
	</div>
</body>
</html>