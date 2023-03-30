<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

</head>
<body>
<div class="container">
	<%@include file="navbar.jsp" %>
	<form method="post" action="create">
		<header><h2 align="center">Inserting Record</h2></header>
		
		<div class="form-group mt-5">
		    <label for="name">Name</label>
		    <input type="text" name="t1" class="form-control" id="name">
		  </div>
		  <div class="form-group">
		    <label for="phone">Phone</label>
		    <input type="text" name="t2" class="form-control" id="phone">
		  </div>
		  <div class="form-group">
		    <label for="email">Email</label>
		    <input type="email" name="t3"  class="form-control" id="email">
		  </div>
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="text" name="t4" class="form-control" id="password">
		  </div>
		  
		  <button type="submit" class="btn btn-primary">Insert</button>
		
		<!-- <table align="center">
			<tr>
				<th>Name</th>
				<td><input type="text" name="t1" placeholder="i.e. John Doe" required></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><input type="text" name="t2" placeholder="i.e. 8617284893" required></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="t3" placeholder="i.e. John@gmail.com" required></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="t4" required></td>
			</tr>
			<tr>
				<th></th>
				<td><button>Insert</button></td>
			</tr>
		</table> -->
	</form>
	</div>
</body>
</html>