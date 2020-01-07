<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int w;
String username = "yjt";
String password = "1234";
%>
<%
	out.print("hello jsp");
	w = 10;
%>
<br />
<table width="200px" border="1" frame="box" cellpadding="50%">
	<% for(int i=0;i<3;i++) {%>
	<tr>
		<td>
			<%=username %>
		</td>
	</tr>
	<%} %>
</table>
<br />
<%=w %>
</body>
</html>