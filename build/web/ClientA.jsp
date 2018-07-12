<%-- 
    Document   : index
    Created on : 5 avr. 2018, 12:30:53
    Author     : LENOVO T440S
--%>
<%@page import="servlet.Helper"%>
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
       <style><%@include file="/include/input.css"%> </</style>
    </head>
    <body>
        <section id="container" >
            <%@include file="/include/header.jsp" %>
       <%@include file="/include/sidebar.jsp" %>
<section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Tableau Client</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<a href="InsertClient.jsp"> <button  style="float:right; font-size: 120%;">Ajouter</button></a>
          		</div>
          	</div>
                <br>
                <table id="client" cellpadding="10" style="width:100%" >
                         <thead>
                        <tr>
                        
                        <th>Client
                            <br>
                              <input type="text" id="myInput1" onkeyup="myFunction1()" >
                        </th>
                        <th>Type
                            <br>
                            <input type="text" id="myInput2" onkeyup="myFunction2()" >
                        </th>
                      
                        <th>Modifier</th>
                        <th>Supprimer</th>
                        
                        </tr>
                           </thead>
                           
                           <tbody>
                               <% 
                               Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                   PreparedStatement ps= conn.prepareStatement("select *  from client");
		ResultSet rs= ps.executeQuery();
		while(rs.next()){
                               %>
                               <%
                            String type=   Helper.getValue("info", "type_client","type_id" ,rs.getString("type_id"));
                            %>
                           <tr>
                              
                               <td><%=rs.getString("client")%></td>
                               
                               <td><%=type%></td> 
                                
                             <%int i=rs.getInt("client_id");  %>
                              <td><a href="UpdateClient.jsp?id=<%=rs.getString("client_id")   %>"><img src="<c:url value='/include/edit2.png'/>" style=" height: 30px;width: 30px;"></a></td>
                               <td><a href="Delete_Client?id=<%=rs.getString("client_id")   %>"><img src="<c:url value='/include/edit3.png'/>" style=" height: 30px;width: 30px;" onclick="myFunction()" ></a></td>
                           
                           
       
                        </tr>   
                         <script>
function myFunction1() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("client");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>   
 <script>
function myFunction2() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput2");
  filter = input.value.toUpperCase();
  table = document.getElementById("client");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script> 
                           
                           <% } %>
                             </tbody>
                        </table>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
 <script 

src="https://code.jquery.com/jquery-1.12.4.js"></script> // JQuery Reference

<script 

src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script 

src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script 

src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script 

src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script 

src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script 

src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script 

src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script 

src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

<link rel="stylesheet" 

href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" 

href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
     
          <script type="text/javascript">
   

    $(document).ready(function () {
        $('#client').dataTable({
            "bSortCellsTop": true,
           "bFilter": false,
                "bSortClasses": false,
                searching:true,
            "scrollX":true,
            dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
       });
});
</script>


       
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
