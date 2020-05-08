<!DOCTYPE html>
<html>
<head>
	<title> new password </title>
	<link rel="stylesheet" type="text/css" href="changepassword.css">
	<link rel="shortcut icon" href="exam.jpg">
</head>

<body>
<div id="1" >
	<div class="hadder">
  	  <div class="left"><h3> New Password for User: <%= session.getAttribute("user")%></h> </div> 
  	  <div class="right">
  	  	  <ul class="act">
  	  	     <li ><a href="index.html">Home</a></li>
  	  	     <span></span>
  	  	     <li><a href="#">Logout</a></li>
  	  	  
          </ul>
  	  </div>
  	  
  	</div>
  	<hr>
  	<div class="tab"> 
  	  <table >
   
   
                <tr>
                    <td>New Password</td><td>  <input  type="password" name="newpassword" value="" class="form"/> </td>
                </tr>

                <tr>
                    <td>Confirm Password</td><td>  <input  type="password" name="conpassword" value="" class="form"/> </td>
                </tr>
                           
            
                <td style="text-align: center;"><input type="submit" value="Save" class="form"/></td>
                <td style="text-align: center;"><input  type="submit" value="Reset" class="form"></td>
            
            </table>
  	</div>
  	

		
</div>
</body>
</html>