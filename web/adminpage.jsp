<!DOCTYPE html>
<html>
<head>
	<title>AdminPage</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="log1.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="shortcut icon" href="exam.jpg">
</head>
<body>


<div class="nav">
  	  <div class="left"><h1>Admin Page:<%= session.getAttribute("user")%></h1> </div> 
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
  <button onclick="myFunction()" class="dropbtn"> User </button>
  <div id="myDropdown" class="dropdown-content">
    <a href="adduser.jsp">Add User</a>
    <a href="updatelist.jsp">Update User</a>
    <a href="deleteuser.jsp">Delete User</a>

  </div>   
  	
</div>


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
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}



</script>

</html>