<%-- 
    Document   : pregledNovosti
    Created on : 29-Nov-2020, 14:08:07
    Author     : User
--%>
<%@page import="beans.korisnik"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="util.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.novost"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Pregled jedne novosti</title>
    </head>
    <body>
                
        <div class="container">
        <%
            Connection con = null;
            Statement stmt = null;
            String novid = request.getParameter("novostid");  
            String upit = "select * from novost where novostid=" + novid;    
            
            String upitKomentari ="select kom.sadrzaj, kor.ime, kor.prezime, kom.datum, kom.komentarid " 
             + "from komentar as kom inner join korisnik as kor on kom.korisnikid = kor.korisnikid "
             + "where novostid=" + novid;
            HttpSession sesija = request.getSession();
            sesija.setAttribute("novostid", novid);           
            
            try{
                con = DB.getConnection();
                stmt = con.createStatement();  
                
                ResultSet rs = stmt.executeQuery(upit);    
                if(rs.next()){              
                %>
                <h1 style="margin-top:-80px;margin-bottom:35px;"><%=rs.getString("naslov")%></h1>
                <div class="sadrzaj"><%=rs.getString("sadrzaj")%></div><br>
                <big><b><%=rs.getString("datum")%></b></big>
                
                    <div class="kom">
                <%}
                    rs = stmt.executeQuery(upitKomentari);
                    while(rs.next()){        
                %> 
                
                <div class="komentari">
                    
                    <span style="font-weight: bold;"><%=rs.getString("kor.ime") + " " + rs.getString("kor.prezime")%></span>
                    <br>
                    <span><%=rs.getString("kom.sadrzaj")%>  <c:if test="${korisnik.uloga=='urednik'}">
                        <a style="float:right;" title="Obriši komentar" href="obrisiKomentar.jsp?komentarid=<%=rs.getInt("kom.komentarid")%>"><i class="fas fa-trash-alt"></i></a>
                    </c:if></span>
                    <br>
                    <span><%=rs.getString("kom.datum")%></span>
                   
                </div> <%}%>
        <div class="poruka" style="margin-top:0px;margin-bottom:-30px;min-width:100%;"><span style="text-align:center;">${poruka}</span></div>
                <c:if test="${korisnik.uloga=='user'}">
                    <form action="DodajKomentar" method="POST" style="min-width:100%;margin-top:20px;">
                        <input placeholder="Upišite komentar" name="sadrzajKom">
                        <input type="submit" value="Postavi komentar" class="defaultDugme">
                    </form>
                </c:if>    
                </div>
            <a href="novost.jsp" class="nazad" title="Nazad na pregled svih novosti"><i class="fas fa-arrow-left"></i></a>   
        <%
            
          
            }catch(SQLException e){
                System.out.println("Greska: "+ e);
            }
        %>
</div><div style="top:40px;left:50px;position:fixed;padding:20px;"><c:if test="${korisnik.uloga=='urednik'}">
                    <div class="urednik-novost-button"><a href="ObrisiNovost">Obriši novost</a></div>
                    <div class="urednik-novost-button"><a href="izmijeniNovost.jsp">Izmijeni novost</a></div></c:if></div></div>
    </body>
</html>
