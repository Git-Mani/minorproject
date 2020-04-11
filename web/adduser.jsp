<%-- 
    Document   : adduser
    Created on : Mar 1, 2020, 4:02:10 AM
    Author     : oogeyman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add USer</title>
  
     <script type="text/javascript"> 
  function validateForm() {
  var x = document.getElementById("uid").value;
 
  if(a.value.length<=0 )
                    {
                        alert("Don't leave the field empty!");
                        valid = false;
                    }
                    else{
                        if(!IsNumeric(a.value) )
                            alert("Enter a number");
                    valid = false;
                }
}
    </script>
  
  
        
    </head>
    <body>
        <form  name="myForm" action="adduser" onsubmit="return validateForm()" >
        <table>
                    <tr><td>
                            userid</td><td> <input type="text" name="uid" required  >
                     </td>
                    </tr>
                  <tr>
                      <td>username </td><td>  <input type="text" name="uname" required > </td>
                    
                    </tr>
                          <tr><td>
                                  password</td><td> <input type="password" name="password" required >
                     </td>
                    </tr>
                        <tr><td>
                            <input type="submit" value="submit" >
                     </td>
                    </tr> 
            
            
            
            
        </table>
        
        
        
    </form>
        
        
    </body>
</html>
