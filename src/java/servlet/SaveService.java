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
public class SaveService extends HttpServlet {

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
        
         int  client_id=0;
       
        int  adm_id=0;
        int  status_id=0;
        int proprietaire_id=0;
        String id=request.getParameter("id");
        String id_merge=request.getParameter("id_merge");
        String chance=request.getParameter("chance");
        String client=request.getParameter("client");
        String proprietaire=request.getParameter("proprietaire");
        String date_debut=(String)request.getParameter("date_debut");
        String date_fin=(String)request.getParameter("date_fin");
        String ADM=request.getParameter("ADM");
        String status=request.getParameter("status");
        
         try {
             Helper.getId("client_id", "client","client" ,client);
          client_id=Helper.id;
          Helper.getId("adm_id", "adm","info" ,ADM);
          adm_id=Helper.id;
          Helper.getId("proprietaire_id", "proprietaire","info" ,proprietaire);
          proprietaire_id=Helper.id;
          Helper.getId("statuo_id", "statuso","info" ,status);
          status_id=Helper.id;
          
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     } catch (SQLException ex) {
         ex.printStackTrace();
     }
        
        
        
        
        if(chance.isEmpty())
                {
                    request.setAttribute("erreur", "veuillez remplir le champ service ");        
         RequestDispatcher rd=request.getRequestDispatcher("UpdateService.jsp");
         rd.forward(request,response);
        
           
      
        
         }
         else if(date_debut.compareTo(date_fin)>0)
         {
         request.setAttribute("erreur", "date de debut doit etre inferieur a la date de fin ");        
         RequestDispatcher rd=request.getRequestDispatcher("UpdateService.jsp");
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
                
               String selectSQL="update service set id_merge=?,chance=?,client_id=?,proprietaire_id=?,date_debut=?,date_fin=?,adm_id=?,statuso_id=? where service_id=?";
             PreparedStatement statement =  c.prepareStatement(selectSQL);
               statement.setString(1,id_merge);
               statement.setString(2,chance.toUpperCase());
               statement.setInt(3,client_id);
               statement.setInt(4,proprietaire_id);
               statement.setString(5,date_debut);
               statement.setString(6,date_fin);
               statement.setInt(7,adm_id);
               statement.setInt(8,status_id);
               
                statement.setString(9,id);
                     statement.executeUpdate();
              
                
              statement.close();
                c.close();
                response.sendRedirect("ServiceA.jsp");
                
               
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
      
        }
    


