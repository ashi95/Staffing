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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO T440S
 */
public class LogOut extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
        
     Cookie cookie = new Cookie("nom", "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
       
                response.sendRedirect("login.jsp");
            
            
        }
      
    }