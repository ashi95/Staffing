<%-- 
    Document   : index
    Created on : 5 avr. 2018, 12:30:53
    Author     : LENOVO T440S
--%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
          	<h3><i class="fa fa-angle-right"></i> Ressource/Ajouter</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p></p>
          		</div>
          	</div>
                <div class="reda">
                    <h2></h2>
			 <form action="Insertion_Profile" method="post" id="formulaire" >
                             <table cellpadding="0" cellspacing="0">
                            
                                
                                     <tr>
                                         <th>  <label for="civitlite" >Civilite</label></th>
                                         <td>  
                             <%  Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                            PreparedStatement psi= conn.prepareStatement("select *  from civilite");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                                         <select name="civilite">
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
                                         <td class="hidden"></td>
                                         <th>  <label for="nom">Nom</label></th>
                                         <th><input type="text" name="nom" ></th>
                                         <th>   <label for="nom">Prenom</label></th>
                                         <th>      <input type="text" name="prenom" ></th></tr>
                        </div>
                        <br>
                        <div class="form-group">
                            <tr> <td><label for="naissance">Date naissance</label></td>
                                <td>   <input type="date" name="naissance"></td>
                        
                                <td>  <label for="email">email</label></td>
                                <td> <input type="text" name="email"></td>
                        
                                <td> <label for="status">Status </label></td>
                                <td>
                            <%
                            psi= conn.prepareStatement("select *  from status");
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
                        </div>
     <br>
     <tr>
         <td> <label for="seniorite">Seniorite </label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from seniorite");
                             rsi= psi.executeQuery();
                            %>
     <select name="seniorite">
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
         <td>
             <label for="anapec">Anapec </label></td>
         <td>   
                        <%
                            psi= conn.prepareStatement("select *  from anapec");
                             rsi= psi.executeQuery();
                            %>
     <select name="anapec">
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
         <td>          <label for="experience">Date premiere experience</label></td>
         <td>   <input type="date" name="experience"></td>
                        <br>
                        <tr><td>  <label for="date_debut">Date debut</label></td>
                            <td>   <input type="date" name="date_debut"></td>
                        
                                            
                            <td>  <label for="date_fin">Date Fin</label></td>
                        
                            <td>    <input type="date" name="date_fin" onchange="reda()"></td>
                            <td>       <label for="raison_sortie" id="seelect" style="visibility:hidden;">Raison de sortie </label></td>
                            <td>
                        <%
                            psi= conn.prepareStatement("select *  from raison_sortie");
                             rsi= psi.executeQuery();
                            %>
                            <select name="raison_sortie" id="select" style="visibility: hidden; " >
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
                        <tr>   <td> <label for="embauche">Date embauche</label>     </td>                 
                        <td>  <input type="date" name="embauche"> </td>
    
                        <td><label for="pole">Pole </label></td>
                        <td>
                        <%
                            psi= conn.prepareStatement("select *  from pole");
                             rsi= psi.executeQuery();
                            %>
     <select name="pole">
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
                        <td>
                            <label for="fonction">Fonction </label></td>
                        <td>
<%
                            psi= conn.prepareStatement("select *  from fonction");
                             rsi= psi.executeQuery();
                            %>
     <select name="fonction">
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
     <tr><td>
             <label for="position">Position </label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from position");
                             rsi= psi.executeQuery();
                            %>
     <select name="position">
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
         <td><label for="idmetier">Id metier</label></td>
         <td>  <input type="number" name="idmetier" value="0"></td>
    
         <td>      <label for="metier">Metier </label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from metier");
                             rsi= psi.executeQuery();
                            %>
                            <select name="metier">
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
     <tr><td>
             <label for="leader">Team Leader</label></td>
         <td><input type="text" name="leader" ></td>

         <td><label for="Hmanager">Manager hierarchique</label></td>
         <td><input type="text" name="Hmanager" ></td>

         <td><label for="Fmanager">Manager fonctionnel</label></td>
         <td><input type="text" name="Fmanager" ></td>
     </tr>
     <tr>
         <td><label for="creation">Date creation</label></td>
         <td><input type="date" name="creation"></td>

         <td> <label for="derniere_modification">Date derniere modification</label></td>
         <td><input type="date" name="derniere_modification"></td>


         <td><label for="t1_er">T1 er</label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from t1_er");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_er">
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
     
     <tr><td><label for="t1_polyv">T1 polyv</label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from t1_polyv");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_polyv">
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
         
         <td><label for="t1_mec">T1 mec</label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from t1_mec");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_mec">
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
         <td><label for="t1_vend">T1 vend</label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from t1_vend");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_vend">
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
     <tr><td> <label for="active">active</label></td>
         <td>
<%
                            psi= conn.prepareStatement("select *  from active");
                             rsi= psi.executeQuery();
                            %>
     <select name="active">
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
                    </table>         
     <script>
         function reda(){
             document.getElementById("select").style.visibility='visible';
             document.getElementById("seelect").style.visibility='visible';
            
         }
     </script>

<div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
<input type="submit" value="enregistrer" class="submit"/>
                        
</form>
</div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
