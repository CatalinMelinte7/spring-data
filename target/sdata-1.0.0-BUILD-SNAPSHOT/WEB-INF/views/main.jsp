<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
</head>
<body>
<jsp:include page="header.jsp"/>
Friends of user ${sessionScope.LOGGEDIN_USER.username }:<br/><br/>
<div id="main"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
 $(document).ready(function(){

 $.ajax({
  type : 'GET',
  url : 'http://localhost:8080/jpa/getmain',
  dataType : 'json'
 }).then(
		   function(data) {
			    for(var user in data){
			    	$('#main').append('username: ' + data[user].username + '<br/>');
			    	$('#main').append('email: ' + data[user].email + '<br/>');
			    	$('#main').append('messages: <br/>');
			    	data[user].messages.forEach( message => {
			    		$('#main').append(message.txt + '<br/>');
			    	});
			    	$('#main').append('<br/>');
			    }
			   });
			 });
 </script>
</body>
</html>