<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<title>404: Content not Found</title>
  </head>
  <body style="background-color: #D4E8D9">
  <jsp:include page="/navbar"/>
  	<div style="background-color:#66ffEe" class="jumbotron">	
  		<h1>404: Content not Found</h1> 
  		<p>Whoops. The content you where looking isn't here.<br>Maybe you should head back....</p>
        <button class="btn btn-primary" onclick="history.back()" style="display: flex; justify-content: center">Back</button>
	</div>
  </body>
</html>
