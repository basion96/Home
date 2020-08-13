<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	  <title>Log out</title>
	  <jsp:include page="/navbar"/>
  </head>
  <body style="background-color: #D4E8D9">
  <!--Invalidates the current session-->
  <% session.invalidate();%>
  <% request.logout();%>

  	<div class="jumbotron">
  		<h1>See you later!</h1>
  		<p>You're now logged out. click the button below to return to the home page.</p>
		<button class="btn btn-primary" onclick="location.href='/Home';">Home</button>
	</div>
  </body>
</html>
