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
String sql ="select * from criminal where cid="+uid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
 Username <%= session.getAttribute("user")%>
<h1>Update Criminal  data from  Record</h1>
<form method="post" action="criminalupdateprocess.jsp">
  <input type="hidden" name="cid" value="<%=resultSet.getString("cid") %>">

<br>
cid:<br>
<input type="text" name="uid" value="<%=resultSet.getString("cid") %>">
<br>

cname:<br>
<input type="text" name="uname" value="<%=resultSet.getString("cname") %>">
<br>

cdob:<br>
<input type="date" name="cdob" value="<%=resultSet.getString("cdob") %>">
<br>

cadhaar:<br>
<input type="text" name="cadhaar" value="<%=resultSet.getString("cadhaar") %>">
<br>
 
       <label for="ccrime">choose crime</label> <br>
  <select id="ccrime" name="ccrime">
     
    <option value="murder">murder</option>
    <option value="kidnap">kidnap</option>
    <option value="theft">theft</option>
    <option value="other">Other</option>
  </select>
     
<br>


cdate:<br>
<input type="date" name="cdate" value="<%=resultSet.getString("cdate") %>">
<br><br>
<input type="submit" value="update">

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