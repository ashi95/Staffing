

 

<aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
    
              	  
                  <p class="centered"><a href="ProfileA.jsp"><img src="<%=request.getContextPath()%>/include/user.png" class="img-circle" width="60"></a></p>
              	
                  <h5 class="centered"><%=session.getAttribute("nom")%></h5>
              	  	
                  <li class="mt">
                      <a href="ProfileA.jsp">
                          <i class="fa fa-child"></i>
                          <span style="font-size:17px">&nbsp; Ressource</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="OpportuniteA.jsp" >
                          <i class="fa fa-cogs"></i>
                          <span style="font-size:17px">  Opportunite</span>
                      </a>
                      
                  </li>
                  <li class="sub-menu">
                      <a href="ServiceA.jsp" >
                          <i class="fa fa-bitcoin"></i>
                          <span style="font-size:17px"> &nbsp; Centre Service</span>
                      </a>
                      
                  </li>

                  <li class="sub-menu">
                      <a href="ProjetA.jsp" >
                          <i class="fa fa-car"></i>
                          <span style="font-size:17px">  Projet</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="calendar.html">Calendar</a></li>
                          <li><a  href="gallery.html">Gallery</a></li>
                          <li><a  href="todo_list.html">Todo List</a></li>
                      </ul>
                  </li>
                <li class="sub-menu">
                      <a href="ClientA.jsp" >
                          <i class=" fa fa-money"></i>
                          <span style="font-size:17px"> &nbsp;Client</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="morris.html">Morris</a></li>
                          <li><a  href="chartjs.html">Chartjs</a></li>
                      </ul>
                  </li>
                  <li class="mt">
                      <a href="AssociationA.jsp">
                          <i class="fa fa-users"></i>
                          <span style="font-size:17px">  Association</span>
                      </a>
                  </li>
                 
                  <li class="sub-menu">
                      <a href="Statistique.jsp" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span style="font-size:17px">Statistique</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="morris.html">Morris</a></li>
                          <li><a  href="chartjs.html">Chartjs</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="UtilisateurA.jsp" >
                          <i class=" fa fa-plus"></i>
                          <span style="font-size:17px">  &nbsp;Utilisateurs</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="morris.html">Morris</a></li>
                          <li><a  href="chartjs.html">Chartjs</a></li>
                      </ul>
                  </li>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
                  