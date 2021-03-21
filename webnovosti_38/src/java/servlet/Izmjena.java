/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DB;

/**
 *
 * @author User
 */
public class Izmjena extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesija = request.getSession();
        korisnik k = (korisnik) sesija.getAttribute("korisnik");
        
        String email = request.getParameter("email");
        String uloga = request.getParameter("uloga");
       
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String id = request.getParameter("korisnikid");        
        String aktivan = request.getParameter("aktivan");       

        sesija.setAttribute("korisnik", k);
        String nadji = "select * from korisnik where korisnikid = " + id +""; 
       
                
        Connection con = null;
        Statement stmt = null;
        String address = "admin.jsp";
        
        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(nadji);
            
            if(rs.next()){
                if (email.isEmpty()){
                        email = rs.getString("email");                          
                }
                if(ime.isEmpty())
                {
                        ime = rs.getString("ime");
                }
                if (prezime.isEmpty()){
                        prezime = rs.getString("prezime");
                }
                if (uloga==null){
                        uloga = rs.getString("uloga");                        
                }  
                if(aktivan == null){
                    aktivan = rs.getString("aktivan");  
                }
                if("aktivan".equals(aktivan)){
                    k.setAktivan(true);
                }                
                else{
                    k.setAktivan(false);
                }
                k.setEmail(email);
                k.setPrezime(prezime);
                k.setIme(ime);
                k.setUloga(uloga);
                
                String upit = "update korisnik set "
                + "email = '" + email + "', "
                + "uloga = '" + uloga + "', "
                + "ime='" + ime + "', "
                + "prezime = '" + prezime + "',"
                + "aktivan = '" + aktivan 
                + "' where korisnikid=" + id + "";
                
                stmt.executeUpdate(upit);
                
            }
            else{
                request.setAttribute("poruka", "Korisnik ne postoji!");
                address = "izmjena.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            sesija.invalidate();      
            request.setAttribute("poruka", e);
            address = "greska.jsp";

        }
        request.setAttribute("poruka", "Podaci su uspješno izmijenjeni!");
        RequestDispatcher rd = request.getRequestDispatcher(address);
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
