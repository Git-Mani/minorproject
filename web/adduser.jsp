<!DOCTYPE html>
<html>
   
<head>
        
	<title> AddUser</title>
	<link rel="stylesheet" type="text/css" href="user2.css">
	<link rel="shortcut icon" href="exam.jpg">
</head>

<body>
  
<div id="1" >
    
     <div class="hadder">
         <div class="left"><h2>Add User</h2> </div> 
  	  <div class="right">
  	  	  <ul class="act">
  	  	     <li ><a href="index.jsp">Home</a></li>
  	  	     <span></span>
  	  	     <li><a href="logout.jsp">Logout</a></li>
  	  	 
          </ul>
  	  </div>
  	  
  	</div>
  	<hr>
  	<div class="tab"> 
            <form action="adduser">
  	  <table >
   
   <tr>
                <tr>
                    <td>UserId</td><td>  <input  type="number" name="uid" required value="" required/> </td>
                </tr>

                <tr>
                    <td>UserName</td><td>  <input  type="text" name="uname" required value=""   /> </td>
                </tr>
                           <tr>
                               <td>Password</td><td><input type="password" name="password" required value="" required/></td>
                            </tr>
            
            
                <td style="text-align: center;"> <input type="submit" value="submit" ></td>
            </tr>
            </table>
            </form>
            
  	</div>
  	

		
</div>
</body>
</html>