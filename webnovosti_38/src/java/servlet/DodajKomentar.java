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
public class DodajKomentar extends HttpServlet {

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
            String n = (String) sesija.getAttribute("novostid");
            
            Connection con = null;
            Statement stmt = null;
            String address = "pregledNovosti.jsp?novostid=" + n;
            String poruka  = "";
            
            String sadrzajKom = request.getParameter("sadrzajKom");
            if (sadrzajKom.isEmpty()) {
                poruka = "Komentar ne može biti prazan!";
                request.setAttribute("poruka", poruka);
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
                return;
            }            
            String nadji = "select korisnikid from korisnik where username='" + k.getUsername() + "'";
            
            try{
                con = DB.getConnection();
                stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(nadji);                
                if(rs.next()){
                    String upit = "insert into komentar(sadrzaj, datum, korisnikid, novostid) values('" + sadrzajKom + "', CURDATE(), " + rs.getInt("korisnikid") + ", " + n +")";
                    stmt.executeUpdate(upit);
                }                
            }catch(SQLException e){
                System.out.println("Greska: " + e);
                request.setAttribute("poruka", e);
                address = "greska.jsp";
            }
            request.getRequestDispatcher(address).forward(request, response);
            
            
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
