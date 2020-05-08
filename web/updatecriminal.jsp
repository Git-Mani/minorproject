<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String uid = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from criminal where uid="+uid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>

<form method="post" action="Criminalupdateprocess">
<br>
cid:<br>
<input type="text" name="cid" value="<%=resultSet.getString("cid") %>">
<br>

cage:<br>
<input type="text" name="cage" value="<%=resultSet.getString("cage") %>">
<br>
cdob:<br>
<input type="text" name="cdob" value="<%=resultSet.getString("cdob") %>">
<br>
cadhaar:<br>
<input type="text" name="cadhaar" value="<%=resultSet.getString("cadhaar") %>">
<br>
ccrime:<br>
<input type="text" name="ccrime" value="<%=resultSet.getString("ccrime") %>">
<br>
cdate
<br>
<input type="text" name="cdate" value="<%=resultSet.getString("cdatee") %>">
<br>

<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>