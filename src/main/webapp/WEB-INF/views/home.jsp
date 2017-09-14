<%@ page session="true" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<title>Home</title>
	
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>
	Welcome home!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<% if(session.getAttribute("LOGGEDIN_USER") != null){ %>
Post a message!
<br/>
<input type="text" id="content"/>
<input type="submit" id="submit" value="Post Message"/>
<br/>
<% } %>
<br/>
Search for an user!
<div>
	<input type="text" id="searchbar">
	<input type="submit" id="search" value="Search" />
</div>
<p id="searchResponse"></p>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$('#submit').click( function() { 
		 var content = document.getElementById("content").value;
		 $.ajax({
		  url: 'http://localhost:8080/jpa/message',
		  type:'post',
		         dataType : 'json',
		         async : true,
		         data: JSON.stringify(content),
		         contentType: 'application/json; charset=utf-8',
		 		 success: function(data) 
		   		 {
		  		 location.reload();
		  		 },
		 		  failure: function(data){
		  		 }
		  }); 
		 });
		
		$('#search').click( function() {
			var content = document.getElementById("searchbar").value;
			$.ajax({
				url : 'http://localhost:8080/jpa/search',
				type: 'post',
				dataType: 'json',
				async : true,
		        data: JSON.stringify(content),
		        contentType: 'application/json; charset=utf-8',
		  		success: function(data) 
		   		{
		  			$('#searchResponse').text(data.message);
		   		},
		  		 failure: function(data){
		 			  $('#searchResponse').text(data.message);
		   		}
			});
		});
	</script>
</html>
