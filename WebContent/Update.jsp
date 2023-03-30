<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	
	<%@include file="navbar.jsp" %>
	<form method="post" action="update">
		<header><h2 align="center">Updating Record</h2></header>
		<div class="container">
		<%
		String id=request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdbjava","root","");
		PreparedStatement stmt=con.prepareStatement("select * from student where id=?");
		stmt.setString(1, id);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		
		%>
		

		  <div class="form-group mt-5">
		    <label for="name">Name</label>
		    <input type="text" name="n1" value="<%=rs.getString("name")%>" class="form-control" id="name">
		  </div>
		  <div class="form-group">
		    <label for="phone">Phone</label>
		    <input type="text" name="n2" value="<%=rs.getString("phone")%>" class="form-control" id="phone">
		  </div>
		  <div class="form-group">
		    <label for="email">Email</label>
		    <input type="email" name="n3" value="<%=rs.getString("email")%>" class="form-control" id="email">
		  </div>
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="text" name="n4" value="<%=rs.getString("password")%>" class="form-control" id="password">
		    <input name="n5" type="hidden" value="<%=rs.getString("id")%>">
		  </div>
		  
		  <button type="submit" class="btn btn-warning">Update</button>
		

		<%
		}
		%>
	</div>
	</form>
	
</body>
</html>