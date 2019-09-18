<%@page import="com.slms.javabeans.MyApplication"%>
<%@page import="com.slms.javabeans.Student"%>
<%@page import="com.slms.javabeans.Application"%>
<%@page import="java.util.List"%>
<%@page import="com.slms.jdbc.JDBCTools"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的假条</title>
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
		padding-left: 65px;
		color: #6b6b6b;
	}
</style>
</head>
<body>
	<h3 style="color: #5598d8;">我的假条</h3>
	<hr style="">
	<div class="bbox">
		<table>
			<thead>
				<tr>
					<td>学号</td>
					<td>姓名</td>
					<td>开始时间</td>
					<td>结束时间</td>
					<td>联系方式</td>
					<td>审批状态</td>
				</tr>
			</thead>
			<tbody id="tbMain">
			<%
				String studentId = session.getAttribute("studentId").toString();
				//查看自己请的所有假
				String sql = "SELECT studentId,studentName,phoneNumber,startTime,endTime,judge FROM " +
				"leave_application WHERE studentId=" + studentId;
				List<Application> myList = JDBCTools.query(Application.class, sql);
				
				for(int i=0; i<myList.size();i++){
					out.println("<tr>");
					//输出申请状态下的
					if(myList.get(i).getJudge().equals("1")){
							out.println("<td>" + myList.get(i).getStudentId() + "</td>");
							out.println("<td>" + myList.get(i).getStudentName()  + "</td>");
							out.println("<td>" + myList.get(i).getStartTime() + "</td>");
							out.println("<td>" + myList.get(i).getEndTime() + "</td>");
							out.println("<td>" + myList.get(i).getPhoneNumber() + "</td>");
							out.println("<td> 审核中 </td>");
						}if(myList.get(i).getJudge().equals("2")){
							out.println("<td>" + myList.get(i).getStudentId() + "</td>");
							out.println("<td>" + myList.get(i).getStudentName()  + "</td>");
							out.println("<td>" + myList.get(i).getStartTime() + "</td>");
							out.println("<td>" + myList.get(i).getEndTime() + "</td>");
							out.println("<td>" + myList.get(i).getPhoneNumber() + "</td>");
							out.println("<td> 未通过 </td>");
						}if(myList.get(i).getJudge().equals("3")){
							out.println("<td>" + myList.get(i).getStudentId() + "</td>");
							out.println("<td>" + myList.get(i).getStudentName()  + "</td>");
							out.println("<td>" + myList.get(i).getStartTime() + "</td>");
							out.println("<td>" + myList.get(i).getEndTime() + "</td>");
							out.println("<td>" + myList.get(i).getPhoneNumber() + "</td>");
							out.println("<td> 已通过 </td>");
						}
					out.println("</tr>");
					}
				
			%>
			</tbody>
		</table>
	</div>
	
</body>
</html>