<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Friends</title>
</head>
<body>
<jsp:include page="header.jsp"/>
Users in database: <br/><br/>
<div id="friends"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
 $(document).ready(function(){

 $.ajax({
  type : 'GET',
  url : 'http://localhost:8080/jpa/getfriends',
  dataType : 'json'
 }).then(
		   function(data) {
			    for(var user in data){
			    	$('#friends').append('username: ' + data[user].username + '<br/>');
			    	$('#friends').append('email: ' + data[user].email);
			    	$('#friends').append('<form action="http://localhost:8080/jpa/user/' + data[user].id + '/"> <input type="submit" value="Follow"/> </form>');
			    	$('#friends').append('<br/>');
			    }
			   });
			 });
 </script>
</body>
</html>