<%-- 
    Document   : dodajKorisnika
    Created on : 20-Nov-2020, 22:33:36
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodavanje korisnika</title>
        <link rel="icon" href="https://i.imgur.com/2XbNRzr.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/index.css" type="text/css" />
        <script src="https://kit.fontawesome.com/c33798638b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
        <h1 style="margin-top:-100px;margin-bottom:-10px;">Dodavanje korisnika</h1>
        <div class="poruka" style="margin-top:25px;margin-bottom:6px; "><span style="text-align:center;">${poruka}</span></div>
        <form action="Dodaj" method ="POST">
            <input type ="text" name="ime" placeholder="Ime"><br>       
            <input type ="text" name="prezime" placeholder="Prezime"><br>
            <input type ="text" name="email" placeholder="Email"><br>
            <input type ="text" name="username" placeholder="Username"><br>
            <input type ="password" name="password" placeholder="Password"><br>
            <select name="uloga" class="select-css">
                    <option disabled selected value="uloga">Uloga</option>
                    <option value="admin">Admin</option>                
                    <option value="urednik">Urednik</option>
                    <option value="user">User</option>
                </select>  
            
            <input type="submit" value="Dodajte korisnika" class="defaultDugme" style="margin-top:50px;margin-bottom:-5px;">  
        </form>
        <a href="admin.jsp" class="nazad" title="Nazad na postavke administratora"><i class="fas fa-arrow-left"></i></a> </div>
    </body>
</html>
