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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO T440S
 */
public class Insertion_Projet extends HttpServlet {

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
        
     
               int opportunite_id=0;
               int service_id=0;
               int type_projet_id=0;
               int adm_id=0;
               int allocation_id=0;
               int client_id=0;
               int type_allocation_id=0;
        String nom_projet=request.getParameter("nom_projet");
        String opportunite=request.getParameter("opportunite");
        String service=request.getParameter("service");
        String date_debut=(String)request.getParameter("date_debut");
        String date_fin=(String)request.getParameter("date_fin");
        String type_projet=request.getParameter("type_projet");
        String ADM=request.getParameter("ADM");
        String allocation_cours=request.getParameter("allocation_cours");
        String type_allocation=request.getParameter("type_allocation");
        String client=request.getParameter("client");
        String budget=request.getParameter("budget");
        try {
             Helper.getId("opportunite_id", "chance","chance" ,opportunite);
          opportunite_id=Helper.id;
          Helper.getId("service_id", "service","chance" ,service);
          service_id=Helper.id;
          Helper.getId("type_projet_id", "type_projet","info" ,type_projet);
          type_projet_id=Helper.id;
          Helper.getId("adm_id", "adm","info" ,ADM);
          adm_id=Helper.id;
          Helper.getId("allocation_id", "allocation_cours","info" ,allocation_cours);
          allocation_id=Helper.id;
          Helper.getId("type_allocation_id", "type_allocation","info" ,type_allocation);
          type_allocation_id=Helper.id;
          Helper.getId("client_id", "client","client" ,client);
         client_id=Helper.id;
          
     } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
     } catch (SQLException ex) {
        ex.printStackTrace();
     }
        
        String nom=null;
   Cookie[] cookies=request.getCookies();
   if(cookies!=null){
       for(Cookie cookie:cookies){
           if(cookie.getName().equals("nom"))
           {
               nom=cookie.getValue();
           }
       }
      
      
        
        
        if(nom_projet.isEmpty())
                {
                    request.setAttribute("erreur", "veuillez remplir le champ nom de projet ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertProjet.jsp");
         rd.forward(request,response);
                }
        else if (opportunite.isEmpty())
        {
            request.setAttribute("erreur", "veuillez remplir le champ opportunite ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertProjet.jsp");
         rd.forward(request,response);
        }
        else if (service.isEmpty())
        {
            request.setAttribute("erreur", "veuillez remplir le champ service ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertProjet.jsp");
         rd.forward(request,response);
        }
         else if(date_debut.compareTo(date_fin)>0)
         {
         request.setAttribute("erreur", "date de debut doit etre inferieur a la date de fin ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertProjet.jsp");
         rd.forward(request,response);
         }
           
        else {
        
     
            // Connect to mysql and verify username password
            
            try {
                if(date_debut.isEmpty())
          {
              date_debut=null;
          }
                if(date_fin.isEmpty())
          {
              date_fin=null;
          }
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                 String selectsql="SELECT nom_projet from projet where nom_projet=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets anew connection
                statement.setString(1, nom_projet.toLowerCase());
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
               String selectSQL="insert into projet(nom_projet,opportunite_id,service_id,date_debut,date_fin,type_projet_id,adm_id,allocation_id,type_allocation_id,client_id,budget,createur) values (?,?,?,?,?,?,?,?,?,?,?,?)";
                statement =  c.prepareStatement(selectSQL);
               statement.setString(1, nom_projet.toUpperCase());
               statement.setInt(2, opportunite_id);
               statement.setInt(3, service_id);
               statement.setString(4, date_debut);
                statement.setString(5, date_fin);
                     statement.setInt(6, type_projet_id);
                     statement.setInt(7, adm_id);
                   statement.setInt(8, allocation_id);
                     statement.setInt(9, type_allocation_id);
                     statement.setInt(10, client_id);
                     statement.setString(11, budget);
                     statement.setString(12, nom);
                     statement.executeUpdate();
                
              
                statement.close();
                c.close();
                response.sendRedirect("ProjetA.jsp");
                }
                  else
                {
                    request.setAttribute("erreur", "ce nom de projet exist deja ");
                 RequestDispatcher rd=request.getRequestDispatcher("InsertProjet.jsp");
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
}


