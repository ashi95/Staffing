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
public class SaveAssociation extends HttpServlet {

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
			 throws ServletException, IOException,NullPointerException {
        
         int projet_id=0;
        int perimetre_id=0;
          String id=request.getParameter("id");       
        String nom_projet=request.getParameter("nom_projet");
        String nom_complet[]=request.getParameterValues("nom_complet");
        String date_debut=(String)request.getParameter("date_debut");
        String date_fin=(String)request.getParameter("date_fin");
        String pourcentage=request.getParameter("pourcentage");
        String perimetre=request.getParameter("perimetre");
        String leader=request.getParameter("leader");
        String manager=request.getParameter("manager");
      //données pour la comparaison des dates 
      try {
             Helper.getId("projet_id", "projet","nom_projet" ,nom_projet);
          projet_id=Helper.id;
          Helper.getId("perimetre_id", "perimetre","info" ,perimetre);
          perimetre_id=Helper.id;
          
          
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     } catch (SQLException ex) {
         ex.printStackTrace();
     }
      
        
        
        if(nom_complet==null||date_debut.isEmpty()||date_fin.isEmpty()||pourcentage.isEmpty())
                {
                    request.setAttribute("erreur", "veuillez remplir tous les champs ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertAssociation.jsp");
         rd.forward(request,response);
                }
         else if(date_debut.compareTo(date_fin)>0)
         {
         request.setAttribute("erreur", "date de debut doit etre inferieur a la date de fin ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertAssociation.jsp");
         rd.forward(request,response);
         }
           
        else {
        int taille=nom_complet.length;
     
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                 Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                PreparedStatement statement=null;
                for(int i=0;i<taille;i++){
                
               
                String selectSQL="update affectation set projet_id=?,nom_complet=?,date_debut=?,date_fin=?,pourcentage=?,perimetre_id=?,leader=?,manager=? where affectation_id=?";
                statement =  c.prepareStatement(selectSQL);
                
               
               statement.setInt(1, projet_id);
               statement.setString(2,nom_complet[i]);
               statement.setString(3, date_debut);
               statement.setString(4, date_fin);
               statement.setString(5, pourcentage);       
               statement.setInt(6,perimetre_id);
                     statement.setString(7, leader.toUpperCase());
                     statement.setString(8, manager.toUpperCase());
                     statement.setString(9,id);
                     statement.executeUpdate();
                
                }
                statement.close();
                c.close();
                response.sendRedirect("AssociationA.jsp");
                
                
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
        
         }
    }
    }




      
        
    



    
