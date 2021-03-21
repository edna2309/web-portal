<%-- 
    Document   : login
    Created on : 20-Nov-2020, 11:37:29
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://i.imgur.com/2XbNRzr.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="css/index.css" type="text/css" />
        <title>Login</title>
        
    </head>
    <body>
        
        <div class="container">
        <h1 style="margin-top:-35px;margin-bottom:35px;">Login</h1>
        
        <div class="poruka" style="margin-top:-5px;margin-bottom:-15px; "><span style="text-align:center;">${poruka}</span></div>
        <form action="Login" method="POST">
            <input type="text" name="username" placeholder="Username">        
            <input type="password" name="password" placeholder="Password">
            <input type="submit" value="Login" class="defaultDugme">      
        </form>
        
        <a href="registracija.jsp" class="loginpage">Nemate korisnički račun? Registrujte se!</a> <br>        
        <a href="novost.jsp" class="loginpage">Logirajte se kao gost.</a>
        
        </div>
    </body>
</html>
