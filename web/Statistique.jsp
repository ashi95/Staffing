<%-- 
    Document   : index
    Created on : 5 avr. 2018, 12:30:53
    Author     : LENOVO T440S
--%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/include/css.jsp"%>       
        <link rel="stylesheet" type="text/css" href="/include/chart.css">
    </head>
    <body>
        <section id="container" >
            <%@include file="/include/header.jsp" %>
       <%@include file="/include/sidebar.jsp" %>
<section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i>Statistique</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		
          		</div>
          	</div>
                <canvas id="bar-chart1" width="1000" height="250"></canvas>                           
                <canvas id="bar-chart2"  width="1000" height="250"></canvas> 
                <canvas id="bar-chart3"  width="1000" height="250"></canvas>
                <canvas id="bar-chart4"  width="1000" height="250"></canvas>
                
                <table width="40%"> 
                   <tr> <th > <canvas id="pie-chart1"  width="700" height="250" ></canvas><th>
                   <th  ><canvas id="pie-chart2"  width="700" height="250"></canvas><th></tr>
                   <tr><th><canvas id="pie-chart3"  width="700" height="250"></canvas><th>
                   <th><canvas id="pie-chart4"  width="700" height="250"></canvas><th></tr>                  
                   <tr><th><canvas id="pie-chart5"  width="700" height="250"></canvas><th>
                   <th><canvas id="pie-chart6"  width="700" height="250"></canvas><th></tr>
                </table>

                
  <script type="text/javascript" src="Chart.js"></script>
  <%
      int count;
      String info;
   Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                List<String>name7=new ArrayList<String>();
                List<String>list7=new ArrayList<String>();
                List<String>value7=new ArrayList<String>();
                String selectsql="SELECT seniorite_id from profile ";
                 PreparedStatement statement =  c.prepareStatement(selectsql);
                ResultSet rs = statement.executeQuery();
                while (rs.next())
                   
                {
                    String result=rs.getString("seniorite_id");
                    if(!list7.contains(result))
                    {
                        list7.add(result);
                    }
                }
                for (int i=0;i < list7.size();i++)
                {
                count= Helper.getCount("seniorite_id","profile","seniorite_id",list7.get(i));
               value7.add(Integer.toString(count));
               info=Helper.getValue("info", "seniorite", "seniorite_id", list7.get(i));
               name7.add(info);
                }
              
JSONArray jsonName7 = new JSONArray(name7);
JSONArray jsonValue7 = new JSONArray(value7);
               selectsql="SELECT civilite_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name1=new ArrayList<String>();
                List<String>list1=new ArrayList<String>();
                List<String>value1=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("civilite_id");
                    if(!list1.contains(result))
                    {
                        
                        
                        list1.add(result);
                    }
                   
                }
                 
                 for (int i=0;i < list1.size();i++)
                {
                    
                count= Helper.getCount("civilite_id","profile","civilite_id",list1.get(i));
               value1.add(Integer.toString(count));
               info=Helper.getValue("info", "civilite", "civilite_id", list1.get(i));
               name1.add(info);
                }
                 JSONArray jsonName1 = new JSONArray(name1);
JSONArray jsonValue1 = new JSONArray(value1);
                selectsql="SELECT status_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name2=new ArrayList<String>();
                List<String>list2=new ArrayList<String>();
                List<String>value2=new ArrayList<String>();
                 while (rs.next())  
                 {
                     String result=rs.getString("status_id");
                    if(!list2.contains(result))
                    {
                        list2.add(result);
                    }
                }
                  for (int i=0;i < list2.size();i++)
                {
                count= Helper.getCount("status_id","profile","status_id",list2.get(i));
               value2.add(Integer.toString(count));
               info=Helper.getValue("info", "status", "status_id", list2.get(i));
               name2.add(info);
                }
                   JSONArray jsonName2 = new JSONArray(name2);
JSONArray jsonValue2 = new JSONArray(value2);
                 selectsql="SELECT pole_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name3=new ArrayList<String>();
                List<String>list3=new ArrayList<String>();
                List<String>value3=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("pole_id");
                    if(!list3.contains(result))
                    {
                        list3.add(result);
                    }
                }
                  for (int i=0;i < list3.size();i++)
                {
                count= Helper.getCount("pole_id","profile","pole_id",list3.get(i));
               value3.add(Integer.toString(count));
               info=Helper.getValue("info", "pole", "pole_id", list3.get(i));
               name3.add(info);
                }
                  JSONArray jsonName3 = new JSONArray(name3);
JSONArray jsonValue3 = new JSONArray(value3);
 selectsql="SELECT fonction_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name4=new ArrayList<String>();
                List<String>list4=new ArrayList<String>();
                List<String>value4=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("fonction_id");
                    if(!list4.contains(result))
                    {
                        list4.add(result);
                    }
                }
                  for (int i=0;i < list4.size();i++)
                {
                count= Helper.getCount("fonction_id","profile","fonction_id",list4.get(i));
               value4.add(Integer.toString(count));
               info=Helper.getValue("info", "fonction", "fonction_id", list4.get(i));
               name4.add(info);
                }
                  JSONArray jsonName4 = new JSONArray(name4);
