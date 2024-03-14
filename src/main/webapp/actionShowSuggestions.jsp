<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
String buffer = "";
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amazon","root",null);	
			PreparedStatement statement = con.prepareStatement("select * from products where productDescription like '%"+ request.getParameter("term") + "%'");
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				buffer += rs.getString(3) + ",";
			}
			response.getWriter().println(buffer);
			con.close();
%>
