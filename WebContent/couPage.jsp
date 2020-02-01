<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>课程信息</h1>
				<span><a href="addCoursePage.jsp">添加人员</a></span>
				<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
					<thead>
						<td>课程编号</td>
						<td>课程名称</td>
						<td>操作</td>
					</thead>
					
					<%
						String sql = "select * from CourseTable";
						ResultSet rs = db.selectexecute(sql, null);
						while(rs.next()){
							String cn = rs.getString("classname");
							String cid = rs.getString("classid");
					%>
					<tr>
						<td><%=cn %></td>
						<td><%=cid %></td>
						<td><a href="updateCouresPage.jsp?ID=<%=cid %>"> 修改 </a><a href="DeleteCouresServlet?ID=<%=cid %>"> 删除 </a></td>
					</tr>
					<%	
						}
					%>
				</table>
			</div>
		</section>
	</body>
</html>