<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amazon","root",null);	
PreparedStatement statement = con.prepareStatement("select * from sellers where email=? and password=?");
statement.setString(1, request.getParameter("email"));
statement.setString(2, request.getParameter("password"));
ResultSet rs = statement.executeQuery();
if(rs.next()) {
	session.setAttribute("sessionAdminEmail", rs.getString(3));
	session.setAttribute("sessionAdminName", rs.getString(2));
	response.getWriter().write("ok");
} else {
	response.getWriter().write("not");
}
%>