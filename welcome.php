<?php
 
  $username = &_POST['username'];
  $password = &_POST['password'];

  $error = "";
  $success = "";
  $msg = "";

  $sql = "select * from login where username = '$username'";

  $conn = mysqli_connect("localhost","root","");
  if(!$conn){
    $error = "Error connecting database..";
  }
  mysqli select db($conn,"bank");
  $result = mysqli_query($conn,$sql);
  $rows = mysqli_fetch_array($result);
  if($rows){
    if($rows["password"] == $password){
        $error = "";
        $success = "Welcome".$username;
        $msg = "Logout";
       }
  else{
    $error = "Invalid Password";
    $success = "";
    $msg = "Try Again!!!";
  }
}
else{
    $error = "Invalid Username";
    $success = "";
    $msg = "Try Again!!!";
}

?>


<!DOCTYPE elogin.html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="eloginstyle.css">
    <link rel="stylesheet" type="text/css" href="homestyle.css">
    
</head>
<body>
   <div class="dropd">
            <ul>
                <li><a href="home.html">HOME</a></li>                
                <li><a href="elogin.html">EMPLOYEE LOGIN</a></li>
            </ul>
        </div>
 <div class="loginbox">
        <img src="images/bank.png" class="avatar"><br><br><br>
        <br /><br /><h3 class="error"><?php echo $error; ?></h3><h3 class="success"><?php echo $sucess; ?></h3><br />
        <a href="login.php"><?php echo $msg; ?></a>
        <form action="elogin.php" method="post">
            <p>Username:<br><br>
            <input type="text" name="username" placeholder="Enter Username" required><br><br>
            <p>Password:<br><br>
            <input type="password" name="password" placeholder="Enter Password" required><br><br><br> 
                <button><img src="images/loginbutton.png" height="140px" width="140px"></button>
                
            </p>
             <!-- <a href="change.html">Change Password</a> -->
        </form>
    </div>
</body>
</html>