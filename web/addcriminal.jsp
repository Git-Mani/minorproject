

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Criminal</title>
    </head>
    <body>
        <h1>Criminal Detail</h1>
         <form action="addcriminal">
        <table>
                    <tr><td>
                            criminalid</td><td> <input type="text" name="cid" required>
                     </td>
                    </tr>
                  <tr>
                      <td>Criminal name </td><td>  <input type="text" name="cname" required > </td>
                    
                    </tr>
                    <tr><td>
                            Criminal Age</td><td> <input type="text" name="cage"required>
                     </td>
                    </tr>
<tr><td>
                               crminal dob </td><td> <input type="date" name="cdob" required>
                     </td>
                    </tr> 
                    <tr><td>
                            Criminal Adhaar No</td><td> <input type="text" name="cadhaar" required >
                     </td>
                    </tr>
                    
                    <tr><td>
                            <label for="ccrime">Choose a Crime:</label> </td><td>  
  <select id="ccrime" name="ccrime">
    <option value="murder">murder</option>
    <option value="kidnap">kidnap</option>
    <option value="theft">theft</option>
    <option value="other">Other</option>
  </select>
  
                     </td>
                      </tr>
                          
                        <tr><td>
                                date </td><td> <input type="date" name="cdate" required>
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
