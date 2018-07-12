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
public class Insertion_Client extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
              int type_client=0;         
       
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
                     request.setAttribute("erreur", "veuillez saisir le champ client ");       
         RequestDispatcher rd=request.getRequestDispatcher("InsertClient.jsp");
         rd.forward(request,response);
                }
        
           
           else{
     
        
     
            // Connect to mysql and verify username password
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                String selectsql="SELECT client from client where client=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, client.toLowerCase());
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
               String selectSQL="insert into client(client,type_id) values (?,?)";
                statement =  c.prepareStatement(selectSQL);
               statement.setString(1,client.toUpperCase());
               statement.setInt(2,type_client);
               
                     statement.executeUpdate();
              
                
                statement.close();
                c.close();
                response.sendRedirect("ClientA.jsp");
                }
                 else
                {
                    request.setAttribute("erreur", "ce nom de client exist deja ");
                 RequestDispatcher rd=request.getRequestDispatcher("InsertClient.jsp");
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
    