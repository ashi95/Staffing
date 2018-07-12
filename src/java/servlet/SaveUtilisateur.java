/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO T440S
 */
public class SaveUtilisateur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
        String id=request.getParameter("id");
        String nom=request.getParameter("nom");
        String nom_utilisateur=request.getParameter("nom_utilisateur");
        String mot_passe=request.getParameter("mot_passe");
        String role=request.getParameter("role");
       
        
        
        
        if(nom.isEmpty()||nom_utilisateur.isEmpty()||mot_passe.isEmpty()||role.isEmpty())
                {
                    request.setAttribute("erreur", "veuillez remplir tout les champ ");        
         RequestDispatcher rd=request.getRequestDispatcher("UpdateUtilisateur.jsp");
         rd.forward(request,response);
         }
         
     
        
         else {
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                
               String selectSQL="update authentification set nom=?,nom_utilisateur=?,mot_passe=?,role=? where id=?";
             PreparedStatement statement =  c.prepareStatement(selectSQL);
               statement.setString(1,nom.toUpperCase());
               statement.setString(2,nom_utilisateur);
                statement.setString(3,mot_passe);
                        statement.setString(4,role);
                        statement.setString(5,id);
                     statement.executeUpdate();
              
                
              statement.close();
                c.close();
                response.sendRedirect("UtilisateurA.jsp");
                
               
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
      
        }
    


