<%-- 
    Document   : izmijeniNovost
    Created on : 30-Nov-2020, 22:35:30
    Author     : User
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <script src="https://kit.fontawesome.com/c33798638b.js" crossorigin="anonymous"></script>
        <title>Izmijeni novost</title>
    </head>
    <body>
        <div class="container">
        <form action="IzmijeniNovost" method="POST">
            <h1 style="margin-top:-100px;margin-bottom:35px;text-align:center;">Izmjena novosti</h1>           
        <%
            Connection con = null;
            Statement stmt = null;
            
            HttpSession sesija = request.getSession();
            String novid =(String) sesija.getAttribute("novostid");            
            String upit = "select * from novost where novostid=" + novid;  
            
            try{
                con = DB.getConnection();
                stmt = con.createStatement();                
                ResultSet rs = stmt.executeQuery(upit);
                while(rs.next()){
                System.out.println(rs.getString("naslov"));
        %>
            <input type="text" name="naslov" placeholder="Naslov">
            <input type="text" name="preview" placeholder="Pregled sadržaja">
            <textarea class="txtarea" name="sadrzaj" rows="15" cols="60" placeholder="Sadržaj novosti"></textarea>
            
        <%
            }}catch(SQLException e){
            System.out.println("Greska: " + e);
}
        %>
            <input type="submit" value="Izmijeni novost" class="defaultDugme">
        </form><a href="novost.jsp" class="nazad" title="Nazad na pregled svih novosti"><i class="fas fa-arrow-left"></i></a> </div>
    </body>
</html>
