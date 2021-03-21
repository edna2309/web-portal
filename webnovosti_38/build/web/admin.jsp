<%-- 
    Document   : admin
    Created on : 20-Nov-2020, 22:23:54
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="https://i.imgur.com/2XbNRzr.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="css/index.css" type="text/css" />
    </head>
    <body>
        <div class="container">
        <h1>Postavke administratora</h1>
        <div class="poruka" style="margin-top:-5px;margin-bottom:15px; "><span style="text-align:center;">${poruka}</span></div>
        
        <div class="adminButton"><a href="dodajKorisnika.jsp">Dodajte novog korisnika</a></div>
        
        <div class="adminButton"><a href="izmjena.jsp">Izmjena podataka za postojećeg korisnika</a></div>
        
        <div class="adminButton"><a href="Logout">Logout</a></div></div>
    </body>
</html>
