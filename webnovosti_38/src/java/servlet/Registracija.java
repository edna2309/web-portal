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
import javax.swing.JOptionPane;
import util.DB;

/**
 *
 * @author User
 */
public class Registracija extends HttpServlet {

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
        korisnik k = new korisnik();

        String un = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        
        String poruka = "";
        if (un.isEmpty() || pass.isEmpty() || email.isEmpty() || ime.isEmpty() || prezime.isEmpty()) {
            poruka = "Niste popunili sva polja!";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("registracija.jsp");            
            rd.forward(request, response);
            return;
        }       
        
        k.setEmail(email);
        k.setUsername(un);
        k.setPassword(pass);
        k.setPrezime(prezime);
        k.setIme(ime);
        k.setUloga("user");
        k.setAktivan(true);
        
        String provjeraEmail = "select email from korisnik where email = '" + email + "'";
        String provjeraUsername = "select username from korisnik where username = '" + un + "'";
        
        HttpSession sesija = request.getSession();
        sesija.setAttribute("korisnik", k);
              
        String upit = "insert into korisnik(username, password, email, ime, prezime, uloga, aktivan) values ('" + un + "', '" + pass + "', '" + email + "', '" + ime + "', '" + prezime+"', 'user', 'aktivan')";

        Connection con = null;
        Statement stmt = null;
        String address = "novost.jsp";

        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(provjeraUsername);
            if(rs.next()==false){
                rs=stmt.executeQuery(provjeraEmail);
                if(rs.next()==false){
                    stmt.executeUpdate(upit);
                }
                else{
                    sesija.invalidate();
                    request.setAttribute("poruka", "Email već postoji!");
                    address = "registracija.jsp";
                }
            }else{
                    sesija.invalidate();
                    request.setAttribute("poruka", "Username već postoji!");
                    address = "registracija.jsp";
                }
            
            RequestDispatcher rd = request.getRequestDispatcher(address);
            rd.forward(request, response);
            stmt.close();
            con.close();
            
        } catch (SQLException e) {
            sesija.invalidate();
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
            address = "error";

        }
        
        request.setAttribute("poruka", "Uspješno ste se registrovali!");
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
