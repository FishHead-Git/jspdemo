<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="db" class="sql.DBUtill" scope="request" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>管理系统</title>
	</head>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
			list-style: none;
			text-decoration: none;
		}
		
		.sidebar{
			position: fixed;
			left: -250px;
			width: 250px;
			height: 100%;
			background: #042331;
			transition: left .5s;
		}
		
		.sidebar header{
			font-size: 22px;
			color: white;
			text-align: center;
			line-height: 70px;
			background: #063146;
			user-select: none;
		}
		
		.sidebar ul a{
			display: block;
			height: 100%;
			width: 100%;
			line-height: 65px;
			font-size: 20px;
			color: white;
			padding-left: 40px;
			box-sizing: border-box;
			border-top: 1px solid rgba(255, 255, 255, .1);
			border-bottom: 1px solid black;
			transition: .4s
		}
		
		ul li:hover a{
			padding-left: 50px;
		}
		
		#check{
			position: absolute;
			background: #3498db;
			left: 0px;
			transition: left .5s;
		}
		
		#check:checked ~ .sidebar{
			left: 0;
		}
		
		#check:checked ~ section{
			margin-left: 250px;
		}
		
		#check:checked{
			z-index: 1;
			left: 240px;
			transition: left .5s;
		}
		
		section{
			background: url(resource/img.jpg) no-repeat;
			background-size: cover;
			background-position: center;
			height: 100vh;
			transition: all .5s;
			
		}
		
		.infoBox{
			width: 75%;
			height: 75%;
			padding: 40px;
			position: relative;
			background-color: rgba(0,0,0,0.7);
			top: 50%;
			left:50%;
			color: white;
			transform: translate(-50%, -50%);
			border: 5px solid #ccc;
			border-radius: 20px;
			text-align: center;
		}
	</style>
	<body>
		<input type="checkbox" id="check" checked="checked">
		<div class="sidebar">
			<header>
				<%
					String user = (String)session.getAttribute("username");
					if(user == null){
						response.sendRedirect("indexPage.jsp");
					}else{
						out.print("Hello " + user);
					}
				%>
			</header>
			<ul>
				<li><a href="mainPage.jsp" id="mainPage">个人信息</a></li>
				<li><a href="peoPage.jsp" id="peoPage">人员管理</a></li>
				<li><a href="couPage.jsp" id="couPage">课程管理</a></li>
				<li><a href="scoPage.jsp" id="scoPage">成绩管理</a></li>
				<li><a href="addScorePage.jsp" id="addScorePage">课程申报</a></li>
				<li><a href="QuitServlet">退出</a></li>
			</ul>
		</div>
		