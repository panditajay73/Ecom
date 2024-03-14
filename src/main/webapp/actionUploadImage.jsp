<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amazon","root",null);	
PreparedStatement statement = con.prepareStatement("update products set productImage=? where productId=?");
statement.setString(1,request.getParameter("image"));
statement.setString(2,request.getParameter("id"));
statement.executeUpdate();
response.sendRedirect("adminindex.jsp");
%>
    <html>
    <body>
    Uploading image and redirecting...
    </body>
    </html>
