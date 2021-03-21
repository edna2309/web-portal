/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
public class IzmijeniNovost extends HttpServlet {

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
            Connection con = null;
            Statement stmt = null;
            String address = "novost.jsp";  
            
            String naslov = request.getParameter("naslov");
            String sadrzaj = request.getParameter("sadrzaj");
            String preview = request.getParameter("preview");
            
            HttpSession sesija = request.getSession();
            String novid =(String) sesija.getAttribute("novostid");
            
            String nadji = "select * from novost where novostid = " + novid +"";             
           
            try{
                con = DB.getConnection();
                stmt = con.createStatement();                
                
                ResultSet rs = stmt.executeQuery(nadji);
                if(rs.next()){
                    if (naslov.isEmpty()){
                            naslov = rs.getString("naslov");                          
                    }
                    if(sadrzaj.isEmpty())
                    {
                            sadrzaj = rs.getString("sadrzaj");
                    }
                    if (preview.isEmpty()){
                            preview = rs.getString("preview");
                    }
                
                String upit = "update novost set naslov='" + naslov + "', sadrzaj='" + sadrzaj + "',preview='" + preview + "', datum= CURDATE() where novostid= " + novid;
                
                stmt.executeUpdate(upit);
                request.setAttribute("poruka", "Novost je uspješno izmijenjena!");                
                }
                else{
                    request.setAttribute("poruka", "Korisnik ne postoji!");
                    address = "izmjena.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(address);
                    rd.forward(request, response);
                }                
                
                
            }catch(SQLException e){
                address = "greska.jsp";
                request.setAttribute("poruka", e);
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
