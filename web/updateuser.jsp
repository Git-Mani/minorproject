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
String sql ="select * from user where uid="+uid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head>
	<title> Update User</title>
	<link rel="stylesheet" type="text/css" href="changepassword.css">
	<link rel="shortcut icon" href="exam.jpg">
</head>
    
<body>
     Username <%= session.getAttribute("user")%>

<div id="1" >
	<div class="hadder">
  	  <div class="left"><h1> Update User Data From Record</h1> </div> 
  	  <div class="right">
  	  	  <ul class="act">
  	  	     <li ><a href="index.html">Home</a></li>
  	  	     <span></span>
  	  	     <li><a href="logout.jsp">Logout</a></li>
  	  	  
          </ul>
  	  </div>
  	  
  	</div>
  	<hr>
  
  <div class="footer">
      <form style=";" method="post" action="update-process.jsp">
          <table>
              <tr>
                  
                
<input type="hidden" name="uid" value="<%=resultSet.getString("uid") %>">
<tr>
<td>
uid:</td><td>
<input type="text" name="uid" value="<%=resultSet.getString("uid") %>">
</td>
</tr>
<tr>
<td>uname:</td><td>
<input type="text" name="uname" value="<%=resultSet.getString("uname") %>">
<td></tr>
<tr><td>
password:</td><td>
<input type="password" name="password" value="<%=resultSet.getString("password") %>">
</td></tr>
<tr><td >
<input  type="submit" value="submit"></td></tr>  
                  
              </tr>

</table>
  </div>
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