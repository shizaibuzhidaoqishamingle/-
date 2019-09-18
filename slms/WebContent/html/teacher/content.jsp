<%@page import="java.util.Calendar"%>
<%@page import="com.slms.javabeans.TimeBean"%>
<%@page import="com.slms.javabeans.Application"%>
<%@page import="com.slms.jdbc.JDBCTools"%>
<%@page import="com.slms.javabeans.TeacherLogin"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假情况查看</title>
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
	.top{
		height: 130px;
		padding-top: 20px;
	}
	.today{
		height: 100px;
		width: 22%;
		float: left;
		margin-right: 4%;
		border-radius: 20px;
		background-color: #3598dc;
	}
	.yesterday{
		height: 100px;
		width: 22%;
		float: left;
		margin-right: 4%;
		border-radius: 20px;
		background-color: #e74f5b;
	}
	.week{
		height: 100px;
		width: 22%;
		float: left;
		margin-right: 4%;
		border-radius: 20px;
		background-color: #46cbd2;
	}
	.month{
		height: 100px;
		width: 22%;
		float: left;
		border-radius: 20px;
		background-color: #8d44af;
	}
	p{
		color: #fff;
		font-size: 20px;
		margin-left: 10px;
	}
	.down{
		height: 450px;
	}
	.juti{
		width: 100%;
		height: 350px;
		background-color: #fff;
		float: left;
		border-radius: 20px;
		margin-right: 4%;
	}
	.renwu{
		width: 48%;
		height: 350px;
		border-radius: 20px;
		background-color: #fff;
		float: left;
	}
	.but{
		float: right;
		margin-right: 10px;
		margin-top: 10px;
		border-radius: 3px;
	}
	span{
		display: inline-block;
		margin-left: 15px;
		margin-top: 10px;
		color: #3283bb;
	}
	.hang{
		/*display: inline-block;*/
		width: 96%;
		margin: 0 auto;
	}
	table{
		width: 96%;
		margin: 0 auto;
	}
	tr{
		height: 40px;
	}
	h3{
		font-size: 22px;
		color: #5598d8;
	}
