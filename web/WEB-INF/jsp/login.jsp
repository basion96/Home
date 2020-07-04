<%--
  Created by IntelliJ IDEA.
  User: Jason
  Date: 2/07/2020
  Time: 4:27 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <div class="jumbotron">
            <h1>Login</h1>
        </div>

        <!--Creates a form that allows the user to enter their login details. On submission, their details are validated-->
        <div class="container">
            <form class="form-horizontal" action="j_security_check" method="POST">
                <div class="form-group">
                    <label for="email">Username:</label>
                    <input type="text" class="form-control" id="email" name="j_username" required="true">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" name="j_password" required="true">
                </div>

                <!--Generates a button that is used to submit the form-->
                <button type="submit" class="btn btn-primary">Log In</button>
            </form>
        </div>
    </body>
</html>
