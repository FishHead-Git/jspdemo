<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>成绩信息</h1>
				<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
					<thead>
						<td>成绩id</td>
						<td>课程名称</td>
						<td>成绩</td>
					</thead>
					
					<%
						String sql = "select * from scoretable";
						Map values = new HashMap();
						values.put("studentid", (String)session.getAttribute("studentid"));
						ResultSet rs = db.selectexecute(sql, values);
						while(rs.next()){
							out.print("<tr>");
							out.println("<td>"+rs.getString("scoreid")+"</td>");
							
							String cid = rs.getString("classid");
							String csql = "select classname from coursetable where classid="+cid;
							ResultSet crs = db.selectexecute(csql, null);
							if(crs.next()){
								out.println("<td>"+crs.getString("classname")+"</td>");
							}
							
							
							out.println("<td>"+rs.getString("score")+"</td>");
							out.print("</tr>");
						}
					%>
				</table>
			</div>
		</section>
	</body>
</html>