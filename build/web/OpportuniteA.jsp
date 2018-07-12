<%-- 
    Document   : index
    Created on : 5 avr. 2018, 12:30:53
    Author     : LENOVO T440S
--%>
<%@page import="servlet.Helper"%>
<%@page session="true"%>
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
        <style><%@include file="/include/input.css"%> </</style>
    </head>
    <body>
        
        
        
        <section id="container" >
            <%@include file="/include/header.jsp" %>
       <%@include file="/include/sidebar.jsp" %>
<section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Tableau Opportunite</h3>
          	<div class="row mt">
          		<div class="col-lg-12">                    
          		<a href="InsertOpportunite.jsp"> <button  style="float:right; font-size: 120%;">Ajouter</button></a>
                        
          		</div>
          	</div>
                <br>
		 <table id="opportunite"cellpadding="10">
                           <thead>
                        <tr>
                        <th>Code RH
                        <br>
                              <input type="text" id="myInput1" onkeyup="myFunction1()" ></th>
                        
                        <th>Opportunite
                        <br>
                              <input type="text" id="myInput2" onkeyup="myFunction2()" ></th>
                        
                        <th>Client
                        <br>
                              <input type="text" id="myInput3" onkeyup="myFunction3()" ></th>
                        <th>Proprietaire
                        <br>
                              <input type="text" id="myInput4" onkeyup="myFunction4()" ></th>
                        <th>Date debut
                        <br>
                              <input type="text" id="myInput5" onkeyup="myFunction5()" ></th>
                        <th>Date fin
                        <br>
                              <input type="text" id="myInput6" onkeyup="myFunction6()" ></th>
                        <th>ADM
                        <br>
                              <input type="text" id="myInput7" onkeyup="myFunction7()" ></th>
                       
                        <th>Status
                        <br>
                              <input type="text" id="myInput8" onkeyup="myFunction8()" ></th>
                        <th>Createur
                        <br>
                              <input type="text" id="myInput8" onkeyup="myFunction9()" ></th>
                       
                        <th>Modifier</th>
                        <th>Supprimer</th>
                      
    
                        </tr>
                           </thead>
                           <tbody>
                               <% 
                               Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                   PreparedStatement ps= conn.prepareStatement("select *  from chance ORDER BY opportunite_id");
		ResultSet rs= ps.executeQuery();
		while(rs.next()){
                               
                            String client=   Helper.getValue("client", "client","client_id" ,rs.getString("client_id"));
                            String proprietaire=Helper.getValue("info", "proprietaire", "proprietaire_id", rs.getString("proprietaire_id"));
                            String adm=Helper.getValue("info", "adm", "adm_id", rs.getString("adm_id"));
                            String status=Helper.getValue("info", "statuso", "statuo_id", rs.getString("statuso_id"));
                            %>
                           <tr>
                              <td><%=rs.getString("id_merge")%></td>
                               <td><%=rs.getString("chance")%></td>
                               
                                <td><%=client%></td> 
                                <td><%=proprietaire%></td> 
                               <td><%
                                   String date=rs.getString("date_debut");
                                   if(date==null)
                                           {
                                            date = " ";
                                           %><%=date%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_debut")%><%
                                   }
                                   %></td> 
                               <td><%
                                   String date1=rs.getString("date_fin");
                                   if(date1==null)
                                           {
                                            date1 = " ";
                                           %><%=date1%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_fin")%><%
                                   }
                                   %></td>  
                               <td><%=adm%></td> 
                               <td><%=status%></td>
                               <td><%=rs.getString("createur")%></td>
                                <%int i=rs.getInt("opportunite_id");  %>
                               <%
                               
                               if(status.equals("annuler"))
                               {
                               %>
                               <td></td>
                                <% } 
                               else
                               {
                                %>
                               
                                <td id="link"><div  ><a   href="UpdateOpportunite.jsp?id=<%=rs.getString("opportunite_id")   %>" ><img  src="<c:url value='/include/edit2.png'/>" style=" height: 30px;width: 30px; "  ></a></div></td>
                                <% } %>
                              <td><a href="Delete_Opportunite?id=<%=rs.getString("opportunite_id")%>&chance=<%=rs.getString("chance")%>" ><img src="<c:url value='/include/edit3.png'/>" style=" height: 30px;width: 30px;"></a></td>
                                   <script>
function myFunction1() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
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
  table = document.getElementById("opportunite");
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

<script>
function myFunction3() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput3");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
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
function myFunction4() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput4");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
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
function myFunction5() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput5");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[4];
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
function myFunction6() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput6");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[5];
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
function myFunction7() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput7");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[6];
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
function myFunction8() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput8");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[7];
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
function myFunction9() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput9");
  filter = input.value.toUpperCase();
  table = document.getElementById("opportunite");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[8];
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


                               
                           </tr>
                                                 
                           <% } %>
                           </tbody>
                        </table>
                           <form action="Importer_Opportunite" method="post" enctype="multipart/form-data">
                               <input type="file" name="file"/>
                               <input type="submit" value="importer">
                           </form>
                           <div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
                
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
        $('#opportunite').dataTable({
            "order": [],
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
