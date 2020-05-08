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
<body>
    <script language="javascript">
function deleteRecord(uid){
    var doIt=confirm('Do you want to delete the record?');
  if(doIt){
   var f=document.form;
    f.method="get";
    f.action='/delete-process.jsp?uid='+uid;
    f.submit();
    }
  else{

    }
}
</script>

 Username <%= session.getAttribute("user")%>
<h1>delete  user data record from Database </h1>
<form method="post" action="delete-process.jsp">
 <table>   
<input type="hidden" name="uid" value="<%=resultSet.getString("uid") %>">

<tr>
<td>uid:</td><td>
    <input type="text" name="uid" value="<%=resultSet.getString("uid") %>"></td>
</tr>
<tr>
<td>uname:</td><td>
<input type="text" name="uname" value="<%=resultSet.getString("uname") %>">
</td></tr>
<tr><td>password:</td><td>
<input type="password" name="password" value="<%=resultSet.getString("password") %>">
</td><tr>
    <td><input type="submit" value="delete" onclick="deleteRecord(<%=resultSet.getString("uid")%>);"></td>
</table>
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