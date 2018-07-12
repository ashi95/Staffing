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
          	<h3><i class="fa fa-angle-right"></i> Ressource/Modifier</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p></p>
          		</div>
          	</div>
		<% 
                           String id= request.getParameter("id");
                               
                               
                             
                               PreparedStatement stmt=null;
                   Class.forName("com.mysql.jdbc.Driver");
                  Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                               %>
                     <div class="reda">
                         <h2></h2>
                               <form action="SaveProfile" method="post" id="formulaire" class="form-horizontal">
                                   <table class="table_sign_up">
                            <%
                            
                           Statement stat=conn.createStatement();
                           
                             String data="select * from profile where profile_id="+id;
                            ResultSet rs=stat.executeQuery(data);
                            while(rs.next()){
                            %>
                            <input type="hidden" name="id" value="<%=rs.getString("profile_id") %>">
                            <tr><td>  <label for="civilite">Civilite</label></td>
                                <td>
                             <%  
                            PreparedStatement psi= conn.prepareStatement("select *  from civilite");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                                         <select name="civilite" id="civilite">
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
                                    <label for ="nom">Nom complet</label></td>
                                <td> <input type="text" name="nom"  value="<%=rs.getString("nom_complet") %>"></td>
                                <td> <label for="naissance">Date de naissance</label></td>
                                <td>  <input type="date" name="naissance" value="<%=rs.getString("date_naissance") %>"></td></tr>
                        <br>
                        <tr>
                            <td>   <label for ="email">Email</label></td>
                            <td> <input type="text" name="email"  value="<%=rs.getString("email") %>"></td>
                            <td> <label for="status">Status </label></td>
                            <td>
                        <%
                            psi= conn.prepareStatement("select *  from status");
                             rsi= psi.executeQuery();
                            %>
     <select name="status" id="status">
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
                            <td>   <label for="seniorite">Seniorite </label></td>
                            <td>
<%
                            psi= conn.prepareStatement("select *  from seniorite");
                             rsi= psi.executeQuery();
                            %>
     <select name="seniorite" id="seniorite">
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
                        <tr><td>  <label for="anapec" >Anapec </label></td>
                            <td>
                        <%
                            psi= conn.prepareStatement("select *  from anapec");
                             rsi= psi.executeQuery();
                            %>
     <select name="anapec" id="anapec">
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
                        <br>
                        <td>   <label for="experience">Date premiere experience</label></td>
                        <td>   <input type="date" name="experience" value="<%=rs.getString("experience") %>"></td>
                        <td> <label for="date_debut">Date debut</label></td>
                        <td>  <input type="date" name="date_debut" value="<%=rs.getString("date_debut") %>"></td></tr>
                        <br>
                        <tr><td>  <label for="embauche">Date embauche</label>  </td>                    
                            <td>  <input type="date" name="embauche" value="<%=rs.getString("date_embauche") %>">  </td>                     
                            <td> <label for="date_fin">Date Fin</label></td>
                            <td>  <input type="date" name="date_fin" value="<%=rs.getString("date_fin") %>"></td>
                       
                       
                         
                            <td> <label for="pole">Pole </label></td>
                            <td>
  <%
                            psi= conn.prepareStatement("select *  from pole");
                             rsi= psi.executeQuery();
                            %>
     <select name="pole" id="pole">
         <%
         while(rsi.next()){
                               String info=rsi.getString("info");
         %>
         <option value="<%=info%>"><%=info%></option>
         <%
         }
         %>
     </select>  </td></tr>   
                        <br>
                        <tr><td>   <label for="fonction">Fonction </label></td>
                            <td>
<%
                            psi= conn.prepareStatement("select *  from fonction");
                             rsi= psi.executeQuery();
                            %>
     <select name="fonction" id="fonction">
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
                            <td> <label for="position">Position </label></td>
                            <td>
<%
                            psi= conn.prepareStatement("select *  from position");
                             rsi= psi.executeQuery();
                            %>
     <select name="position" id="position">
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
                            <td> <label for="idmetier">Id metier</label></td>
                            <td> <input type="number" name="idmetier" value="<%=rs.getString("id_metier") %>"></td></tr>
                        <br>
                        <tr><td>  <label for="metier">Metier </label></td>
                            <td>
<%
                            psi= conn.prepareStatement("select *  from metier");
                             rsi= psi.executeQuery();
                            %>
     <select name="metier" id="metier">
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

                            <td>  <label for="raison_sortie">Raison de sortie </label></td>
                            <td>
                          <%
                            psi= conn.prepareStatement("select *  from raison_sortie");
                             rsi= psi.executeQuery();
                            %>
     <select name="raison_sortie" id="raison_sortie">
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
     <br>
     <td><label for=" leader">Team Leader</label></td>
     <td><input type="text" name="leader" value="<%=rs.getString("leader") %>"></td></tr>

                                   <tr><td><label for="Hmanager">Manager hierarchique</label></td>
                                       <td><input type="text" name="Hmanager" value="<%=rs.getString("hierarchical_manager") %>"></td>
<br>
<td><label for="Fmanager">Manager fonctionnel</label></td>
<td><input type="text" name="Fmanager" value="<%=rs.getString("functional_manager") %>"></td>
<td><label for="creation">Date creation</label></td>
<td><input type="date" name="creation" value="<%=rs.getString("date_creation") %>"></td></tr>
<br>
<tr><td><label for="derniere_modification">Date derniere modification</label></td>
    <td><input type="date" name="derniere_modification" value="<%=rs.getString("derniere_modification") %>"></td>


    <td><label for="t1_er">T1 er</label></td>
    <td>
<%
                            psi= conn.prepareStatement("select *  from t1_er");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_er" id="t1_er">
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
    <td><label for="t1_polyv">T1 polyv</label></td>
    <td>
<%
                            psi= conn.prepareStatement("select *  from t1_polyv");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_polyv" id="t1_polyv">
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

<tr><td><label for="t1_mec">T1 mec</label></td>
    <td>
<%
                            psi= conn.prepareStatement("select *  from t1_mec");
                             rsi= psi.executeQuery();
                            %>
     <select name="t1_mec" id="t1_mec">
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
     <select name="t1_vend" id="t1_vend">
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
    <td> <label for="active">active</label></td>
    <td>
<%
                            psi= conn.prepareStatement("select *  from active");
                             rsi= psi.executeQuery();
                            %>
     <select name="active" id="active">
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
<input type="submit" value="enregistrer" />
                                                      
                       
                      <!-- Example jQuery Reference -->
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- Your Script -->
<%
                               String civilite=   Helper.getValue("info", "civilite","civilite_id" ,rs.getString("civilite_id"));
                               String anapec=   Helper.getValue("info", "anapec","anapec_id" ,rs.getString("anapec_id"));
                               String sortie=   Helper.getValue("info", "raison_sortie","sortie_id" ,rs.getString("sortie_id"));
                               String pole=   Helper.getValue("info", "pole","pole_id" ,rs.getString("pole_id"));
                               String metier=   Helper.getValue("info", "metier","metier_id" ,rs.getString("metier_id"));
                               String fonction=   Helper.getValue("info", "fonction","fonction_id" ,rs.getString("fonction_id"));
                               String status=   Helper.getValue("info", "status","status_id" ,rs.getString("status_id"));
                               String seniorite=   Helper.getValue("info", "seniorite","seniorite_id" ,rs.getString("seniorite_id"));
                               String active=   Helper.getValue("info", "active","active_id" ,rs.getString("active_id"));
                               String er=   Helper.getValue("info", "t1_er","er_id" ,rs.getString("er_id"));
                               String polyv=Helper.getValue("info", "t1_polyv","polyv_id" ,rs.getString("polyv_id"));
                               String mec=Helper.getValue("info", "t1_mec","mec_id" ,rs.getString("mec_id"));
                               String vend=Helper.getValue("info", "t1_vend","vend_id" ,rs.getString("vend_id"));
                               String position=Helper.getValue("info","position","position_id",rs.getString("position_id"));
%>
<script type='text/javascript'>
    
    //When your page has loaded
    $(function(){
        
          //Set the value of your TypeId <select> list to the element with value '33'
          $('#fonction').val("<%=fonction %>");
          $('#civilite').val("<%=civilite %>");
          $('#status').val("<%=status %>");
          $('#seniorite').val("<%=seniorite %>");
          $('#pole').val("<%=pole %>");
          $('#metier').val("<%=metier %>");
          $('#raison_sortie').val("<%=sortie %>");
          $('#t1_er').val("<%=er %>");
          $('#t1_polyv').val("<%=polyv %>");
          $('#t1_mec').val("<%=mec %>");
          $('#t1_vend').val("<%=vend %>");
          $('#active').val("<%=active %>");
          $('#anapec').val("<%=anapec %>");
          $('#position').val("<%=position %>");
    });
</script>
                        </form>	
                     </div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
 <% } %>
       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
