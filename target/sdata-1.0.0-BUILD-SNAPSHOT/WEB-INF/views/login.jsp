<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<br/>
	Username:
	<br />
	<input type="text" id="username" /> 
	<br/>
	Password
	<br />
	<input type="text" id="password" />
	<br />
	<input type="submit" id="login" value="Login" />
	<br />
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$('#login').click(function() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var data = {"username":  username, "password" :  password};
		$.ajax({
			url : 'http://localhost:8080/jpa/login',
			type : 'post',
			dataType : 'json',
			async : true,
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			success : function(data) {
				window.location.replace("http://localhost:8080/jpa");
			},
			failure : function(data) {
			}
		});
	});
</script>
</html>