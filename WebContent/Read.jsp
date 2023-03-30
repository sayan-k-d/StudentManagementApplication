<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style>
	.title-sec{
		width: 100%;
		height: 5vh;
		position:relative;
		background-color: #85929E;
	}
	.title-sec p{
		font-size: 1.5em;
		font-weight: bold;
		left:1.25rem;
		position: absolute;
	}
	.card-text .card-label{
		font-weight: bold;
		font-size: 1.2em;
	}
	.card-text .card-value{
		margin-left: 8px;
		font-weight: 500; 
	}
	.logout{
		margin-top: 30px;
	}
</style>	
</head>
<body>
<%@include file="navbar.jsp" %>
<h2 align="center">Records</h2>

	<div class="container">
	<%
		HttpSession mySession=request.getSession(false);
		String user=mySession.getAttribute("USER").toString();
		String pswd=mySession.getAttribute("PSWD").toString();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdbjava","root","");
		PreparedStatement stmt=con.prepareStatement("select * from student where (email=? or phone=?) and password=?");
		stmt.setString(1, user);
		stmt.setString(2, user);
		stmt.setString(3, pswd);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		
	%>
			<div class="card mt-3">
				<section class="title-sec"><p class="card-title"><%=rs.getString("name") %></p></section>
					<div class="card-body">
						<p class="card-text"><span class="card-label">STUDENT ID:</span> <span class="card-value"><%=rs.getString("id") %></span></p>
						<p class="card-text"> <span class="card-label">PHONE:</span> <span class="card-value"><%=rs.getString("phone") %></span></p>
						<p class="card-text"><span class="card-label">EMAIL:</span> <span class="card-value"><%=rs.getString("email") %></span></p>
						<a href='delete?id=<%=rs.getString("id") %>' class="btn btn-danger">Delete</a>
						<a href='Update.jsp?id=<%=rs.getString("id") %>' class="btn btn-warning">Update</a>
					</div>
				</div>
				</div>
	<%
		}
		con.close();
		stmt.close();
	%>
</body>
</html>