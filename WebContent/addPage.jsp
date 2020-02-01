<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>添加人员</h1>
				<form action="AddPersonServlet" method="post" name="form" onsubmit="return RgTest()">
					<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
						
						<%
							String sql = "select MAX(studentid) from studenttable";
							ResultSet rs = db.selectexecute(sql, null);
							if(rs.next()){
								String tr_id = (Integer.parseInt(rs.getString(1))+1)+"";
						%>
						<tr>
							<td>姓名</td>
							<td><input type="text" name="name" ></td>
						</tr>
						<tr>
							<td>学号</td>
							<td><input type="hidden" name="id" value="<%=tr_id %>"><%=tr_id %></td>
						</tr>
						<tr>
							<td>密码</td>
							<td><input type="password" name="password" ></td>
						</tr>
						<tr>
							<td>确认密码</td>
							<td><input type="password" name="confirm" ></td>
						</tr>
						<tr>
							<td>手机号</td>
							<td><input type="text" name="phone" ></td>
						</tr>
						<tr>
							<td>邮箱</td>
							<td><input type="email"  name="email" ></td>
							
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
			if(document.form.password.value == ""){
				alert("请输入密码")
				document.form.password.focus()
				return false
			}
			if(document.form.confirm.value != document.form.password.value){
				alert("两次密码不一致")
				document.form.password.focus()
				return false
			}
			if(document.form.confirm.value == ""){
				alert("请输入确认密码")
				document.form.confirm.focus()
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