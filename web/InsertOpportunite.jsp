<%-- 
    Document   : index
    Created on : 5 avr. 2018, 12:30:53
    Author     : LENOVO T440S
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 

   String nom=null;
   Cookie[] cookies=request.getCookies();
   if(cookies!=null){
       for(Cookie cookie:cookies){
           if(cookie.getName().equals("nom"))
           {
               nom=cookie.getValue();
           }
       }
       if(nom==null){
           response.sendRedirect("login.jsp");
       }
   }
 

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/include/css.jsp"%> 
        <style><%@include file="/include/input.css"%>
        
        </style>
    </head>
    <body>
        <section id="container" >
            <%@include file="/include/header.jsp" %>
       <%@include file="/include/sidebar.jsp" %>
<section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i>  Opportunite/Ajouter</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
                            <p></p>
                        </div>
                </div>
                <div class="reda">
                    <h2></h2>
          		<form action="Insertion_Opportunite" method="post" id="formulaire" class="form-horizontal"> 
                            <table class="table_sign_up">
                                <tr><td> <label for="id_merge">Code Rh</label></td>
                          <td> <input type="text" name="id_merge"></td>
                            
                              <td> <label for="chance">Opportunite</label></td>
                              <td><input type="text" name="chance" > </td> 
                        
                              <td><label for="proprietaire">Proprietaire</label></td>
                              <td>
                          <%  Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                            PreparedStatement psi= conn.prepareStatement("select *  from proprietaire");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                       <select name="proprietaire"  >
                           <%
                       while(rsi.next()){
                               String info=rsi.getString("info");
                               %>
                               <option value="<%=info%>"><%=info%></option>
                               
                               <%
                }
                               %>
                                         </select>
                              </td></tr>
                                         <br>
                                         <tr><td><label for="date_debut">Date debut d'opportunite</label></td>
                                             <td>  <input type="date" name="date_debut"></td>
                                             <td> <label for="date_fin">Date fin d'opportunite</label></td>
                                             <td>  <input type="date" name="date_fin"></td>
                       
                                             <td> <label for="client">Client</label></td>
                                             <td>
                        <%  
           
                   
                            psi= conn.prepareStatement("select *  from client");
                                         rsi= psi.executeQuery();
                                         %>
                                         <select name="client">
                                         <%
		while(rsi.next()){
                               String client=rsi.getString("client");
                               %>
                               <option value="<%=client%>"><%=client%></option>
                               <%
                }
                               %>
                               </select>
                                             </td></tr>
                               <br>
                               <tr><td>   <label for="ADM">ADM </label></td>
                                   <td>
                       <%  
           
                   
                            psi= conn.prepareStatement("select *  from ADM");
                                         rsi= psi.executeQuery();
                                         %>
                                         <select name="ADM">
                                         <%
		while(rsi.next()){
                               String info=rsi.getString("info");
                               %>
                               <option value="<%=info%>"><%=info%></option>
                               <%
                }
                               %>
                               </select>
                                   </td>
                                   <td> <label for="status">Status </label></td>
                                   <td>
                       <%  
           
                   
                            psi= conn.prepareStatement("select *  from statuso");
                                         rsi= psi.executeQuery();
                                         %>
                                         <select name="status">
                                         <%
		while(rsi.next()){
                               String info=rsi.getString("info");
                               %>
                               <option value="<%=info%>"><%=info%></option>
                               <%
                }
                               %>
                               </select>
                                   </td></tr>
                               </table>
                       <div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
                       <input type="submit" value="Enregistrer" />
                            
                        </form>   
                </div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
