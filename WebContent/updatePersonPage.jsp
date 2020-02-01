<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>修改人员</h1>
				<form action="UpdatePersonServlet" method="post" name="form" onsubmit="return RgTest()">
					<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
						
						<%
							String id = request.getParameter("ID");
							if(id == null)
								response.sendRedirect("peoPage.jsp");
							String sql = "select * from studenttable";
							Map values = new HashMap();
							values.put("studentid", id);
							ResultSet rs = db.selectexecute(sql, values);
							if(rs.next()){
								String stn = rs.getString("studentname");
								String stid = rs.getString("studentid");
								String phone = rs.getString("phone");
								String email = rs.getString("email");
						%>
						<tr>
							<td>姓名</td>
							<td><input type="text" value="<%=stn %>" name="name" ></td>
						</tr>
						<tr>
							<td>学号</td>
							<td><input type="hidden" value="<%=stid %>" name="id" ><%=stid %></td>
						</tr>
						<tr>
							<td>手机号</td>
							<td><input type="text" value="<%=phone %>" name="phone" ></td>
						</tr>
						<tr>
							<td>邮箱</td>
							<td><input type="email" value="<%=email %>" name="email" ></td>
							
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
				alert("请输入姓名")
				console.log('fail submit name empty')
				document.form.name.focus()
				return false
			}
			if(document.form.id.value == ""){
				alert("请输入学号")
				document.form.id.focus()
				return false
			}
			if(document.form.phone.value == ""){
				alert("请输入手机号")
				document.form.phone.focus()
				return false
			}
			if(document.form.email.value == ""){
				alert("请输入邮箱")
				document.form.email.focus()
				return false
			}
			console.log('success submit')
			return true
		}
	</script>
</html>