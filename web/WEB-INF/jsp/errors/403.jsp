<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<title>403: Access Forbidden</title>
  </head>
  <body style="background-color: #D4E8D9">
  <jsp:include page="/navbar"/>
  	<div style="background-color:#66ffEe" class="jumbotron">	
  		<h1>403: Access Forbidden</h1> 
  		<p>HALT! this resource is protected.<br>please come back when you have proper access</p>
		<button class="btn btn-primary" onclick="history.back()">Back</button>
	</div>
  </body>
</html>
