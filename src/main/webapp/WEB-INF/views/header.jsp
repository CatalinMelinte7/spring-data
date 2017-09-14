<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

li {
	display: inline:
}
</style>
</head>
<body>

<ul>
	<li> <a href="/jpa">Home</a> </li>
	<% if(session.getAttribute("LOGGEDIN_USER") == null){ %>
	<li> <a href="login">Login</a> </li>
	<% } else { %>
	<li> <a href="friends">Friends</a> </li>
	<li> <a href="messages"> Messages</a> </li>
	<li> <a href="main">Main</a> </li>
	<li> <a href="logout">Logout</a> </li>
	<% } %>
</ul>
</body>
</html>