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
          	<h3><i class="fa fa-angle-right"></i>Client/Modifier</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
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
                               <form action="SaveClient" method="post" id="formulaire">
                                   <table class="table_sign_up">
                            <%
                            
                           Statement stat=conn.createStatement();
                           
                            String data="select * from client where client_id="+id;
                            ResultSet rs=stat.executeQuery(data);
                            while(rs.next()){
                            %>
                             <input type="hidden" name="id" value="<%=rs.getString("client_id") %>">
                             <tr><td>  <label for="client" style="margin-right: 20px;">Client</label></td>
                                 <td><input type="text" name="client"  value="<%=rs.getString("client") %>"></td>
                        
                                 <td> <label for="type" style="margin-right: 20px;">Type </label></td>
                                 <td>
                       <%  
           
                   
                            PreparedStatement psi= conn.prepareStatement("select *  from type_client");
                                         ResultSet rsi= psi.executeQuery();
                                         %>
                                         <select name="type" id="type">
                                         <%
		while(rsi.next()){
                               String info=rsi.getString("info");
                               %>
                               <option value="<%=info%>"><%=info%></option>
                               <%
                }
                               %>
                               </select>
                                 </td></tr></table>
                       <div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
                       <input type="submit" value="Valider"  />
                       <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- Your Script -->
<%
                            String type=   Helper.getValue("info", "type_client","type_id" ,rs.getString("type_id"));
                            %>
<script type='text/javascript'>
    
    //When your page has loaded
    $(function(){
        
          //Set the value of your TypeId <select> list to the element with value '33'
         
          $('#type').val("<%=type %>");
         
          
         
    });
</script>
                        <% } %>
                         </form>
                </div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
