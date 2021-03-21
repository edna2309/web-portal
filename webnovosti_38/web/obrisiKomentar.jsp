<%-- 
    Document   : obrisiKomentar
    Created on : 01-Dec-2020, 22:00:58
    Author     : User
--%>

<%@page import="util.DB"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            Connection con = null;
            Statement stmt = null;
            String komid= request.getParameter("komentarid");
            String upit= "delete from komentar where komentarid ="+ komid ;
            
            HttpSession sesija = request.getSession();
            String novid = (String) sesija.getAttribute("novostid");
            
            String address = "pregledNovosti.jsp?novostid=" + novid;
            try{
                con=DB.getConnection();
                stmt = con.createStatement();
                stmt.executeUpdate(upit);
                stmt.close();
                con.close();                
            }catch(SQLException e){
                request.setAttribute("poruka", e);
                address = "greska.jsp";                
            }
            
            request.getRequestDispatcher(address).forward(request, response);
            

        %>
    </body>
</html>
