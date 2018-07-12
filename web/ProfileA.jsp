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
          	<h3><i class="fa fa-angle-right"></i> Tableau Ressource</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
                            <p><a href="InsertProfile.jsp"> <button  style="float:right; font-size: 120%;">Ajouter</button></a></p>
          		</div>
          	</div>
                 <br/>
                <table id="profile" cellpadding="10" style="width:100%" >
                           <thead>
                        <tr>
                            <th>Civilite
                            <br>
                              <input type="text" id="myInput1" onkeyup="myFunction1()" ></th>
                        <th>Nom complet
                        <br>
                              <input type="text" id="myInput2" onkeyup="myFunction2()" >
                        <th>Date naissance
                        <br>
                        <input type="text" id="myInput3" onkeyup="myFunction3()" > </th>
                        <th>Email
                        <br>
                        <input type="text" id="myInput4" onkeyup="myFunction4()" > </th>
                        
                        <th>Anapec
                        <br>
                              <input type="text" id="myInput5" onkeyup="myFunction5()" ></th>
                        
                        <th>Date debut
                        <br>
                              <input type="text" id="myInput6" onkeyup="myFunction6()" ></th>
                        <th>Date embauche
                        <br>
                              <input type="text" id="myInput7" onkeyup="myFunction7()" ></th>
                        
                        <th>Date fin
                        <br>
                              <input type="text" id="myInput8" onkeyup="myFunction8()" ></th>
                       
                        
                        <th>Raison sortie
                        <br>
                              <input type="text" id="myInput9" onkeyup="myFunction9()" ></th>
                                               
                        <th>Date  premiere experience
                        <br>
                              <input type="text" id="myInput10" onkeyup="myFunction10()" ></th>
                        
                        <th>Pole
                        <br>
                              <input type="text" id="myInput11" onkeyup="myFunction11()" ></th>
                        <th>Id metier
                        <br>
                              <input type="text" id="myInput12" onkeyup="myFunction12()" ></th>
                        
                        <th>Metier
                        <br>
                              <input type="text" id="myInput13" onkeyup="myFunction13()" ></th>
                       
                        <th>Fonction
                        <br>
                              <input type="text" id="myInput14" onkeyup="myFunction14()" ></th>
                        <th>Position
                        <br>
                              <input type="text" id="myInput15" onkeyup="myFunction15()" ></th> 
                        <th>Status
                        <br>
                              <input type="text" id="myInput16" onkeyup="myFunction16()" ></th>
                        
                        <th>Seniorite
                        <br>
                              <input type="text" id="myInput17" onkeyup="myFunction17()" ></th>
                        
                        <th>Leader
                        <br>
                              <input type="text" id="myInput18" onkeyup="myFunction18()" ></th>
                        
                        <th> Manager hierarchique
                        <br>
                              <input type="text" id="myInput19" onkeyup="myFunction19()" ></th>
                        <th> Manager fonctionnel
                        <br>
                              <input type="text" id="myInput20" onkeyup="myFunction20()" ></th>
                        <th> Date creation
                        <br>
                              <input type="text" id="myInput21" onkeyup="myFunction21()" ></th>
                        <th> Date Dernier modification
                        <br>
                              <input type="text" id="myInput22" onkeyup="myFunction22()" ></th>

                        <th>T1 Er
                        <br>
                              <input type="text" id="myInput23" onkeyup="myFunction23()" ></th>
                        
                        <th>T1 Polyv
                        <br>
                              <input type="text" id="myInput24" onkeyup="myFunction24()" ></th>

                        <th>T1 Mec
                        <br>
                              <input type="text" id="myInput25" onkeyup="myFunction25()" ></th>
                        
                        <th>T1 Vend
                        <br>
                              <input type="text" id="myInput26" onkeyup="myFunction26()" ></th>
                         <th>Active
                        <br>
                              <input type="text" id="myInput27" onkeyup="myFunction27()" ></th>
                       
                        <th>Modifier</th>
                        <th>Supprimer</th>
                        
                        </tr>
                           </thead>
                           <tbody>
                               <% 
                               Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                   PreparedStatement ps= conn.prepareStatement("select *  from profile ORDER BY profile_id");
		ResultSet rs= ps.executeQuery();
		while(rs.next()){
                               %>
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
                               String position=Helper.getValue("info", "position","position_id" ,rs.getString("position_id"));
                              
                               
                               
                               
                               %>
                           <tr>
                               <td><%=civilite%></td>
                               <td><%=rs.getString("nom_complet")%></td> 
                               <td>
                               <%
                                   String date=rs.getString("date_naissance");
                                   if(date==null)
                                           {
                                            date = " ";
                                           %><%=date%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_naissance")%><%
                                   }
                                   %>
                                   </td>
                                   <td><%=rs.getString("email")%></td>
                                
                                <td><%=anapec%></td>
                                 <td>
                               <%
                                   String date1=rs.getString("date_debut");
                                   if(date1==null)
                                           {
                                            date1 = " ";
                                           %><%=date1%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_debut")%><%
                                   }
                                   %>
                                   </td>
                               <td>
                              <%
                                   String date2=rs.getString("date_embauche");
                                   if(date2==null)
                                           {
                                            date2 = " ";
                                           %><%=date2%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_embauche")%><%
                                   }
                                   %>
                               
                               </td>
                               <td>
                                   
                                   
                                   
                                   <%
                                   String date3=rs.getString("date_fin");
                                   if(date3==null)
                                           {
                                            date3 = " ";
                                           %><%=date3%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_fin")%><%
                                   }
                                   %>
                               
                               
                               
                               </td> 
                               
                               <td><%=sortie%></td> 
                                 <td>
                               <%
                                   String date4=rs.getString("experience");
                                   if(date4==null)
                                           {
                                            date4 = " ";
                                           %><%=date4%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("experience")%><%
                                   }
                                   %>
                                   </td>  
                               <td><%=pole%></td> 
                               <td><%=rs.getString("id_metier")%></td>
                               <td><%=metier%></td>
                               <td><%=fonction%></td>  
                             <td><%=position%></td>  
                               <td><%=status%></td> 
                               <td><%=seniorite%></td> 
                               <td><%=rs.getString("leader")%></td> 
                               <td><%=rs.getString("hierarchical_manager")%></td>  
                               <td><%=rs.getString("functional_manager")%></td>
                                <td>
                                   <%
                                   String date5=rs.getString("date_creation");
                                   if(date5==null)
                                           {
                                            date5 = " ";
                                           %><%=date5%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("date_creation")%><%
                                   }
                                   %>

                               </td> 
                               
                               <td>
                                   <%
                                   String date6=rs.getString("derniere_modification");
                                   if(date6==null)
                                           {
                                            date6 = " ";
                                           %><%=date6%> <%
                                           }
                                   else
                                   {
                                       %>
                                       <%=rs.getString("derniere_modification")%><%
                                   }
                                   %>

                               </td> 
                                   
                                   
                               
                               
                               <td><%=er%></td> 
                               <td><%=polyv%></td> 
                               <td><%=mec%></td> 
                               <td><%=vend%></td>
                               <td><%=active%></td>
                             <%int i=rs.getInt("profile_id");  %>
                              <td><a href="UpdateProfile.jsp?id=<%=rs.getString("profile_id")   %>"><img src="<c:url value='/include/edit2.png'/>" style=" height: 30px;width: 30px;"></a></td>
                               <td><a href="Delete_Profile?id=<%=rs.getString("profile_id")%>" ><img src="<c:url value='/include/edit3.png'/>" style=" height: 30px;width: 30px;"></a></td>
                           </tr>
         
                          <script>
function myFunction1() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
  table = document.getElementById("profile");
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
<script>
function myFunction10() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput10");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[9];
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
function myFunction11() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput11");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[10];
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
function myFunction12() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput12");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[11];
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
function myFunction13() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput13");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[12];
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
function myFunction14() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput14");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[13];
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
function myFunction15() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput15");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[14];
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
function myFunction16() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput16");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[15];
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
function myFunction17() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput17");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[16];
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
function myFunction18() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput18");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[17];
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
function myFunction19() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput19");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[18];
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
function myFunction20() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput20");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[19];
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
function myFunction21() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput21");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[20];
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
function myFunction22() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput22");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[21];
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
function myFunction23() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput23");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[22];
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
function myFunction24() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput24");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[23];
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
function myFunction25() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput25");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[24];
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
function myFunction26() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput26");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[25];
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
function myFunction27() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput27");
  filter = input.value.toUpperCase();
  table = document.getElementById("profile");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[26];
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
                             <form action="Importer_Profile" method="post" enctype="multipart/form-data">
                               <input type="file" name="file"/>
                               <input type="submit" value="importer">
                               <div style="color: red;text-transform: uppercase;font-size:  150%">${erreur}</div>
                           </form>
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
        $('#profile').dataTable({
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
<script>

      </script> 
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
