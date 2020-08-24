<?php include('server.php') ?>
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
        <h4>LOGIN</h4><br><br>
        <form action="welcome.php" method="post">
            <?php include(errors.php')  ?>
            <p>Username:<br><br>
            <input type="text" name="username" placeholder="Enter Username" required><br><br>
            <p>Password:<br><br>
            <input type="password" name="password" placeholder="Enter Password" required><br><br><br> 
                <button type="submit" name="login_user"><img src="images/loginbutton.png" height="120px" width="120px"></button>
                <p>New User <a href="login1.php"<b>Click Here to Register</b></a></p>
            </p>

             <!-- <a href="change.html">Change Password</a> -->
        </form>
    </div>
</body>
</html>