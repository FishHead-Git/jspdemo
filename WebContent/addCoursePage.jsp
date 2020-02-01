<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>添加课程</h1>
				<form action="AddCourseServlet" method="post" name="form" onsubmit="return RgTest()">
					<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
						
						<%
							String sql = "select MAX(classid) from coursetable";
							ResultSet rs = db.selectexecute(sql, null);
							if(rs.next()){
								String tr_id = (rs.getInt(1)+1)+"";
						%>
						<tr>
							<td>课程名称</td>
							<td><input type="text" name="name" ></td>
						</tr>
						<tr>
							<td>课程编号</td>
							<td><input type="hidden" value="<%=tr_id %>" name="id" ><%=tr_id %></td>
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