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
        <style><%@include file="/include/input.css"%> </</style>
    </head>
    
    <body>
        <section id="container" >
            <%@include file="/include/header.jsp" %>
       <%@include file="/include/sidebar.jsp" %>
<section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Tableau Association</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
                           <a href="InsertAssociation.jsp"> <button  style="float:right; font-size: 120%;">Ajouter</button></a>
          		</div>
          	</div>
                <br/>
                
		   <table id="utilisateur" cellpadding="10">
                           <thead>
                        <tr>
                        
                        <th>Nom projet
                        <br>
                              <input type="text" id="myInput1" onkeyup="myFunction1()" ></th>
                        <th>Nom profile
                        <br>
                              <input type="text" id="myInput2" onkeyup="myFunction2()" ></th>
                        <th>Date debut
                        <br>
                              <input type="text" id="myInput3" onkeyup="myFunction3()" ></th>
                        <th>Date fin
                        <br>
                              <input type="text" id="myInput4" onkeyup="myFunction4()" ></th>
                        <th>Pourcentage
                        <br>
                              <input type="text" id="myInput5" onkeyup="myFunction5()" ></th>
                          <th>Perimetre
                        <br>
                              <input type="text" id="myInput6" onkeyup="myFunction6()" ></th>
                        <th>Leader
                        <br>
                              <input type="text" id="myInput7" onkeyup="myFunction7()" ></th>
                        <th>Manager
                        <br>
                              <input type="text" id="myInput8" onkeyup="myFunction8()" >
                        </th>
                        <th>Modifier</th>
                        <th>Suppression</th>
    
                        </tr>
                           </thead>
                           <tbody>
                               <% 
                               Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                   PreparedStatement ps= conn.prepareStatement("select *  from affectation ORDER BY affectation_id");
		ResultSet rs= ps.executeQuery();
		while(rs.next()){
                               %>
                               <%
                                String projet=   Helper.getValue("nom_projet", "projet","projet_id" ,rs.getString("projet_id"));
                                String perimetre=   Helper.getValue("info", "perimetre","perimetre_id" ,rs.getString("perimetre_id"));
                               %>
                           <tr>
                               
                               <td><%=projet%></td> 
                               <td><%=rs.getString("nom_complet")%></td> 
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
                               <td><%=rs.getString("pourcentage")%></td> 
                               <td><%=perimetre%></td>
                               <td><%=rs.getString("leader")%></td> 
                               <td><%=rs.getString("manager")%></td> 
                               <%int i=rs.getInt("affectation_id");  %>
                               <td><a href="UpdateAssociation.jsp?affectation_id=<%=rs.getString("affectation_id")%>" ><img src="<c:url value='/include/edit2.png'/>" style=" height: 30px;width: 30px;"></a></td>
                              <td><a href="Delete_Association?affectation_id=<%=rs.getString("affectation_id")%>" ><img src="<c:url value='/include/edit3.png'/>" style=" height: 30px;width: 30px;"></a></td>
                               <script>
function myFunction1() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
  table = document.getElementById("utilisateur");
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
                           </tr>
                                                  
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
        $('#utilisateur').dataTable({
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
