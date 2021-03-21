<%-- 
    Document   : novosti
    Created on : 20-Nov-2020, 11:50:37
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.novost"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Pregled svih novosti</title>
    </head>
    <body>
        
            <div class="novosti-naslov" style="margin-top:20px;">Pregled svih novosti</div>
            <div class="poruka" style="margin-top:-5px;margin-bottom:-15px; margin:0 auto;"><span style="text-align:center;">${poruka}</span></div>
             
            <div class="novost-container">
        
<%
        Connection con = null;
        Statement stmt = null;  
        try{
        con = DB.getConnection();
        String upit = "select * from novost";
        stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(upit);
        List<novost> novosti = new ArrayList();

        HttpSession sesija = request.getSession();
        sesija.setAttribute("novosti", novosti);
        while(rs.next()){  
        int novostid = rs.getInt("novostid");
%>  
        <div class="novost">         
            <h2 style="text-transform:uppercase; margin-bottom:10px;"><%=rs.getString("naslov") %></h2>
            <p style="margin-bottom:10px;"><%=rs.getString("preview") %></p>
            <div><a href="pregledNovosti.jsp?novostid=<%=novostid%>">Pogledajte više...</a>
            <a style="margin-top:-3px; padding-bottom:11px; float:right;" title="<%=rs.getString("datum")%>"><i class="fas fa-calendar-alt"></i></a></div>
            <p style="border-bottom:1px solid #DB7093;margin-top:5px;"></p>
        </div>
           
        <%
          novost n = new novost();
          n.setNaslov(rs.getString("naslov"));
          n.setNovostid(rs.getInt("novostid"));
          n.setDatum(rs.getString("datum"));
          n.setPreview(rs.getString("preview"));
          novosti.add(n);
            }
            con.close();
        stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
     <c:if test="${korisnik.uloga!='urednik' && korisnik.uloga!='user'}">
        <a class="nazad" href="login.jsp" title="Nazad na početnu stranicu"><i class="fas fa-arrow-left"></i></a></div>  
     </c:if></div>
     
     
     <div style="top:40px;left:50px;position:fixed;padding:20px;">
        <c:if test="${korisnik.uloga=='urednik'}">
            <div class="urednik-button"><a href="dodajNovost.jsp">Dodajte novost</a></div>
        </c:if><br>
        <c:if test="${korisnik.uloga=='urednik' || korisnik.uloga=='user'}">
            <div class="urednik-button"><a href="Logout">Logout</a></div></div>
        </c:if> 
    </body>

</html>

