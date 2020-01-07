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
		
		.RegisterBox{
			width: 35%;
			height: auto;
			padding: 40px;
			position: absolute;
			background-color: #191919;
			top: 50%;
			left:50%;
			color: white;
			transform: translate(-50%, -50%);
			border: 5px solid #ccc;
			border-radius: 20px;
			text-align: center;
		}
		
		.RegisterBox input[type="text"], .RegisterBox input[type="password"], .RegisterBox input[type="email"]{
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
		
		.RegisterBox input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus{
			width: 250px;
			border-color: #2ecc71;
			
		}
		
		.RegisterBox input[type="submit"], input[type="button"]{
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
		
		.RegisterBox input[type="submit"]:hover, input[type="button"]:hover{
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
			var studentid = trimtostring(document.getElementById('studentid').value);
			var phone = trimtostring(document.getElementById('phone').value);
			var email = document.getElementById('email').value;
			//alert("true  "+trimtostring(username)+":"+trimtostring(password))
			
			var action_url = document.getElementsByName('Registerfrom')[0].getAttribute('action')
			var amsg = 'username=' + username 
			+ "&password=" + password
			+ "&studentid=" + studentid
			+ "&phone=" + phone
			+ "&email=" + email
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
			var confirm = document.getElementById('confirm').value;
			var phone = trimtostring(document.getElementById('phone').value);
			var email = trimtostring(document.getElementById('email').value);
			var studentid = trimtostring(document.getElementById('studentid').value);
			if(trimtostring(username) == ""){
				setMsg("请输入用户名：")
				document.getElementById('username').focus();
				return false;
			}
			
			if(trimtostring(studentid) == ""){
				setMsg("请输入学号：")
				document.getElementById('studentid').focus();
				return false;
			}
			
			if(trimtostring(password) == ""){
				setMsg("请输入密码：")
				document.getElementById('password').focus();
				return false;
			}
			
			if(trimtostring(confirm) == ""){
				setMsg("请输入确认密码：")
				document.getElementById('confirm').focus();
				return false;
			}
			
			if(trimtostring(phone) == ""){
				setMsg("请输入移动电话：")
				document.getElementById('phone').focus();
				return false;
			}
			
			if(trimtostring(email) == ""){
				setMsg("请输入邮箱：")
				document.getElementById('email').focus();
				return false;
			}
			
			if(trimtostring(confirm) != trimtostring(password)){
				setMsg("输入的密码与确认密码不一致：")
				document.getElementById('password').focus();
				return false;
			}
			
			return true;
		}
		
		function indexAjax(){
			window.location.href="index.jsp"
		}
		
		function trimtostring(str){
			return str.replace(/\W+/g, '')
		}
		
		function setMsg(msg){
			
			document.getElementById("msg").innerHTML = msg;
		}
	</script>
	<body>
		<div class="RegisterBox">
			<from methor="post" action="RegisterCheck" name="Registerfrom" >
				<h2>Register</h2>
				<input type="text" maxlength="30" id="username" name="username" placeholder="username">
				<input type="text" maxlength="10" id="studentid" name="studentid" placeholder="studentid">
				<input type="password" maxlength="20" id="password" name="password" placeholder="password">
				<input type="password" maxlength="20" id="confirm" name="confirm" placeholder="confirm">
				<input type="text" maxlength="11" id="phone" name="phone" placeholder="phone">
				<input type="email" maxlength="20" id="email" name="email" placeholder="email">
				<input type="button" value="注册" onclick="actionAjax()">
				<input type="button" value="返回登录" onclick="indexAjax()">
				<div id="msg"></div>
			</from>
		</div>
		
	</body>
</html>