package com.JDBC.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("e1");
		String passwd=request.getParameter("p1");
		PrintWriter pw=response.getWriter();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdbjava","root","");
			PreparedStatement stmt=con.prepareStatement("select * from student where (email=? or phone=?) and password=?");
			stmt.setString(1, userid);
			stmt.setString(2, userid);
			stmt.setString(3, passwd);
			ResultSet rs=stmt.executeQuery();
			rs.next();
			try
			{
				String email=rs.getString("email");
				String phone=rs.getString("phone");
				String password=rs.getString("password");
				if ((email.equals(userid) || phone.equals(userid))
						&& password.equals(passwd)) 
				{
					HttpSession mySession=request.getSession();
					mySession.setAttribute("USER", userid);
					mySession.setAttribute("PSWD", passwd);
					RequestDispatcher req=request.getRequestDispatcher("Read.jsp");
					req.forward(request, response);
				} 
				else 
				{
					pw.write("Not Found");
				}
			}
			catch (Exception e) {
				request.setAttribute("msg", "Check Username and Password or Please Sign Up With Valid Details");
				RequestDispatcher req=request.getRequestDispatcher("Login.jsp");
				req.forward(request, response);
				//response.sendRedirect("Login.jsp");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