</style>
</head>
<body>
<h3>请假管理</h3>

	<hr>
	<div class="house">
		<div class="top">
			<div class="today">
				<p>今日请假数
				<%
					//获取老师id
					String teacherId = session.getAttribute("teacherId").toString();
					String sql = "SELECT className FROM teacher WHERE " +
					"teacherId="+teacherId;
					//获取该老师所拥有的信息
					List<TeacherLogin> list = JDBCTools.query(TeacherLogin.class, sql);
					
					String sql2 = "SELECT studentName,studentId,phoneNumber,startTime,endTime,leaveReason,judge FROM " 
							+ "leave_application WHERE className="+list.get(0).getClassName();
					
					//查询与该老师相对应的的所有学生请假信息
					List<Application> teacherStudentlist = JDBCTools.query(Application.class,sql2);
				
					//获取今天请假记录
					String sqlTodayTime = "SELECT startTime,endTime FROM leave_application " + 
					"WHERE current_date() BETWEEN startTime AND endTime AND judge='3'";
					List<TimeBean> todayTime = JDBCTools.query(TimeBean.class, sqlTodayTime);
					out.println(todayTime.size());
				%>
				</p>
			</div>
			<div class="yesterday">
				<p>昨日请假数
				<%
					String yesterdaySql = "SELECT startTime,endTime FROM leave_application " +
						"WHERE date_sub(curdate(),INTERVAL 1 DAY) BETWEEN startTime AND endTime AND judge='3'";
					List<TimeBean> yesTime = JDBCTools.query(TimeBean.class, sqlTodayTime);
					out.println(yesTime.size());
				%>
				</p>
			</div>
			<div class="week">
				<p>本周请假数
				<%
					String weekSql = "SELECT startTime,endTime FROM leave_application "+
						"WHERE YEARWEEK(date_format(startTime,'%Y-%m-%d')) = YEARWEEK(now()) AND judge='3'";
					List<TimeBean> weekTim = JDBCTools.query(TimeBean.class, weekSql);
					out.println(weekTim.size());
				%>
				</p>
			</div>
			<div class="month">
				<p>本月请假数
				<%
					String monSql = "SELECT startTime,endTime FROM leave_application " + 
						"WHERE DATE_FORMAT(startTime, '%Y%m' ) = DATE_FORMAT( CURDATE() , '%Y%m' ) AND judge='3'";
					List<TimeBean> monTime = JDBCTools.query(TimeBean.class, monSql);
					out.println(monTime.size());
				%>
				</p>
			</div>
		</div>
		<div class="down">
		<!-- <div class="juti"> -->
			<span>请假具体资料</span>
			<br><br><hr class="hang">
			<table>
				<tr>
					<td style="color: #6b6b6b">学号</td>
					<td style="color: #6b6b6b">姓名</td>
					<td style="color: #6b6b6b">电话号码</td>
					<td style="color: #6b6b6b">请假原因</td>
					<td style="color: #6b6b6b">请假时间</td>
					<td style="color: #6b6b6b">截止时间</td>
					<td style="color: #6b6b6b">处理状态</td>
					<td style="color: #6b6b6b">办理</td>
				</tr>
			
				
					<%
						for(int i=0; i<teacherStudentlist.size();i++){
							
							//输出申请状态下的
							if(teacherStudentlist.get(i).getJudge().equals("1")){
					%>
					<tr>
					<td><%= teacherStudentlist.get(i).getStudentId()%></td>
					<td><%= teacherStudentlist.get(i).getStudentName()%></td>
					<td><%= teacherStudentlist.get(i).getPhoneNumber()%></td>
					<td><%= teacherStudentlist.get(i).getLeaveReason()%></td>
					<td><%= teacherStudentlist.get(i).getStartTime()%></td>
					<td><%= teacherStudentlist.get(i).getEndTime()%></td>
					<td>未办理</td>
					<td><form action="../../passJudge" method="get"><input type="hidden" name="studentId" value=<%= teacherStudentlist.get(i).getStudentId()%> /><input type="submit" value="同意"></form></td>
					<td><form action="../../judge" method="get"><input type="hidden" name="studentId" value=<%= teacherStudentlist.get(i).getStudentId()%> /><input type="submit" value="拒绝"></form></td>
					<% 			}
							}
					%>
				</tr>
				<%
					for(int i=0; i<teacherStudentlist.size();i++){
					if(teacherStudentlist.get(i).getJudge().equals("2")){
				%>
				<tr>
					<td><%= teacherStudentlist.get(i).getStudentId()%></td>
					<td><%= teacherStudentlist.get(i).getStudentName()%></td>
					<td><%= teacherStudentlist.get(i).getPhoneNumber()%></td>
					<td><%= teacherStudentlist.get(i).getLeaveReason()%></td>
					<td><%= teacherStudentlist.get(i).getStartTime()%></td>
					<td><%= teacherStudentlist.get(i).getEndTime()%></td>
					<td> 驳回 </td>
				</tr>
				<%
					}
						}  
				%>
			
				<%
					for(int i=0; i<teacherStudentlist.size();i++){
					if(teacherStudentlist.get(i).getJudge().equals("3")){
				%>
				<tr>
					<td><%= teacherStudentlist.get(i).getStudentId()%></td>
					<td><%= teacherStudentlist.get(i).getStudentName()%></td>
					<td><%= teacherStudentlist.get(i).getPhoneNumber()%></td>
					<td><%= teacherStudentlist.get(i).getLeaveReason()%></td>
					<td><%= teacherStudentlist.get(i).getStartTime()%></td>
					<td><%= teacherStudentlist.get(i).getEndTime()%></td>
					<td> 通过 </td>
				</tr>
				<%
					}
						}  
				%>
			
			
			
			
			
				
				<%-- <%
					for(int i=0; i<teacherStudentlist.size();i++){
						
						//输出申请状态下的
						if(teacherStudentlist.get(i).getJudge().equals("1")){
								out.println("<tr>");
								out.println("<td>" + teacherStudentlist.get(i).getStudentId() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getStudentName()  + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getPhoneNumber() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getLeaveReason() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getStartTime() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getEndTime() + "</td>");
								out.println("<td> 未办理  </td>");
								out.println("<td><a href='../../passJudge'> 同意 </a></td>");
								out.println("<td><a href='../../judge'> 拒绝 </a></td>");
								out.println("</tr>");
							}if(teacherStudentlist.get(i).getJudge().equals("2")){
								out.println("<tr>");
								out.println("<td>" + teacherStudentlist.get(i).getStudentId() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getStudentName()  + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getPhoneNumber() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getLeaveReason() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getStartTime() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getEndTime() + "</td>");
								out.println("<td> 驳回  </td>");
								out.println("</tr>");
							}if(teacherStudentlist.get(i).getJudge().equals("3")){
								out.println("<tr>");
								out.println("<td>" + teacherStudentlist.get(i).getStudentId() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getStudentName()  + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getPhoneNumber() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getLeaveReason() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getStartTime() + "</td>");
								out.println("<td>" + teacherStudentlist.get(i).getEndTime() + "</td>");
								out.println("<td> 通过  </td>");
								out.println("</tr>");
							}
						
						}
				%> --%>
			</table>
		<!-- </div> -->
</body>
</html>