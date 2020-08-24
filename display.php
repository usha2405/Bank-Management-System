<html>
<head>
	<link rel="stylesheet" type="text/css" href="eloginstyle.css">
    <link rel="stylesheet" type="text/css" href="homestyle.css">
</head>
<body>
	<div class="dropd">
            <ul>
                <li><a href="home.html">HOME</a></li>
                
                <li><a href="form.html">FORM</a></li>
                
                <li><a href="elogin.html">EMPLOYEE LOGIN</a></li>
            </ul>
        </div>

	<?php

	

    $server="localhost";
	$user_name="root";
	$pass="root";
	$db_name="quote";
	$usr = $_POST['username'];
    $pwd = $_POST['password'];
    echo "username".$usr;


	$conn = mysqli_connect($server,$user_name,$pass,$db_name);

if($conn)
{   
	$query = "select * from quote_details;";
	$sql = "select * from emp_details;";
	$res=mysqli_query($conn,$sql);
	$roww = mysqli_fetch_assoc($res);
	if($usr===$roww['username'] && $pwd===$roww['password'])
	{
		if($result=mysqli_query($conn,$query))
		{   
  		echo "
		
  		<table border='1px' style='width:100%'>
	    <tr>
	    <th>NAME</th>
	    <th>EMAILID</th>
	    <th>PHONE NUMBER</th>
	    <th>PRODUCT</th>
	    <th>COMPANY</th>
	    <th>QUANTITY</th>
	      
	      
	    </tr>";

	    	if (mysqli_num_rows($result) > 0) 
	    	{
        			while($row = mysqli_fetch_assoc($result)) 
        			{
      
					      echo "<tr>";
					      echo "<td>" . $row['name'] . "</td>";
					      echo "<td>" . $row['email'] . "</td>";
					      echo "<td>" . $row['mob'] . "</td>";
					      echo "<td>" . $row['product_type'] . "</td>";
					      echo "<td>" . $row['company'] . "</td>";
					      echo "<td>" . $row['quantity'] . "</td>";
					      echo "</tr>";
    				}
     
			}
		}
		
	}
}
else{echo 'no';}
?>	<br>
<form action="del.php" method="POST">
	<input type="text" name="del" >
	<input type="submit" value="Delete" name="">
</form>
<br><br>
 <script>
function myFunction() {
    document.getElementById($demo).style.display= "none";
}
</script>
</body>
</html>
