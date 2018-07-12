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
public class SaveClient extends HttpServlet {

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
        
        
        int type_client=0;
        String id=request.getParameter("id");
        String client=request.getParameter("client");
        String type=request.getParameter("type");
       try {
                  Helper.getId("type_id", "type_client","info" ,type);
         type_client=Helper.id;
          
          
          
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     } catch (SQLException ex) {
        ex.printStackTrace();
     }
        
        
        
        if(client.isEmpty())
                {
                    request.setAttribute("erreur", "veuillez remplir le champ client ");        
         RequestDispatcher rd=request.getRequestDispatcher("UpdateClient.jsp");
         rd.forward(request,response);
         }
         
     
        
         else {
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                
               String selectSQL="update client set client=?,type_id=? where client_id=?";
             PreparedStatement statement =  c.prepareStatement(selectSQL);
               statement.setString(1,client.toUpperCase());
               statement.setInt(2,type_client);
                statement.setString(3,id);
                     statement.executeUpdate();
              
                
              statement.close();
                c.close();
                response.sendRedirect("ClientA.jsp");
                
               
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (SQLException ex) {
               ex.printStackTrace();
            }
        }
    }
      
        }
    


