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
 * Servlet implementation class Create
 */
@WebServlet("/create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create() {
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
			String Name=request.getParameter("t1");
			String Phone=request.getParameter("t2");
			String Email=request.getParameter("t3");
			String Password=request.getParameter("t4");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdbjava","root","");
			PreparedStatement stmt=con.prepareStatement("insert into student(name,phone,email,password) value(?,?,?,?)");
			stmt.setString(1, Name);
			stmt.setString(2, Phone);
			stmt.setString(3, Email);
			stmt.setString(4, Password);
			
			int r=stmt.executeUpdate();
			if(r!=0)
			{
				
				request.setAttribute("msg", "Record Added Successfully");
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
