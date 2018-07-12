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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO T440S
 */
public class Delete_Association extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
     
        String id=request.getParameter("affectation_id");
        
      
        
           
     
        
     
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
               String selectSQL="delete from affectation  where affectation_id=?";
               PreparedStatement statement =  c.prepareStatement(selectSQL);
               statement.setString(1,id);
               
                     statement.executeUpdate();
              
                
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