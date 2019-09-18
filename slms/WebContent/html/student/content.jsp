<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="student.js"></script>
<title>请假假条页面</title>
</head>
<style>
	body{
		background-color: #e9ecf5;
	}
	.house{
		width: 100%;
		
		background-color: #d2e9ff;
		border-radius: 5px;
		margin: 0 auto;
	}
	.table{
		width: 650px;
		margin: 0 auto;
	}
	.table td{
		padding-top: 20px;
	}
	h3{
		margin-left: 20px;
		font-size: 22px;
		color: #198b89;
	}
	.one{
		color: #6b6b6b;
	}
	.two{
		height: 25px;
		width: 400px;
	}
	.three{
		height: 35px;
		width: 100px;
		background-color: #148fcb;
		border: 1px solid #148fcb;
		color: #fff;
		font-size: 17px;
	}
	span{
		color:#e85d7a;
    	font-size: 12px;
	}
</style>
<body>
<h3 style="color: #5598d8;"></>假条申请</h3>
	<hr style="">
	<form action="../../leaveApplicationServlet" method="post">
	<div class="house">
		<table class="table">
		<tr>
			<td class="one" width="18%">学号</td>
			<td><input name="studentId" class="two" id="txtstu" type="text" placeholder="请输入学号" onblur="Stu()"></td>
			<td><span id="span_stu">由8位数字组成</span></td>
			
		</tr>
		<tr>
			<td class="one">姓名</td>
			<td><input name="studentName" class="two" id="txtname" type="text" placeholder="请输入姓名" onblur="Name()"></td>
			<td><span id="span_name">由2-6个汉字组成</span></td>
		</tr>
		
		<tr>
			<td class="one">班级</td>
			<td><input name="className" class="two" id="txtclass" type="text" placeholder="请输入班级" onblur="Cla()"></td>
			<td><span id="span_class">由6位数字组成</span></td>
		</tr>
		<tr>
			<td class="one">手机号</td>
			<td><input name="phone" class="two" id="txtphone" type="text" placeholder="请输入手机号" onblur="checkPhone()"></td>
			<td><span id="span_phone">由11位数字组成</span></td>
		</tr>

		<tr>
			<td class="one">开始时间</td>
			<td>
				<select name="startYear" id="">
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
				</select>
				<select name="startMonth" id="" >
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="startDay" id="" >
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="13">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					
				</select>
			</td>
		</tr>
		<tr>
			<td class="one">结束时间</td>
			<td>
				
				<select name="endYear" id="">
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
				</select>
				<select name="endMonth" id="" >
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="endDay" id="" >
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="13">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					
				</select>
			</td>
		</tr>
		<tr>
			<td class="one">请假原因</td>
			<td><textarea name="reason" id="" cols="46px" rows="9" placeholder="请输入请假原因" ></textarea></td>
		</tr>
		<tr>
			<td class="one">请假负责人</td>
			<td><input name="teacher" class="two" type="text" placeholder=""></td>
		</tr>
			<input type="hidden" value="1" name="judge" />
			<td></td>
			<td><input class="three" type="submit" value="提交假条"></td>
		</tr>
	</table>
	</div>
	</form>
</body>
</html>