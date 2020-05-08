<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "criminalrecord";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<body>
 Username <%= session.getAttribute("user")%>
<h1>Retrieve Criminal information from database</h1>
<table border="1">
<tr>
<td>criminal id</td>
<td>criminal name</td>
<td>criminal dob</td>
<td>criminal adhaar</td>
<td>crime</td>
<td>rating</td>
<td>date</td>
<td>update</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from criminal";
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{%>
<tr>
<td><%=resultSet.getString("cid") %></td>
<td><%=resultSet.getString("cname") %></td>
<td><%=resultSet.getString("cdob") %></td>
<td><%=resultSet.getString("cadhaar") %></td>
<td><%=resultSet.getString("ccrime") %></td>
<td><%=resultSet.getString("rating") %></td>
<td><%=resultSet.getString("cdate") %></td>

<td><a href="criminalupdate.jsp?id=<%=resultSet.getString("cid")%>">update</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>