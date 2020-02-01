<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>修改课程信息</h1>
				<form action="UpdateCourseServlet" method="post" name="form" onsubmit="return RgTest()">
					<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
						
						<%
							String id = request.getParameter("ID");
							if(id == null)
								response.sendRedirect("couPage.jsp");
							String sql = "select * from coursetable";
							Map values = new HashMap();
							values.put("classid", id);
							ResultSet rs = db.selectexecute(sql, values);
							if(rs.next()){
								String cn = rs.getString("classname");
								String cid = rs.getString("classid");
						%>
						<tr>
							<td>课程名称</td>
							<td><input type="text" value="<%=cn %>" name="name" ></td>
						</tr>
						<tr>
							<td>课程编号</td>
							<td><input type="hidden" value="<%=cid %>" name="id" ><%=cid %></td>
						</tr>
						<tr>
							<td><input type="submit" value="提交" ></td>
							<td><input type="reset" value="重置" ></td>
						</tr>
						<%	
							}
						%>
					</table>
				</form>
			</div>
		</section>
	</body>
	<script type="text/javascript">
		function RgTest(){
			console.log('rgtest')
			if(document.form.name.value == ""){
				alert("请输入课程名称")
				console.log('fail submit name empty')
				document.form.name.focus()
				return false
			}
			if(document.form.id.value == ""){
				alert("请输入课程编号")
				document.form.id.focus()
				return false
			}
			console.log('success submit')
			return true
		}
	</script>
</html>