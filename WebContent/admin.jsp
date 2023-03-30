<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<link rel="stylesheet" href="css/style.css">
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
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <span class="navbar-brand">Student Management System</span>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav ml-auto">
	
	      <li class="nav-item active">
	        <a class="nav-link" href="Logout">Logout</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	</div>
	<h2 align="center">Records</h2>

	<div class="container">
	<%
		HttpSession mySession=request.getSession(false);
		String adminid=request.getParameter("a1");
		String adminps=request.getParameter("ap1");
		if(adminid.equals("superuser") && adminps.equals("admin@123")){
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdbjava","root","");
		PreparedStatement stmt=con.prepareStatement("select * from student");
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
				
	<%
		}
		con.close();
		stmt.close();
		}
		else{
			request.setAttribute("msg","Not a Valid Admin!!");
			RequestDispatcher req= request.getRequestDispatcher("AdminLogin.jsp");
			req.forward(request, response);
		}
		
		
	%>
	</div>
</body>
</html>