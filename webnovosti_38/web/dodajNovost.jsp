<%-- 
    Document   : dodajNovost
    Created on : 30-Nov-2020, 22:11:27
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="https://kit.fontawesome.com/c33798638b.js" crossorigin="anonymous"></script
        <link rel="icon" href="https://i.imgur.com/2XbNRzr.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="css/index.css" type="text/css" />
        <title>Dodavanje novosti</title>
    </head>
    <body><div class="container">
        <h1 style="margin-top:-100px;margin-bottom:35px;">Dodavanje novosti</h1>
        <div class="poruka" style="margin-top:-5px;margin-bottom:-15px;left:20%;"><span style="text-align:center;">${poruka}</span></div>
        <form action="DodajNovost" method="POST">
            <input type="text" name="naslov" placeholder="Naslov">
            <input type="text" name="preview" placeholder="Pregled sadržaja">
            <textarea class="txtarea" name="sadrzaj" rows="10" cols="50" placeholder="Sadržaj novosti"></textarea>
            <input type="submit" value="Dodaj novost" class="defaultDugme">
        </form>
        <a href="novost.jsp" class="nazad" title="Nazad na pregled novosti"><i class="fas fa-arrow-left"></i></a></div>
    </body>
</html>
