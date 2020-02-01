<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>人员信息</h1>
				<span><a href="addPage.jsp">添加人员</a></span>
				<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
					<thead>
						<td>姓名</td>
						<td>学号</td>
						<td>手机号</td>
						<td>邮箱</td>
						<td>操作</td>
					</thead>
					
					<%
						String sql = "select * from studenttable";
						ResultSet rs = db.selectexecute(sql, null);
						while(rs.next()){
							String stn = rs.getString("studentname");
							String stid = rs.getString("studentid");
							String phone = rs.getString("phone");
							String email = rs.getString("email");
					%>
					<tr>
						<td><%=stn %></td>
						<td><%=stid %></td>
						<td><%=phone %></td>
						<td><%=email %></td>
						<td><a href="updatePersonPage.jsp?ID=<%=stid %>"> 修改 </a><a href="DeletePersonServlet?Name=<%=stn %>"> 删除 </a></td>
					</tr>
					<%	
						}
					%>
				</table>
			</div>
		</section>
	</body>
</html>