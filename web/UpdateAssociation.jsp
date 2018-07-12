<%-- 
    Document   : index
    Created on : 5 avr. 2018, 12:30:53
    Author     : LENOVO T440S
--%>
<%@page import="servlet.Helper"%>
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
          	<h3><i class="fa fa-angle-right" style="font-weight:normal"></i>Affectation/Modifier  </h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p></p>
          		</div>
          	</div>
                <div class="reda">
                    <h2></h2>
		 <form action="SaveAssociation" method="post" id="formulaire" class="form-horizontal">
                     <table class="table_sign_up">
                         <tr><td><label for="nom_projet" style="font-weight:normal">Nom Projet</label></td>
                             <td>
                      <%  Connection conn=null;
                            
                           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                            PreparedStatement psi= conn.prepareStatement("select *  from projet");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                                         <select name="nom_projet">
                                         <%
		while(rsi.next()){
                               String nom_projet=rsi.getString("nom_projet");
                               %>
                               <option value="<%=nom_projet%>"><%=nom_projet%></option>
                               <%
                }
                               %>
                               </select>
                             </td>
                             <td> <label for="nom_complet" style="font-weight:normal">Nom Complet</label></td>
                             <td>
                       <%  
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                             psi= conn.prepareStatement("select *  from profile");
                                       rsi= psi.executeQuery();
                                         %>
                                        <select id="lstFruits" multiple="multiple" name="nom_complet">
                                         <%
		while(rsi.next()){
                               String nom_complet=rsi.getString("nom_complet");
                               %>
                               <option value="<%=nom_complet%>"><%=nom_complet%></option>
                               <%
                }
                               %>
                               </select>
                             </td>
                            
                             <%
                            String id= request.getParameter("affectation_id");
                           Statement stat=conn.createStatement();
                           
                            String data="select * from affectation where affectation_id="+id;
                            ResultSet rs=stat.executeQuery(data);
                            while(rs.next()){
                            %>
                             
                             <input type="hidden" name="id" value="<%=rs.getString("affectation_id") %>">
                             <td>  <label for="date_debut" style="font-weight:normal;">Date debut </label></td>
                             <td>   <input type="date" name="date_debut" value="<%=rs.getString("date_debut") %>" style="margin-top: 20px;"></td></tr>
                        
                     <tr>   <td>  <label for="date_fin" style="font-weight:normal">Date fin</label></td>
                         <td> <input type="date" name="date_fin"  value="<%=rs.getString("date_fin") %>" style="margin-top: 20px;"></td>
                        <br>
                        
                        <td> <label for="pourcentage" style="font-weight:normal">Pourcentage </label></td>
                        <td> <input type="number" name="pourcentage" min="0" max="100" step="10" value="<%=rs.getString("pourcentage") %>" style="margin-top: 20px;"></td>
                        <td><label for="perimetre" style="font-weight:normal">Perimetre</label></td>
                        <td>
                          <%
                            psi= conn.prepareStatement("select *  from perimetre");
                             rsi= psi.executeQuery();
                            %>
     <select name="perimetre">
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
                     <tr><td> <label for="leader" style="font-weight:normal">Team Leader</label></td>
                         <td>  <input type="text" name="leader" value="<%=rs.getString("leader") %>" style="margin-top: 20px;"></td>
                        <br>
                        <td>  <label for="manager" style="font-weight:normal">Team Manager</label></td>
                        <td><input type="text" name="manager" value="<%=rs.getString("manager") %>" style="margin-top: 20px;">  </td>
                        <%
                                
                            }
                        %>
                        </table>
                        <br>
                        <div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
                        
                        <input type="submit" value="Enregistrer" >
                     
                        </form>
                </div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      
      
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
<script type="text/javascript">
    $("select").multiselect().multiselectfilter(); 
</script>
       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
