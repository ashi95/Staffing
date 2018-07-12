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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO T440S
 */
public class control extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   public void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
       
   }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
            
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		
		// Connect to mysql and verify username password
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 // loads driver
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root"); // gets a new connection
                         
		PreparedStatement ps = c.prepareStatement("select * from authentification where nom_utilisateur=? and mot_passe=?");
		ps.setString(1, un);
		ps.setString(2, pw);
 
		ResultSet rs = ps.executeQuery();
            
 
		if (rs.next()) {
                    Utilisateur utilisateur=new Utilisateur();
                    utilisateur.username=un;
                    utilisateur.password=pw;
                    utilisateur.role=rs.getString(5);
                          int a=1;  
			
                      HttpSession session=request.getSession();
                      session.setAttribute("nom", utilisateur.username);
                        Cookie ck=new Cookie("nom",utilisateur.username);
                        ck.setMaxAge(60*60*24);
                        response.addCookie(ck);
                        response.sendRedirect("ProfileA.jsp");
                     
			
		}
                else {
		   request.setAttribute("erreur", "login ou mot de passe est incorrect  ");
         RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
         rd.forward(request,response);
		}
		} catch (  SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(ClassNotFoundException ex){
                    ex.printStackTrace();
                }
			}
		
}