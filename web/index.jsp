<%-- 
    Document   : index
    Created on : Feb 27, 2020, 11:34:29 PM
    Author     : oogeyman
--%>

<%@page contentType="text/html,width=device-width, initial-scale=1.0" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>	
<%
    //session.setMaxInactiveInterval(150);
    
    
    String v1="",v2="";
    
    //step-1 (read all the cookies coming with request
        Cookie ck[]=request.getCookies();
    //step-2 (search for the desired one)
    if(ck==null)
        v1="";v2="";
    if(ck!=null)
    for(int i=0; i<ck.length; i++){
        String name=ck[i].getName();
        if(name.equals("id")){
            v1=ck[i].getValue();
        }else if(name.equals("pw")){
            v2=ck[i].getValue();
        }
    }
%>

<html>
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>login</title>
	<link rel="stylesheet" type="text/css" href="login.css">
	<link rel="shortcut icon" href="exam.jpg">
	<style type="text/css">
span{
	border: 0.3px solid black;
	padding: 17px 0px 2px 0px;
}
	</style>
</head>
<body>
<div class="containor">
	<div class="hadder">
  	  <div class="left"><h1>Criminal Record System</h1> </div> 
  	  <div class="right">
  	  	  <ul class="act">
  	  	     <li ><a href="index.jsp">Home</a></li>
  	  	     <span></span>
  	  	     <li><a href="#">About</a></li>
  	  	  
  	  		
          </ul>
  	  	  </div>
	</div>  	
	
<form action="VerifyUser" method="get">
  
    
<artical>
	<div class="middle">
				<img src="lock.gif" style="width: 150px; height: 150px; padding: 250px 150px 0px 90px;">
				


			</div>
</artical>
<table style="color: cadetblue;" align="left"  >
    <h2 style="background-color: #5fa08d80; box-shadow: 0px 1px 5px 0 chartreuse; width:190px;" align="center"> login Form </h2>
   
                <tr>
                    <td>Username</td><td>  <input  type="text" name="uname" value="<%=v1%>" class="form"/> </td>
                </tr>

                           <tr>
                   <td>Password</td><td><input type="password" name="password" value="<%=v2%>" class="form"/></td>
                            </tr>
            <tr>
                <td>Usertype</td><td><select name="utype" ><option>admin</option><option>user</option></select></td>
            </tr>
            <tr>
                <td>Save Password</td><td><input type="checkbox" name="c1" value="yes" checked="checked"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Login" class="form"/></td>
                <td><input type="reset"  value="Reset Form" class="form"/></td>
                  
                
            </tr>
            <tr><td> <a  href="Forgot.jsp" >Forgot password</a></td> </tr>
            </table>
        </form> 
    

</div>
</body>
</html>
  <script>
            function resetForm() {
                        document.getElementById("rwdPromotionDetailsAdd").reset();
                    }
</script>