JSONArray jsonValue4 = new JSONArray(value4);
selectsql="SELECT client_id from projet ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name5=new ArrayList<String>();
                List<String>list5=new ArrayList<String>();
                List<String>value5=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("client_id");
                    if(!list5.contains(result))
                    {
                        list5.add(result);
                    }
                }
                  for (int i=0;i < list5.size();i++)
                {
                count= Helper.getCount("client_id","projet","client_id",list5.get(i));
               value5.add(Integer.toString(count));
               info=Helper.getValue("client", "client", "client_id", list5.get(i));
               name5.add(info);
                }
                  JSONArray jsonName5 = new JSONArray(name5);
JSONArray jsonValue5 = new JSONArray(value5);
 selectsql="SELECT position_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name6=new ArrayList<String>();
                List<String>list6=new ArrayList<String>();
                List<String>value6=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("position_id");
                    if(!list6.contains(result))
                    {
                        list6.add(result);
                    }
                }
                  for (int i=0;i < list6.size();i++)
                {
                count= Helper.getCount("position_id","profile","position_id",list6.get(i));
               value6.add(Integer.toString(count));
               info=Helper.getValue("info", "position", "position_id", list6.get(i));
               name6.add(info);
                }
                  JSONArray jsonName6 = new JSONArray(name6);
JSONArray jsonValue6 = new JSONArray(value6);
selectsql="SELECT vend_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name8=new ArrayList<String>();
                List<String>list8=new ArrayList<String>();
                List<String>value8=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("vend_id");
                    if(!list8.contains(result) )
                    {
                        list8.add(result);
                    }
}
                    for (int i=0;i < list8.size();i++)
                {
                count= Helper.getCount("vend_id","profile","vend_id",list8.get(i));
               value8.add(Integer.toString(count));
               info=Helper.getValue("info", "t1_vend", "vend_id", list8.get(i));
               name8.add(info);
                }
JSONArray jsonName8 = new JSONArray(name8);
JSONArray jsonValue8 = new JSONArray(value8);                
selectsql="SELECT position_id from profile ";
                statement =  c.prepareStatement(selectsql);
                rs = statement.executeQuery();
                List<String>name9=new ArrayList<String>();
                List<String>list9=new ArrayList<String>();
                List<String>value9=new ArrayList<String>();
                 while (rs.next())  
{
                    String result=rs.getString("position_id");
                    if(!list9.contains(result)  )
                    {
                        list9.add(result);
                    }
}
                    for (int i=0;i < list9.size();i++)
                {
                count= Helper.getCount("position_id","profile","position_id",list9.get(i));
               value9.add(Integer.toString(count));
               
                }
                   value9.remove(0);
                   
                   value9.remove(4);
                 
                 

