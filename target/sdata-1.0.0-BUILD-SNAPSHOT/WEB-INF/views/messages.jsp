<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
</head>
<body>
<jsp:include page="header.jsp"/>
User messages:
<div id="messages"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
 $(document).ready(function(){

 $.ajax({
  type : 'GET',
  url : 'http://localhost:8080/jpa/getmessages',
  dataType : 'json'
 }).then(
		   function(data) {
			    for(var username in data){
			    	$('#messages').append('<br/>' + username + ':<br/>');
			     for(var i=0;i<data[username].length;i++){
			      $('#messages').append(data[username][i].txt + '<br>');
			     }
			    }

			   });
			 });
 </script>
</body>
</html>