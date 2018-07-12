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
               Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                   String selectsql="SELECT role from authentification where nom_utilisateur=?";
                PreparedStatement statement =  conn.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, nom);
                 ResultSet rs = statement.executeQuery();
                String role = null;
                while (rs.next())
                {
                    role = rs.getString(1);
                    if(role.contains("manager")||role.contains("direction"))
                    {}
                    else{
                        request.setAttribute("erreur", "vous n'avez pas l'accés a cette page ");
                 RequestDispatcher rd=request.getRequestDispatcher("ProfileA.jsp");
         rd.forward(request,response);
                    }
                }
               
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
          	<h3><i class="fa fa-angle-right"></i> Utilisateur/Ajouter</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p></p>
          		</div>
          	</div>
                <div class="reda">
                    <h2></h2>
		  <form action="Insertion_Utilisateur" method="post" id="formulaire">
                      <table class="table_sign_up">
                          
                          <tr><td><label for="nom">Nom Complet</label></td>
                              <td><input type="text" name="nom" ></td>
                              <td><label for="nom_utilisateur">Nom Profile</label></td>
                              <td><input type="text" name="nom_utilisateur" > </td>     
                        <br>
                        <td><label for="mot_passe">Mot de passe</label></td>
                        <td><input type="password" name="mot_passe"></td></tr>
                      <tr><td> <label for ="role">Role</label></td>
                          <td>
                         <%  Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                            PreparedStatement psi= conn.prepareStatement("select *  from role");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                                         <select name="role">
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
                               <table>
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
    $(function () {
        $('#lstFruits').multiselect({
            includeSelectAllOption: true
        });
    });
</script>
       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
