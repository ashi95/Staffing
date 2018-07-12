/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;



import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
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
public class control_inscription extends HttpServlet {


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
        
               
                String nom=request.getParameter("nom");
                String prenom=request.getParameter("prenom");
		String usern=request.getParameter("username");
		String pass=request.getParameter("password");
                String conf=request.getParameter("confirmation");
                String role=request.getParameter("role");
                  
     if(conf.isEmpty()||nom.isEmpty()||pass.isEmpty()||conf.isEmpty()||usern.isEmpty()||prenom.isEmpty() )
     {
                  request.setAttribute("erreur", "veuillez remplir tous les champs ");
         RequestDispatcher rd=request.getRequestDispatcher("inscription.jsp");
         rd.forward(request,response);
        }
     
     else if (nom.trim().length()<3||usern.trim().length()<3 || pass.trim().length() < 3||prenom.trim().length()<3)
     {
         request.setAttribute("erreur", "Les champs saisis doit contenir au moins 3 caractères");
          RequestDispatcher rd=request.getRequestDispatcher("inscription.jsp");
         rd.forward(request,response);
     }
     else if (!pass.equals(conf))
             {
                  request.setAttribute("erreur", "Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
                 RequestDispatcher rd=request.getRequestDispatcher("inscription.jsp");
         rd.forward(request,response);
             }
     else
     {
		
		// Connect to mysql and verify username password
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                String selectsql="SELECT nom_utilisateur from authentification where nom_utilisateur=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, usern);
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                 while(rs.next())
                 {
                  duplicate = rs.getString(1);
                 }
                if(duplicate==null)
                {
                    String insert="INSERT INTO authentification "+"(nom,nom_utilisateur,mot_passe,role) values "+" (?,?,?,?)";
		PreparedStatement ps = c.prepareStatement(insert);
		ps.setString(1, nom.concat("  "+prenom).toLowerCase());
                ps.setString(2, usern.toLowerCase());
                ps.setString(3, pass.toLowerCase());
                ps.setString(4, role.toLowerCase());
                           ps.executeUpdate();
               response.sendRedirect("ProfileA.jsp");
               
                }
                else
                {
                    request.setAttribute("erreur", "ce nom d'utilisateur exist deja ");
                 RequestDispatcher rd=request.getRequestDispatcher("inscription.jsp");
         rd.forward(request,response); 
                }
                statement.close();
                c.close();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
                
    }
     
    }
}




