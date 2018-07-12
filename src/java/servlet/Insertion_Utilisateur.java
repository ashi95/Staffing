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
import java.sql.Statement;
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
public class Insertion_Utilisateur extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
                       
       
        String nom=request.getParameter("nom");
        String nom_utilisateur=request.getParameter("nom_utilisateur");
        String mot_passe=request.getParameter("mot_passe");
        String role=request.getParameter("role");
        
        
       
       if(nom.isEmpty()||nom_utilisateur.isEmpty()||mot_passe.isEmpty()||role.isEmpty())
                {
                     request.setAttribute("erreur", "veuillez remplir tout les champs  ");       
         RequestDispatcher rd=request.getRequestDispatcher("InsertUtilisateur.jsp");
         rd.forward(request,response);
                }
        
           
           else{
     
        
     
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                String selectsql="SELECT nom_utilisateur from authentification where nom_utilisateur=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, nom_utilisateur.toLowerCase());
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
               String selectSQL="insert into authentification(nom,nom_utilisateur,mot_passe,role) values (?,?,?,?)";
                statement =  c.prepareStatement(selectSQL);
               statement.setString(1,nom.toUpperCase());
               statement.setString(2,nom_utilisateur);
               statement.setString(3,mot_passe);
               statement.setString(4,role);
                     statement.executeUpdate();
              
                
                statement.close();
                c.close();
                response.sendRedirect("UtilisateurA.jsp");
                }
                 else
                {
                    request.setAttribute("erreur", "ce nom de compte exist deja ");
                 RequestDispatcher rd=request.getRequestDispatcher("InsertUtilisateur.jsp");
         rd.forward(request,response); 
                }
                
            } catch (ClassNotFoundException ex) {
               ex.printStackTrace();
            } catch (SQLException ex) {
               ex.printStackTrace();
            }
            
        }
      
    }
}
    