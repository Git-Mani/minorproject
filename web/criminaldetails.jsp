<%@page isThreadSafe="false"  errorPage="myerrors.jsp"  language="java" contentType="text/html" import="java.sql.*, java.util.Stack" %>




<%
    int code=Integer.parseInt(request.getParameter("code"));
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/criminalrecord";
    Connection con=DriverManager.getConnection(url, "root","root");
    String sql="select * from criminal where cid=?";
    java.sql.PreparedStatement ps=con.prepareStatement(sql);
    ps.setInt(1, code);
    java.sql.ResultSet rs=ps.executeQuery();
    rs.next();
    
    String s1=rs.getString(1);
    String s2=rs.getString(2);
    String s3=rs.getString(3);
    String s4=rs.getString(4);
    String s5=rs.getString(5);
    String s6=rs.getString(6);
    String s7=rs.getString(7);
    String s8=rs.getString(8);
    
    if((Integer.parseInt(s1))==0){
    
        System.out.print("not FOund");
    }

%>
<html>
    <body>
        <h3>criminal-Details</h3>
        <hr>
        <pre>
            cid         <%=s1%>
            cName       <%=s2%>
            cage        <%=s3%>
            cdob        <%=s4%>
            cadhaar     <%=s5%>
            ccrime      <%=s6%>
            rating      <%=s7%>
            crime date  <%=s8%>

                    
        </pre>
        <hr>

        <a href="adminpage.jsp">Home</a><br>
    </body>
</html>
    
<%
    con.close();
%>    
    