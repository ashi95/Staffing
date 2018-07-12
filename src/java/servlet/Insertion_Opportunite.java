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
public class Insertion_Opportunite extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
                       
       int  client_id=0;
       
        int  adm_id=0;
        int  status_id=0;
        int proprietaire_id=0;
        String id_merge=request.getParameter("id_merge");
        String name=request.getParameter("name");
        String chance=request.getParameter("chance");
        String client=request.getParameter("client");
     
        String proprietaire=request.getParameter("proprietaire");
        String date_debut=request.getParameter("date_debut");
        String date_fin=request.getParameter("date_fin");
        String ADM=request.getParameter("ADM");
        String status=request.getParameter("status");
        try {
             Helper.getId("client_id", "client","client" ,client);
          client_id=Helper.id;
          Helper.getId("adm_id", "adm","info" ,ADM);
          adm_id=Helper.id;
          Helper.getId("proprietaire_id", "proprietaire","info" ,proprietaire);
          proprietaire_id=Helper.id;
          Helper.getId("status_id", "status","info" ,status);
          status_id=Helper.id;
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
        
       
       if(chance.isEmpty())
                {
                     request.setAttribute("erreur", "veuillez remplir le champs Opporunite ");       
         RequestDispatcher rd=request.getRequestDispatcher("InsertOpportunite.jsp");
         rd.forward(request,response);
                }
        
           else if(date_debut.compareTo(date_fin)>0)
         {
         request.setAttribute("erreur", "date de debut doit etre inferieur a la date de fin ");        
         RequestDispatcher rd=request.getRequestDispatcher("InsertOpportunite.jsp");
         rd.forward(request,response);
         }
           else{
     
        
     
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
                String selectsql="SELECT chance from chance where chance=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, chance.toLowerCase());
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
               String selectSQL="insert into chance(id_merge,chance,client_id,proprietaire_id,date_debut,date_fin,adm_id,statuso_id,createur) values (?,?,?,?,?,?,?,?,?)";
                statement =  c.prepareStatement(selectSQL);
                statement.setString(1,id_merge);
               statement.setString(2,chance.toUpperCase());
               statement.setInt(3,client_id);
               statement.setInt(4,proprietaire_id);
               statement.setString(5,date_debut);
               statement.setString(6,date_fin);
               statement.setInt(7,adm_id);
               statement.setInt(8,status_id);
               statement.setString(9,nom);
              
                     statement.executeUpdate();
              
                
                statement.close();
                c.close();
                response.sendRedirect("OpportuniteA.jsp");
                }
                 else
                {
                    request.setAttribute("erreur", "ce nom d'opportunite exist deja ");
                 RequestDispatcher rd=request.getRequestDispatcher("InsertOpportunite.jsp");
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
    