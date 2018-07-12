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
          	<h3><i class="fa fa-angle-right"></i>  Projet/Ajouter</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p></p>
          		</div>
          	</div>
                <div class="reda">
                    <h2></h2>
		 <form action="Insertion_Projet" method="post" id="formulaire" class="form-horizontal">
                      <table class="table_sign_up">
                          <tr><td> <label for="nom_projet">Nom Projet</label></td>
                              <td> <input type="text" name="nom_projet" ></td>
                              <td>  <label for="opportunite">Opportunite</label></td>
                              <td>
                       <%  Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                            PreparedStatement psi= conn.prepareStatement("select *  from chance");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                                         <select name="opportunite" id="opportunite" >
                                         <%
		while(rsi.next()){
                               String chance=rsi.getString("chance");
                               %>
                               <option value="<%=chance%>"><%=chance%></option>
                               <%
                }
                               %>
                               </select>
                              </td>
                              <td>
                                  <label for="service">Centre Service</label></td>
                              <td>
                       <%  
           
                  
                  
                             psi= conn.prepareStatement("select *  from service");
                                          rsi= psi.executeQuery();
                                         %>
                                         <select name="service">
                                         <%
		while(rsi.next()){
                               String chance=rsi.getString("chance");
                               %>
                               <option value="<%=chance%>"><%=chance%></option>
                               <%
                }
                               %>
                               </select>
                              </td></tr>
                               <br>
                               <tr><td><label for="type_projet">Type projet</label></td>
                                   <td>
                              <%
                            psi= conn.prepareStatement("select *  from type_projet");
                             rsi= psi.executeQuery();
                            %>
     <select name="type_projet">
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
                                   <td>  <label for="date_debut">Date debut </label></td>
                                   <td> <input type="date" name="date_debut" ></td>
                        
                                   <td> <label for="date_fin">Date fin</label></td>
                                   <td>    <input type="date" name="date_fin"></td></tr>
                        
                        
                               <tr><td>   <label for="ADM" class="adm" id="ADM">ADM</label></td>
                      <td>
                        <%
                            psi= conn.prepareStatement("select *  from adm");
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
                      <td> <label for="allocation_cours">Staffing en cours</label></td>
                      <td>
                        <%
                            psi= conn.prepareStatement("select *  from allocation_cours");
                             rsi= psi.executeQuery();
                            %>
     <select name="allocation_cours">
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
                      <td>  <label for ="type_allocation">Type d'allocation</label></td>
                      <td>   
                      <%
                            psi= conn.prepareStatement("select *  from type_allocation");
                             rsi= psi.executeQuery();
                            %>
     <select name="type_allocation">
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
                      <tr><td>   <label for="client">Client</label></td>
                          <td>
                          <%  
                             psi= conn.prepareStatement("select *  from client");
                                          rsi= psi.executeQuery();
                                         %>
                                         <select name="client" id="client">
                                         <%
		while(rsi.next()){
                               String client=rsi.getString("client");
                               %>
                               <option value="<%=client%>"><%=client%></option>
                               <%
                }
                               %>
                               </select>
                          </td>
                          <td>   <label for="budget">Budget</label></td>
                          <td> <input type="number" name="budget" min="0" value="0" ></td></tr>
                        
                        </table>
                        <br/>
                        <div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
                        <input type="submit" value="Enregistrer" >
                      
                        </form>
                </div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

       
       <%@include file="/include/footer.jsp" %>
        </section>
       
    </body>
</html>

    