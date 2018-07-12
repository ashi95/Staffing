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
public class SaveProfile extends HttpServlet {

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
        
                int civilite_id=0;
                int position_id=0;
                int anapec_id=0;
                int sortie_id=0;
                int pole_id=0;
                int metier_id=0;
                int fonction_id=0;
                int status_id=0;
                int seniorite_id=0;
                int active_id=0;
                int er_id=0;
                int polyv_id=0;
                int mec_id=0;
                int vend_id=0;
        
                String id=request.getParameter("id");
                 String civilite=request.getParameter("civilite");
                String nom=request.getParameter("nom");
                String naissance=request.getParameter("naissance");
                String email=request.getParameter("email");
		String position=request.getParameter("position");
		String anapec=request.getParameter("anapec");
                String date_debut=(String)request.getParameter("date_debut");
                String embauche=(String) request.getParameter("embauche");
                String date_fin=(String)request.getParameter("date_fin");
                String raison_sortie = request.getParameter("raison_sortie");                
                String experience=(String)request.getParameter("experience");
		String pole=request.getParameter("pole");    
                String id_metier=request.getParameter("idmetier");
                String metier = request.getParameter("metier");
                String fonction=request.getParameter("fonction");
                String status=request.getParameter("status");
		String seniorite=request.getParameter("seniorite");
                String leader=request.getParameter("leader");
                String Hmanager=request.getParameter("Hmanager");
                String Fmanager=request.getParameter("Fmanager");
                String creation=(String)request.getParameter("creation");
                String derniere_modification=(String)request.getParameter("derniere_modification");
                String t1_er = request.getParameter("t1_er");
                String t1_polyv=request.getParameter("t1_polyv");
                String t1_mec=request.getParameter("t1_mec");
                String t1_vend=request.getParameter("t1_vend");
                String active=request.getParameter("active");
              try {
             Helper.getId("civilite_id", "civilite","info" ,civilite);
          civilite_id=Helper.id;
          Helper.getId("anapec_id", "anapec","info" ,anapec);
          anapec_id=Helper.id;
          Helper.getId("sortie_id", "raison_sortie","info" ,anapec);
          sortie_id=Helper.id;
          Helper.getId("pole_id", "pole","info" ,pole);
          pole_id=Helper.id;
          Helper.getId("metier_id", "metier","info" ,metier);
          metier_id=Helper.id;
          Helper.getId("fonction_id", "fonction","info" ,fonction);
          fonction_id=Helper.id;
          Helper.getId("status_id", "status","info" ,status);
          status_id=Helper.id;
          Helper.getId("seniorite_id", "seniorite","info" ,seniorite);
          seniorite_id=Helper.id;
          Helper.getId("active_id", "active","info" ,active);
          active_id=Helper.id;
          Helper.getId("er_id", "t1_er","info" ,t1_er);
          er_id=Helper.id;
          Helper.getId("polyv_id", "t1_polyv","info" ,t1_polyv);
          polyv_id=Helper.id;
          Helper.getId("mec_id", "t1_mec","info" ,t1_mec);
          mec_id=Helper.id;
          Helper.getId("vend_id", "t1_vend","info" ,t1_vend);
          vend_id=Helper.id;
          Helper.getId("active_id", "active","info" ,active);
          active_id=Helper.id;
          Helper.getId("position_id", "position","info" ,position);
          position_id=Helper.id;
          
          
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     } catch (SQLException ex) {
         ex.printStackTrace();
     }
		
        
        if(nom.isEmpty())
                {
                          request.setAttribute("erreur", "veuillez remplir  les champs nom et prenom  ");  
         RequestDispatcher rd=request.getRequestDispatcher("UpdateProfile.jsp");
         rd.forward(request,response);
                }
        
		
        else{
                  
      try {
          if(date_debut.isEmpty())
          {
              date_debut=null;
          }
          if(experience.isEmpty())
          {
              experience=null;
          }
           if(date_fin.isEmpty())
          {
              date_fin=null;
          }
          if(naissance.isEmpty())
          {
              naissance=null;
          }
          if(embauche.isEmpty())
          {
              embauche=null;
          }
          
          if(id_metier.isEmpty())
          {
              id_metier="0";
          }
          if(creation.isEmpty())
          {
              creation=null;
          }
          if(derniere_modification.isEmpty())
          {
              derniere_modification=null;
          }
                Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
               
               String selectSQL="update profile set civilite_id=?,nom_complet=?,date_naissance=?,email=?,anapec_id=?,date_debut=?,date_embauche=?,date_fin=?,sortie_id=?,experience=?,pole_id=?,id_metier=?,metier_id=?,fonction_id=?,status_id=?,seniorite_id=?,leader=?,hierarchical_manager=?,functional_manager=?,date_creation=?,derniere_modification=?,er_id=?,polyv_id=?,mec_id=?,vend_id=?,active_id=?,position_id=? where profile_id=?";
              PreparedStatement  statement =  c.prepareStatement(selectSQL);
              statement.setInt(1,civilite_id);
               statement.setString(2,nom.toUpperCase());
               statement.setString(3,naissance);
               statement.setString(4,email);
               statement.setInt(5,anapec_id);
               statement.setString(6,date_debut);
               statement.setString(7,embauche);
               statement.setString(8,date_fin);
               statement.setInt(9,sortie_id);
               statement.setString(10,experience);
               statement.setInt(11,pole_id);
               statement.setString(12,id_metier);
               statement.setInt(13,metier_id);
               statement.setInt(14,fonction_id);
               statement.setInt(15,status_id);
               statement.setInt(16,seniorite_id);
               statement.setString(17,leader.toUpperCase());
               statement.setString(18,Hmanager.toUpperCase());
               statement.setString(19,Fmanager.toUpperCase());
               statement.setString(20,creation);
               statement.setString(21,derniere_modification);
               statement.setInt(22,er_id);
               statement.setInt(23,polyv_id);
               statement.setInt(24,mec_id);
               statement.setInt(25,vend_id);
                statement.setInt(26,active_id);
                statement.setInt(27,position_id);
               statement.setString(28,id);
                     statement.executeUpdate();
              
                
                statement.close();
                c.close();
                response.sendRedirect("ProfileA.jsp");
                
               
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (SQLException ex) {
               ex.printStackTrace();
            }
            
        }
      
      
    
    }
}


              
                
       
    