JSONArray jsonValue9 = new JSONArray(value9);
  %>
  
                <script>
                     var name4=<%=jsonName4%>;
               var value4=<%=jsonValue4%>;
                   new Chart(document.getElementById("bar-chart1"), {
    type: 'bar',
    data: {
      labels: name4,
      datasets: [
        {
          label: "nombre",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#0000ff","#c45850","#ff0000","#00ffff","#00ff00","#ffff00","#ff00ff"],
          data: value4
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Repartition effectif par fonction'
      },
   scales: {
      yAxes: [{
         ticks: {
            beginAtZero: true,
             autoSkip:false
         }
      }],
   xAxes: [{
         ticks: {
            
             autoSkip:false
         }
      }]
   }
   
}
});
                </script>
                  
        <script>
                 var name1=<%=jsonName1%>;
               var value1=<%=jsonValue1%>;
                           
                  new Chart(document.getElementById("pie-chart1"), {
    type: 'pie',
    data: {
      labels: name1,
      datasets: [{
        label: "genre au sein d'altran",
        backgroundColor: ["#00ffff","#00ff00","#ffff00","#3e95cd", "#8e5ea2","#3cba9f","#0000ff","#c45850","#ff0000","#ff00ff"],
       
        data: value1
      }]
    },
    options: {
      title: {
        display: true,
        text: 'genre au sein altran'
      }
    }
});


                </script>
     
        
        
                         <script>
                 var name3=<%=jsonName3%>;
               var value3=<%=jsonValue3%>;
                           
                  new Chart(document.getElementById("pie-chart2"), {
    type: 'pie',
    data: {
      labels: name3,
      datasets: [{
        label: "genre au sein d'altran",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#0000ff","#c45850","#ff0000","#00ffff","#00ff00","#ffff00","#ff00ff"],
       
        data: value3
      }]
    },
    options: {
      title: {
        display: true,
        text: 'pole au sein altran'
      }
    }
});


                </script>
                 <script>
                
                            var name2=<%=jsonName2%>;
               var value2=<%=jsonValue2%>;
                  new Chart(document.getElementById("pie-chart3"), {
      
    type: 'pie',
    data: {
      labels: name2,
      datasets: [{
        label: "genre au sein d'altran",
        backgroundColor: ["#3cba9f","#0000ff","#c45850","#ff0000","#3e95cd", "#8e5ea2","#00ffff","#00ff00","#ffff00","#ff00ff"],
       
        data: value2
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Status au sein altran'
      }
    }
});


                </script>
                  <script>
                       var name3=<%=jsonName3%>;
               var value3=<%=jsonValue3%>;
                   new Chart(document.getElementById("bar-chart2"), {
    type: 'bar',
    data: {
      labels: name3,
      datasets: [
        {
          label: "nombre",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#0000ff","#c45850","#ff0000","#00ffff","#00ff00","#ffff00","#ff00ff"],
          data: value3
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Repartition effectif par pole'
      },
   scales: {
      yAxes: [{
         ticks: {
            beginAtZero: true,
             autoSkip:false
         }
      }],
   xAxes: [{
         ticks: {
            
             autoSkip:false
         }
      }]
   }
   
}
});
                </script>
                 <script>
                       var name5=<%=jsonName5%>;
               var value5=<%=jsonValue5%>;
                   new Chart(document.getElementById("bar-chart3"), {
    type: 'bar',
    data: {
      labels: name5,
      datasets: [
        {
          label: "nombre",
          backgroundColor: ["#3e95cd", "#3cba9f","#0000ff","#c45850","#ff0000","#00ffff","#00ff00","#ffff00","#ff00ff"],
          data: value5
        }
      ]
    },
  options: {
      title: {
        display: true,
        text: 'Repartition effectif par client'
      },
   scales: {
      yAxes: [{
         ticks: {
            beginAtZero: true,
             autoSkip:false
         }
      }] ,
   xAxes: [{
         ticks: {
            
             autoSkip:false
         }
      }]
   }
   
}
});
                </script>
                <script>
                      var name6=<%=jsonName6%>;
               var value6=<%=jsonValue6%>;
                   new Chart(document.getElementById("bar-chart4"), {
    type: 'bar',
    data: {
      labels: name6,
      datasets: [
        {
          label: "nombre",
          backgroundColor: ["#0000ff","#c45850","#ff0000","#00ffff","#3e95cd", "#8e5ea2","#3cba9f","#00ff00","#ffff00","#ff00ff"],
          data: value6
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Repartition effectif par position'
      },
   scales: {
    xAxes: [{
        stacked: false,
        beginAtZero: true,
        scaleLabel: {
            labelString: 'Month'
        },
        ticks: {
            stepSize: 1,
            min: 0,
            autoSkip: false
        }
    }]
}
   
}
});
      </script>     
      <script>
                
                            var name7=<%=jsonName7%>;
               var value7=<%=jsonValue7%>;
                  new Chart(document.getElementById("pie-chart4"), {
      
    type: 'pie',
    data: {
      labels: name7,
      datasets: [{
        label: "seniorite au sein d'altran",
        backgroundColor: ["#c45850","#ff0000","#00ffff","#00ff00","#ffff00","#ff00ff","#3e95cd", "#8e5ea2","#3cba9f","#0000ff",],
       
        data: value7
      }]
    },
    options: {
      title: {
        display: true,
        text: 'seniorite au sein altran'
      }
    }
});


                </script>
                 <script>
                
                            var name8=<%=jsonName8%>;
               var value8=<%=jsonValue8%>;
                  new Chart(document.getElementById("pie-chart5"), {
      
    type: 'pie',
    data: {
      labels: name8,
      datasets: [{
        label: "seniorite au sein d'altran",
        backgroundColor: ["#c45850","#ff0000","#00ffff","#00ff00","#ffff00","#ff00ff","#3e95cd", "#8e5ea2","#3cba9f","#0000ff",],
       
        data: value8
      }]
    },
    options: {
      title: {
        display: true,
        text: 'UO vend au sein altran'
      }
    }
});


                </script>
                 <script>
                
                            
               var value9=<%=jsonValue9%>;
               var technicien=parseInt(value9[0])+parseInt(value9[3]);
               var ingenieur=parseInt(value9[1])+parseInt(value9[2]);
                  new Chart(document.getElementById("pie-chart6"), {
      
    type: 'pie',
    data: {
      labels: ["Technicien","Ingenieur"],
      datasets: [{
        label: "seniorite au sein d'altran",
        backgroundColor: ["#ffff00","#ff00ff","#00ffff","#00ff00","#00ffff","#00ff00","#3e95cd", "#8e5ea2","#3cba9f","#0000ff"],
       
        data: [technicien,ingenieur]
      }]
    },
    options: {
      title: {
        display: true,
        text: "Tech/Eng au sein  d'altran"
      }
    }
});


                </script>
          </section>
       <%@include file="/include/footer.jsp" %>
        </section>
    </body>
</html>
