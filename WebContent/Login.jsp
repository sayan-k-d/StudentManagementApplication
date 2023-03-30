<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
	 <%@include file="navbar.jsp" %>
	<div class="container">
	<h2 align="center">Student Login</h2>
		<form action="login" method="post">
		  <div class="form-group mt-5">
		    <label for="email">User Id</label>
		    <input type="text" name="e1" class="form-control" id="email" aria-describedby="emailHelp">
		  </div>
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="password" name="p1" class="form-control" id="password">
		  </div>
		  
		  <button type="submit" class="btn btn-primary">Login</button>
		</form>
		<h2 align="center" style="margin-top: 30px; background-color: #F5B7B1; transition: all 1s ease">${msg }</h2>
	</div>
	
</body>
</html>