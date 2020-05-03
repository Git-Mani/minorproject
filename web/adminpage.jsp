<!DOCTYPE html>
<html>
<head>
	<title></title>

	<link rel="stylesheet" type="text/css" href="log.css">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body class="c">
	<div class="containor">
			<ul class="reset" role="navigation">
				<li class="menu">
					<a href="#">user 
						<!--<span class="sub-arrow">
							<i class="fa fa-chevron-down">
								::before
							</i>
						</span>-->
					</a>
					<ul class="sub-menu">
					<li><a href="adduser.jsp">add user</a></li>
					<li><a href="updatelist.jsp">update user</a></li>
					<li><a href="removeuser.jsp">delete user</a></li>
					</ul>
				</li>
				<li class="menu">
					<a href="#">criminal 
						<span class="sub-arrow">
							<i class="fa fa-chevron-down" >
								
							</i>
						</span>
					</a>
					<ul class="sub-menu">
					<li><a href="addcriminal.jsp">add </a></li>
					<li><a href="#"> update </a></li>
					
					</ul>
				</li>
			</ul>
			
		</div>
<div class="search">
     <form action="criminalSearch.jsp">
        
             <input type="text" placeholder="please enter criminal id" name="code"/>
            <input type="submit" value="Search"/>
     </form>  </div> 
    <script type="text/javascript"> window.onload = alertName; </script>
</body>
</html>