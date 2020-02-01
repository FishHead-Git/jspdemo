<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="sql.DBUtill"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="navbarHeader.jsp" %>
		<section>
			<div class="infoBox">
				<h1>添加成绩</h1>
				<form action="AddScoreServlet" method="post" name="form" onsubmit="return RgTest()">
					<table class="tablediv" width="100%" height="80%" border="0" frame="hsides" cellpadding="50%">
						
						<%
							String sql = "select MAX(scoreid) from scoretable";
							ResultSet rs = db.selectexecute(sql, null);
							if(rs.next()){
								String tr_id = (rs.getInt(1)+1)+"";
						%>
						<tr>
							<td>课程名称</td>
							<td>
								<select name="couresname">
								<%
									String csql = "select * from coursetable";
									ResultSet crs = db.selectexecute(csql, null);
									while(crs.next()){
										String op_cn = crs.getString("classname");
										String op_cid = crs.getString("classid");
										%>
									<option value="<%=op_cid %>"><%=op_cn %></option>
										<%
									}
								%>
							</select>
							</td>
						</tr>
						<tr>
							<td>课程编号</td>
							<input type="hidden" value="<%=(String)session.getAttribute("studentid") %>" name="studentid" />
							<td><input type="hidden" value="<%=tr_id %>" name="id" ><%=tr_id %></td>
						</tr>
						<tr>
							<td>课程成绩</td>
							<td><input type="text" name="score" ></td>
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
			if(document.form.score.value == ""){
				alert("请输入课程成绩")
				console.log('fail submit score empty')
				document.form.score.focus()
				return false
			}
			
			if(document.form.score.value <= "100" && document.form.score.value >= "0"){
				alert("课程成绩应该在(100~0之间)")
				console.log('fail submit score empty')
				document.form.score.focus()
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