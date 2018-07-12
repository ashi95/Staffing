package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import servlet.Utilisateur;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class UtilisateurA_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(5);
    _jspx_dependants.add("/include/css.jsp");
    _jspx_dependants.add("/include/input.css");
    _jspx_dependants.add("/include/header.jsp");
    _jspx_dependants.add("/include/sidebar.jsp");
    _jspx_dependants.add("/include/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_url_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_url_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_url_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 

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
               rs.close();
               statement.close();
               conn.close();
           }
       }
       if(nom==null){
           response.sendRedirect("login.jsp");
       }
   }
 



      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        ");
      out.write(" <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"");
      out.print(request.getContextPath());
      out.write("/template/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("    <!--external css-->\n");
      out.write("    <link href=\"");
      out.print(request.getContextPath());
      out.write("/template/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\n");
      out.write("        \n");
      out.write("    <!-- Custom styles for this template -->\n");
      out.write("    <link href=\"");
      out.print(request.getContextPath());
      out.write("/template/css/style.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"");
      out.print(request.getContextPath());
      out.write("/template/css/style-responsive.css\" rel=\"stylesheet\">");
      out.write(" \n");
      out.write("       <style>");
      out.write("input[type=submit] {\n");
      out.write("    background-color: #4CAF50;\n");
      out.write("    color: white;\n");
      out.write("    display: flex; justify-content: center;\n");
      out.write("    border: none;\n");
      out.write("    border-radius: 4px;\n");
      out.write("    cursor: pointer; \n");
      out.write("    display:block;  \n");
      out.write("    vertical-align: middle;\n");
      out.write("    text-align: center;\n");
      out.write("    margin-left: 750px;\n");
      out.write("    width: 150px;\n");
      out.write("    height: 35px;\n");
      out.write("}\n");
      out.write("html{\n");
      out.write("    zoom: 0.9; \n");
      out.write("}\n");
      out.write("section{\n");
      out.write("    background-color: white;\n");
      out.write("}\n");
      out.write("table{\n");
      out.write("    width: 80%;\n");
      out.write("     height: 80%;\n");
      out.write("    background-color: white;\n");
      out.write("}\n");
      out.write("input {\n");
      out.write("    \n");
      out.write("    width:150px;\n");
      out.write("    margin-left: 0px;\n");
      out.write("    margin-right: 0px;\n");
      out.write("    margin-top: 0px;\n");
      out.write("    margin-bottom: 0px;\n");
      out.write("        height: 25px;\n");
      out.write("    \n");
      out.write("}\n");
      out.write("label,select{\n");
      out.write("   \n");
      out.write("    font-size:15px;\n");
      out.write("    font-family: Arial,helvetica,sans-serif;\n");
      out.write("    \n");
      out.write("  margin-left: 0px;\n");
      out.write("  margin-right: 0px;\n");
      out.write("  margin-bottom: 0px;\n");
      out.write("  margin-top: 0px;\n");
      out.write("  color:black;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("td ,th{ \n");
      out.write("    text-align: center;\n");
      out.write(" border-width:1px;\n");
      out.write(" border-style:dotted; \n");
      out.write(" border-color:#d1e0e0;\n");
      out.write(" width:30%;\n");
      out.write(" \n");
      out.write(" }\n");
      out.write(" select\n");
      out.write(" {\n");
      out.write("     width: 150px;\n");
      out.write("     height: 25px;\n");
      out.write("     margin-right: 0px;\n");
      out.write("     float: left;\n");
      out.write(" }\n");
      out.write(" \n");
      out.write("\n");
      out.write(" #formulaire input[type=submit]{\n");
      out.write("     margin-bottom: 6800px;\n");
      out.write("   margin-right:400px;\n");
      out.write("   display:block;\n");
      out.write("   \n");
      out.write("   \n");
      out.write(" }\n");
      out.write(" #formulaire td,th{\n");
      out.write("    margin-left: -20px;\n");
      out.write("     \n");
      out.write("    text-align: left;\n");
      out.write("    width: auto;\n");
      out.write("    height: auto;\n");
      out.write(" border-spacing: 0px; \n");
      out.write(" padding: 0;\n");
      out.write("  border-style: none;\n");
      out.write(" }\n");
      out.write(" #formulaire input[type=date],input[type=text],input[type=number],select,label{\n");
      out.write("     float:left;\n");
      out.write("     \n");
      out.write("     margin-bottom : 30px;\n");
      out.write(" }\n");
      out.write(" #formulaire table{\n");
      out.write("     width: auto;\n");
      out.write("     height: auto;\n");
      out.write("     margin-top: -90px;\n");
      out.write("     margin-left:5%;\n");
      out.write("     border-collapse: separate;\n");
      out.write("     \n");
      out.write("    border-spacing: 10px;\n");
      out.write("    border-left:10px;\n");
      out.write("   \n");
      out.write("    \n");
      out.write(" }\n");
      out.write(" #formulaire input[type=text],input[type=date],input[type=number],select{\n");
      out.write("     width: 150px;\n");
      out.write("     height: 30px;\n");
      out.write(" }\n");
      out.write("     \n");
      out.write(" \n");
      out.write(" #formulaire td.last {\n");
      out.write("    padding: 0;\n");
      out.write("    margin: 0;\n");
      out.write("    border: 0;\n");
      out.write("  \n");
      out.write("    }\n");
      out.write("    #select{\n");
      out.write("          width: 150px;\n");
      out.write("     height: 30px;\n");
      out.write("    }\n");
      out.write("    #formulaire label{\n");
      out.write("        display: inline;\n");
      out.write("       margin-left: 130px;\n");
      out.write("    }\n");
      out.write("    .submit{\n");
      out.write("        margin:auto;\n");
      out.write("  display:block;\n");
      out.write("    }");
      out.write(" </</style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <section id=\"container\" >\n");
      out.write("            ");
      out.write("\n");
      out.write("<header class=\"header black-bg\" style=\"background-color: #333745\" >\n");
      out.write("              <div class=\"sidebar-toggle-box\">\n");
      out.write("                  <div class=\"fa fa-bars tooltips\" data-placement=\"right\" data-original-title=\"Toggle Navigation\"></div>\n");
      out.write("              </div>\n");
      out.write("            <!--logo start-->\n");
      out.write("            <a href=\"ProjetA.jsp\" class=\"logo\"><b>DCHM Staffing tool V1</b></a>\n");
      out.write("            <!--logo end-->\n");
      out.write("            \n");
      out.write("            <div class=\"top-menu\">\n");
      out.write("            \t<ul class=\"nav pull-right top-menu\">\n");
      out.write("                    <li><a class=\"logout\" href=\"LogOut\" >Logout</a></li>\n");
      out.write("            \t</ul>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("       ");
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("\n");
      out.write("<aside>\n");
      out.write("          <div id=\"sidebar\"  class=\"nav-collapse \">\n");
      out.write("              <!-- sidebar menu start-->\n");
      out.write("              <ul class=\"sidebar-menu\" id=\"nav-accordion\">\n");
      out.write("    \n");
      out.write("              \t  \n");
      out.write("                  <p class=\"centered\"><a href=\"ProfileA.jsp\"><img src=\"");
      out.print(request.getContextPath());
      out.write("/include/user.png\" class=\"img-circle\" width=\"60\"></a></p>\n");
      out.write("              \t\n");
      out.write("                  <h5 class=\"centered\">");
      out.print(session.getAttribute("nom"));
      out.write("</h5>\n");
      out.write("              \t  \t\n");
      out.write("                  <li class=\"mt\">\n");
      out.write("                      <a href=\"ProfileA.jsp\">\n");
      out.write("                          <i class=\"fa fa-child\"></i>\n");
      out.write("                          <span style=\"font-size:17px\">&nbsp; Ressource</span>\n");
      out.write("                      </a>\n");
      out.write("                  </li>\n");
      out.write("\n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"OpportuniteA.jsp\" >\n");
      out.write("                          <i class=\"fa fa-cogs\"></i>\n");
      out.write("                          <span style=\"font-size:17px\">  Opportunite</span>\n");
      out.write("                      </a>\n");
      out.write("                      \n");
      out.write("                  </li>\n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"ServiceA.jsp\" >\n");
      out.write("                          <i class=\"fa fa-bitcoin\"></i>\n");
      out.write("                          <span style=\"font-size:17px\"> &nbsp; Centre Service</span>\n");
      out.write("                      </a>\n");
      out.write("                      \n");
      out.write("                  </li>\n");
      out.write("\n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"ProjetA.jsp\" >\n");
      out.write("                          <i class=\"fa fa-car\"></i>\n");
      out.write("                          <span style=\"font-size:17px\">  Projet</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                          <li><a  href=\"calendar.html\">Calendar</a></li>\n");
      out.write("                          <li><a  href=\"gallery.html\">Gallery</a></li>\n");
      out.write("                          <li><a  href=\"todo_list.html\">Todo List</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("                <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"ClientA.jsp\" >\n");
      out.write("                          <i class=\" fa fa-money\"></i>\n");
      out.write("                          <span style=\"font-size:17px\"> &nbsp;Client</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                          <li><a  href=\"morris.html\">Morris</a></li>\n");
      out.write("                          <li><a  href=\"chartjs.html\">Chartjs</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("                  <li class=\"mt\">\n");
      out.write("                      <a href=\"AssociationA.jsp\">\n");
      out.write("                          <i class=\"fa fa-users\"></i>\n");
      out.write("                          <span style=\"font-size:17px\">  Association</span>\n");
      out.write("                      </a>\n");
      out.write("                  </li>\n");
      out.write("                 \n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"Statistique.jsp\" >\n");
      out.write("                          <i class=\" fa fa-bar-chart-o\"></i>\n");
      out.write("                          <span style=\"font-size:17px\">Statistique</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                          <li><a  href=\"morris.html\">Morris</a></li>\n");
      out.write("                          <li><a  href=\"chartjs.html\">Chartjs</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("                  \n");
      out.write("                  <li class=\"sub-menu\">\n");
      out.write("                      <a href=\"UtilisateurA.jsp\" >\n");
      out.write("                          <i class=\" fa fa-plus\"></i>\n");
      out.write("                          <span style=\"font-size:17px\">  &nbsp;Utilisateurs</span>\n");
      out.write("                      </a>\n");
      out.write("                      <ul class=\"sub\">\n");
      out.write("                          <li><a  href=\"morris.html\">Morris</a></li>\n");
      out.write("                          <li><a  href=\"chartjs.html\">Chartjs</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                  </li>\n");
      out.write("\n");
      out.write("              </ul>\n");
      out.write("              <!-- sidebar menu end-->\n");
      out.write("          </div>\n");
      out.write("      </aside>\n");
      out.write("                  ");
      out.write("\n");
      out.write("<section id=\"main-content\">\n");
      out.write("          <section class=\"wrapper site-min-height\">\n");
      out.write("          \t<h3><i class=\"fa fa-angle-right\"></i> Tableau Utilisateur</h3>\n");
      out.write("          \t<div class=\"row mt\">\n");
      out.write("          \t\t<div class=\"col-lg-12\">\n");
      out.write("          \t\t<a href=\"InsertUtilisateur.jsp\"> <button  style=\"float:right; font-size: 120%;\">Ajouter</button></a>\n");
      out.write("          \t\t</div>\n");
      out.write("          \t</div>\n");
      out.write("                <br>\n");
      out.write("                <table id=\"utilisateur\" cellpadding=\"10\" style=\"width:100%\" >\n");
      out.write("                          <thead>\n");
      out.write("                        <tr>\n");
      out.write("                        \n");
      out.write("                        <th>Nom Complet\n");
      out.write("                            <br>\n");
      out.write("                            <input type=\"text\" id=\"myInput1\" onkeyup=\"myFunction1()\" >\n");
      out.write("                        </th>\n");
      out.write("                        <th>Nom Profile\n");
      out.write("                            <br>\n");
      out.write("                            <input type=\"text\" id=\"myInput2\" onkeyup=\"myFunction2()\" >\n");
      out.write("                        </th>\n");
      out.write("                        <th>Mot Passe\n");
      out.write("                            <br>\n");
      out.write("                            <input type=\"text\" id=\"myInput3\" onkeyup=\"myFunction3()\" >\n");
      out.write("                        </th>\n");
      out.write("                        <th>Role\n");
      out.write("                            <br>\n");
      out.write("                        <input type=\"text\" id=\"myInput4\" onkeyup=\"myFunction4()\" >\n");
      out.write("                        </th>\n");
      out.write("                        <th>Modifier</th>\n");
      out.write("                        <th>Supprimer</th>\n");
      out.write("                        \n");
      out.write("    \n");
      out.write("                        </tr>\n");
      out.write("                           </thead>\n");
      out.write("                           \n");
      out.write("                           <tbody>\n");
      out.write("                               ");
 
                               Connection conn=null;
           
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                   PreparedStatement ps= conn.prepareStatement("select *  from authentification ORDER BY id");
		ResultSet rs= ps.executeQuery();
		while(rs.next()){
                               
      out.write("\n");
      out.write("                           <tr>\n");
      out.write("                              \n");
      out.write("                              <td>");
      out.print(rs.getString("nom"));
      out.write("</td> \n");
      out.write("                               <td>");
      out.print(rs.getString("nom_utilisateur"));
      out.write("</td> \n");
      out.write("                               <td>");
      out.print(rs.getString("mot_passe"));
      out.write("</td> \n");
      out.write("                               <td>");
      out.print(rs.getString("role"));
      out.write("</td> \n");
      out.write("                               ");
int i=rs.getInt("id");  
      out.write("\n");
      out.write("                               <td><a href=\"UpdateUtilisateur.jsp?id=");
      out.print(rs.getString("id"));
      out.write("\" ><img src=\"");
      if (_jspx_meth_c_url_0(_jspx_page_context))
        return;
      out.write("\" style=\" height: 30px;width: 30px;\"></a></td>\n");
      out.write("                               <td><a href=\"Delete_Utilisateur?id=");
      out.print(rs.getString("id"));
      out.write("\" ><img src=\"");
      if (_jspx_meth_c_url_1(_jspx_page_context))
        return;
      out.write("\" style=\" height: 30px;width: 30px;\"></a></td>\n");
      out.write("                           </tr>\n");
      out.write("                             <script>\n");
      out.write("function myFunction1() {\n");
      out.write("  var input, filter, table, tr, td, i;\n");
      out.write("  input = document.getElementById(\"myInput1\");\n");
      out.write("  filter = input.value.toUpperCase();\n");
      out.write("  table = document.getElementById(\"utilisateur\");\n");
      out.write("  tr = table.getElementsByTagName(\"tr\");\n");
      out.write("  for (i = 0; i < tr.length; i++) {\n");
      out.write("    td = tr[i].getElementsByTagName(\"td\")[0];\n");
      out.write("    if (td) {\n");
      out.write("      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n");
      out.write("        tr[i].style.display = \"\";\n");
      out.write("      } else {\n");
      out.write("        tr[i].style.display = \"none\";\n");
      out.write("      }\n");
      out.write("    }       \n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>   \n");
      out.write("<script>\n");
      out.write("function myFunction2() {\n");
      out.write("  var input, filter, table, tr, td, i;\n");
      out.write("  input = document.getElementById(\"myInput2\");\n");
      out.write("  filter = input.value.toUpperCase();\n");
      out.write("  table = document.getElementById(\"utilisateur\");\n");
      out.write("  tr = table.getElementsByTagName(\"tr\");\n");
      out.write("  for (i = 0; i < tr.length; i++) {\n");
      out.write("    td = tr[i].getElementsByTagName(\"td\")[1];\n");
      out.write("    if (td) {\n");
      out.write("      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n");
      out.write("        tr[i].style.display = \"\";\n");
      out.write("      } else {\n");
      out.write("        tr[i].style.display = \"none\";\n");
      out.write("      }\n");
      out.write("    }       \n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>  \n");
      out.write("<script>\n");
      out.write("function myFunction3() {\n");
      out.write("  var input, filter, table, tr, td, i;\n");
      out.write("  input = document.getElementById(\"myInput3\");\n");
      out.write("  filter = input.value.toUpperCase();\n");
      out.write("  table = document.getElementById(\"utilisateur\");\n");
      out.write("  tr = table.getElementsByTagName(\"tr\");\n");
      out.write("  for (i = 0; i < tr.length; i++) {\n");
      out.write("    td = tr[i].getElementsByTagName(\"td\")[2];\n");
      out.write("    if (td) {\n");
      out.write("      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n");
      out.write("        tr[i].style.display = \"\";\n");
      out.write("      } else {\n");
      out.write("        tr[i].style.display = \"none\";\n");
      out.write("      }\n");
      out.write("    }       \n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>   \n");
      out.write("<script>\n");
      out.write("    function myFunction4() {\n");
      out.write("  var input, filter, table, tr, td, i;\n");
      out.write("  input = document.getElementById(\"myInput4\");\n");
      out.write("  filter = input.value.toUpperCase();\n");
      out.write("  table = document.getElementById(\"utilisateur\");\n");
      out.write("  tr = table.getElementsByTagName(\"tr\");\n");
      out.write("  for (i = 0; i < tr.length; i++) {\n");
      out.write("    td = tr[i].getElementsByTagName(\"td\")[3];\n");
      out.write("    if (td) {\n");
      out.write("      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {\n");
      out.write("        tr[i].style.display = \"\";\n");
      out.write("      } else {\n");
      out.write("        tr[i].style.display = \"none\";\n");
      out.write("      }\n");
      out.write("    }       \n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>   \n");
      out.write("</script>\n");
      out.write("                         \n");
      out.write("                              \n");
      out.write("                           \n");
      out.write("                           ");
 } 
      out.write("\n");
      out.write("                             </tbody>\n");
      out.write("                        </table>\n");
      out.write("\t\t</section><! --/wrapper -->\n");
      out.write("      </section><!-- /MAIN CONTENT -->\n");
      out.write(" <script \n");
      out.write("\n");
      out.write("src=\"https://code.jquery.com/jquery-1.12.4.js\"></script> // JQuery Reference\n");
      out.write("\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js\"></script>\n");
      out.write("<script \n");
      out.write("\n");
      out.write("src=\"https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js\"></script>\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" \n");
      out.write("\n");
      out.write("href=\"https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css\">\n");
      out.write("<link rel=\"stylesheet\" \n");
      out.write("\n");
      out.write("href=\"https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css\">\n");
      out.write("     \n");
      out.write("          <script type=\"text/javascript\">\n");
      out.write("   \n");
      out.write("\n");
      out.write("    $(document).ready(function () {\n");
      out.write("        $('#utilisateur').dataTable({\n");
      out.write("            \"order\": [],\n");
      out.write("            \"bSortCellsTop\": true,\n");
      out.write("           \"bFilter\": false,\n");
      out.write("           searching:true,\n");
      out.write("                \"bSortClasses\": false,\n");
      out.write("            \"scrollX\":true,\n");
      out.write("            dom: 'Bfrtip',\n");
      out.write("        buttons: [\n");
      out.write("            'copy', 'csv', 'excel', 'pdf', 'print'\n");
      out.write("        ]\n");
      out.write("       });\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("       \n");
      out.write("       ");
      out.write("<footer class=\"site-footer\">\n");
      out.write("          <div class=\"text-center\">\n");
      out.write("              Created By :El Khalkhoudi Reda\n");
      out.write("              <a href=\"#\" class=\"go-top\">\n");
      out.write("                  <i class=\"fa fa-angle-up\"></i>\n");
      out.write("              </a>\n");
      out.write("          </div>\n");
      out.write("      </footer>");
      out.write("\n");
      out.write("        </section>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_url_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_0.setPageContext(_jspx_page_context);
    _jspx_th_c_url_0.setParent(null);
    _jspx_th_c_url_0.setValue("/include/edit2.png");
    int _jspx_eval_c_url_0 = _jspx_th_c_url_0.doStartTag();
    if (_jspx_th_c_url_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
      return true;
    }
    _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
    return false;
  }

  private boolean _jspx_meth_c_url_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_1 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_1.setPageContext(_jspx_page_context);
    _jspx_th_c_url_1.setParent(null);
    _jspx_th_c_url_1.setValue("/include/edit3.png");
    int _jspx_eval_c_url_1 = _jspx_th_c_url_1.doStartTag();
    if (_jspx_th_c_url_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_1);
      return true;
    }
    _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_1);
    return false;
  }
}
