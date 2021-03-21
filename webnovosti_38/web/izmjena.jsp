<%-- 
    Document   : izmjena
    Created on : 20-Nov-2020, 22:57:09
    Author     : User
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/c33798638b.js" crossorigin="anonymous"></script>
        <link rel="icon" href="https://i.imgur.com/2XbNRzr.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="css/index.css" type="text/css" />
        <title>Izmjena korisnika</title>
    </head>
    <body>
        <div class="container">
        <h1 style="margin-top:-110px;margin-bottom:20px;">Izmjena podataka</h1>
        <div class="poruka" style="margin-top:-5px;margin-bottom:15px; "><span style="text-align:center;">${poruka}</span></div>
        <form action="Izmjena" method="POST">
        
            <div style="font-size:16px;font-weight:bold;margin-bottom:10px;">Unesite ID korisnika čije podatke želite mijenjati: </div>
            
           <input type="text" name="korisnikid" placeholder="ID korisnika">
            
            <div style="font-size:16px;font-weight:bold;margin-bottom:10px;margin-top:25px;">Unesite podatke koje želite izmijeniti:</div>         
            <input type="text" name="ime" placeholder="Ime">
            <input type="text" name="prezime" placeholder="Prezime">
            <input type="text" name="email" placeholder="Email">       
                <select name="uloga" class="select-css">
                    <option disabled selected value="uloga">Uloga</option>
                    <option value="admin">Admin</option>                
                    <option value="urednik">Urednik</option>
                    <option value="user">User</option>
                </select>
            
                <select name="aktivan" class="select-css" style="margin-top:10px;">
                    <option disabled selected value="aktivan">Aktivnost</option>
                    <option value="aktivan">Aktivan</option>                
                    <option value="neaktivan">Neaktivan</option>
                </select>
            <input type="submit" value="Izmijenite podatke" class="defaultDugme">        
        </form>
        
        <a href="admin.jsp" class="nazad" style="margin-top:-10px;" title="Nazad na postavke administratora"><i class="fas fa-arrow-left"></i></a>
        </div>
    </body>
</html>
