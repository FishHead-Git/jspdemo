<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>个人信息</h1>
				<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
					<%
						String sql = "select * from studenttable";
						Map values = new HashMap();
						values.put("studentname", user);
						ResultSet rs = db.selectexecute(sql, values);
						if(rs.next()){
							out.print("<tr><td>姓名</td><td>"+rs.getString("studentname")+"</td></tr>");
							out.print("<tr><td>学号</td><td>"+rs.getString("studentid")+"</td></tr>");
							out.print("<tr><td>手机号</td><td>"+rs.getString("phone")+"</td></tr>");
							out.print("<tr><td>邮箱</td><td>"+rs.getString("email")+"</td></tr>");
							session.setAttribute("studentid", rs.getString("studentid"));
						}
					%>
				</table>
			</div>
		</section>
	</body>
</html>