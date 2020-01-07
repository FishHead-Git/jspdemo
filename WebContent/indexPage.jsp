<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- http://localhost:8080/JspStudentDemo/index.jsp --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录</title>
	</head>
	<style type="text/css">
		body{
			margin: 0;
			padding: 0;
			background-color: #042331;
		}
		
		.loginBox{
			width: 35%;
			height: auto;
			padding: 40px;
			position: absolute;
			background-color: #191919;
			top: 50%;
			left:50%;
			color: white;
			transform: translate(-50%, -50%);
			border: 5px solid lightgreen;
			border-radius: 20px;
			text-align: center;
		}
		
		.loginBox input[type="text"], .loginBox input[type="password"]{
			border: 0;
			background: none;
			display:block;
			margin: 20px auto;
			text-align:center;
			border:4px solid #3498db;
			width:200px;
			outline: none;
			color: white;
			border-radius: 20px;
			transition: 0.2s;
		}
		
		.loginBox input[type="text"]:focus, .loginBox input[type="password"]:focus{
			width: 250px;
			border-color: #2ecc71;
			
		}
		
		.loginBox input[type="submit"], input[type="button"]{
			border: 0;
			background: none;
			display: block;
			margin: 20px auto;
			text-align:center;
			border:4px solid #3498db;
			width: 90px;
			outline: none;
			color: white;
			border-radius: 20px;
			transition: 0.2s;
		}
		
		.loginBox input[type="submit"]:hover, input[type="button"]:hover{
			border-color: #2ecc71;
		}
		
	</style>
	<script type="text/javascript">
		function actionAjax(){
			console.log('ajax')
			if(checkInput() == false)
				return false;
			var username = trimtostring(document.getElementById('username').value);
			var password = trimtostring(document.getElementById('password').value);
			//alert("true  "+trimtostring(username)+":"+trimtostring(password))
			
			var action_url = document.getElementsByName('loginfrom')[0].getAttribute('action')
			var amsg = 'username=' + username + "&password=" + password
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = xhr.responseText
					if(result.substring(0, 9) == "Redirect:"){
						console.log(result.substring(9))
						window.location.href = result.substring(9);
					}else{
						setMsg('msg:'+ result)
					}
				}
			}
			
			xhr.open('post', action_url, true)
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
			xhr.send(amsg)
			
			return  false;
		
		}
		
		function checkInput(){
			console.log('check')
			var username = document.getElementById('username').value;
			var password = document.getElementById('password').value;
			if(trimtostring(username) == ""){
				setMsg("请输入用户名：")
				document.getElementById('username').focus();
				return false;
			}
			
			if(trimtostring(password) == ""){
				setMsg("请输入密码：")
				document.getElementById('password').focus();
				return false;
			}
			
			return true;
		}
		
		function registerAjax(){
			window.location.href="register.jsp"
		}
		
		function trimtostring(str){
			return str.replace(/\W+/, '')
		}
		
		function setMsg(msg){
			
			document.getElementById("msg").innerHTML = msg;
		}
	</script>
	<body>
		<div class="loginBox">
			<from methor="post" action="LoginServlet" name="loginfrom" >
				<h2>Login</h2>
				<input type="text" maxlength="30" id="username" name="username" placeholder="username">
				<input type="password" maxlength="20" id="password" name="password" placeholder="password">
				<input type="button" value="登录" onclick="actionAjax()">
				<input type="button" value="注册" onclick="registerAjax()">
				<div id="msg"></div>
			</from>
		</div>
		
	</body>
</html>