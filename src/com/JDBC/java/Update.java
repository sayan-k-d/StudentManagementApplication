package com.JDBC.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update
 */
@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		try
		{
			String Name=request.getParameter("n1");
			String Phone=request.getParameter("n2");
			String Email=request.getParameter("n3");
			String Password=request.getParameter("n4");
			String id=request.getParameter("n5");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdbjava","root","");
			PreparedStatement stmt=con.prepareStatement("update student set name=?,phone=?,email=?,password=? where id=?");
			stmt.setString(1, Name);
			stmt.setString(2, Phone);
			stmt.setString(3, Email);
			stmt.setString(4, Password);
			stmt.setString(5, id);
			
			int r=stmt.executeUpdate();
			if(r!=0)
			{
				RequestDispatcher req=request.getRequestDispatcher("Login.jsp");
				req.forward(request, response);
			}
			else
			{
				pw.write("Error");
			}
			pw.close();
			con.close();
			stmt.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}
