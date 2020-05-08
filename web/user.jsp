<!DOCTYPE html>
<html>
<head>
	<title>User login</title>
	<link rel="stylesheet" type="text/css" href="log1.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="shortcut icon" href="exam.jpg">
</head>
<body>
<div class="nav">
  	  <div class="left"><h1>User Name:<%= session.getAttribute("user")%></h1> </div> 
  	  <div class="right">
  	  	  <ul class="act">
  	  	     <li ><a href="index.jsp">Home</a></li>
  	  	     <span></span>
  	  	     <li><a href="logout.jsp">Logout</a></li>
  	  	  	 <li>  <form action="criminalSearch.jsp">
        
             <input type="text" placeholder="please enter criminal id" name="code"/>
            <input type="submit" value="Search"/>
     </form>    </li>
          </ul>

  	  </div>
</div>

<hr>
<div class="navbar">
	 <div class="dropdown">
    <button class="dropbtn">Criminal 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="addcriminal.jsp">Add</a>
      <a href="criminallist.jsp">Update</a>
     </div>
  </div> 
    

</div>

</body>
</html>