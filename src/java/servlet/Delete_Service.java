/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class Delete_Service extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
     
        String id=request.getParameter("id");
        String chance=request.getParameter("chance");
        
      
        
           
     
        
     
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                 String selectSql="SELECT service_id from projet where service_id=?";
                  PreparedStatement statement =  c.prepareStatement(selectSql);
                   statement.setString(1, id);
                    String duplicate = null;
                   ResultSet rs = statement.executeQuery();
                   
               
                if (rs.next())
                {
                    
                    duplicate = rs.getString(1);
                }
                if(duplicate==null)
                {
               String selectSQL="delete from service where service_id=?";
                statement =  c.prepareStatement(selectSQL);
               statement.setString(1,id);
               
                     statement.executeUpdate();
              
                
                statement.close();
                c.close();
                response.sendRedirect("ServiceA.jsp");
                }
                 else
                {
                    request.setAttribute("erreur", "Ce service est attache à un projet  ");
                 RequestDispatcher rd=request.getRequestDispatcher("ServiceA.jsp");
         rd.forward(request,response); 
                }
            } catch (ClassNotFoundException ex) {
               ex.printStackTrace();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
        }
      
    }