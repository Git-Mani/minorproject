<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/criminalrecord";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String uid = request.getParameter("uid");
String uname=request.getParameter("uname");
String password=request.getParameter("password");

if(uid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(uid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update user set uid=?,uname=?,password=? where uid="+uid;
ps = con.prepareStatement(sql);
ps.setString(1, uid);
ps.setString(2, uname);
ps.setString(3, password);

int i = ps.executeUpdate();
if(i > 0)
{%>
    
    <html>
    <body>
        <h3>Record Updated Successfully</h3>
        <h4><a href="updatelist.jsp">Click-To-update-Again</a></h4>
    </body>
</html>
    
   
  <%              

}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>