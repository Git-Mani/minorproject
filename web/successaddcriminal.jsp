

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="user2.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add successfully</title>
    </head>
    <h5>User Name:<%= session.getAttribute("user")%></h5> 
    <%
    //session.setMaxInactiveInterval(150);
    
    
    String v1="";
    
    //step-1 (read all the cookies coming with request
        Cookie ck[]=request.getCookies();
    //step-2 (search for the desired one)
  for(int i=0; i<ck.length; i++){
        String name=ck[i].getName();
        if(name.equals("utype")){
            v1=ck[i].getValue();
        }
    }
    
       
           
     
    
%>
    <body>
        <div class="hadder">
         <div class="left"><h2>Add User</h2> </div> 
  	  <div class="right">
  	  	  <ul class="act">
                      <li ><a href="<%=v1%>page.jsp">Home</a></li>
  	  	     <span></span>
  	  	     <li><a href="logout.jsp">Logout</a></li>
  	  	 
          </ul>
  	  </div>
  	  
  	</div>
        
        <h1>Add Successfully </h1>
        <br><a href="addcriminal.jsp">Add criminal</a<br>
        <br><a href="criminallist.jsp">update criminal</a><br>
    
    </body>
</html>
