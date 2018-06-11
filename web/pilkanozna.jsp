<%-- 
    Document   : index
    Created on : 2018-03-24, 22:00:16
    Author     : Edyta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet'>
        
        <title>piłka nożna</title>
        <link rel="shortcut icon" href="https://i.imgur.com/7pcghN2.png"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       

        <style>
            /* Make the image fully responsive */
            .carousel-inner img {
                width: 100%;
                height: 100%;
            }
            
               .btn-2 {
               background-color: red;
               color: white; 
               font-weight: bold;
               font-size:20px;
               float: center; 
               text-align: center;
               height: 60px; 
               width: 150px;
            }
        </style>

    </head>

    <body style="background-color:#000647;">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp" style="color:#fff200; font-family: 'Audiowide'; font-size: 20px; "><img src="https://i.imgur.com/s7qhnfH.png" style="width:25px; height:25px"> LV.BET2</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    
                        <li class="nav-item">
                            <a class="nav-link" href="zakladyBuk.jsp">ZAKŁADY BUKMACHERSKIE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="zaklZyw.jsp">ZAŁADY NA ŻYWO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sportyWirt.jsp">SPORTY WIRTUALNE</a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="logowanie.jsp" style="color:#fff200">LOGOWANIE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="rejestracja.jsp" style="color:#fff200">REJESTRACJA</a>
                        </li>
                        <c:if test = "${pageContext.session.getAttribute(pageContext.request.getAttribute('userName')) eq 'Player'}">
                            <li class="nav-item">
                                <a class="nav-link" href="panelGracz.jsp" style="color:#fff200">Witaj "${pageContext.request.getAttribute("userName")}"</a>
                            </li>                       
                        </c:if>
                            <c:if test = "${pageContext.session.getAttribute(pageContext.request.getAttribute('userName')) eq 'Editor'}">
                            <li class="nav-item">
                                <a class="nav-link" href="panelEdytor.jsp" style="color:#fff200">Witaj "${pageContext.request.getAttribute("userName")}"</a>
                            </li>                       
                        </c:if>
                            <c:if test = "${pageContext.session.getAttribute(pageContext.request.getAttribute('userName')) eq 'Admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="panelAdmin.jsp" style="color:#fff200">Witaj "${pageContext.request.getAttribute("userName")}"</a>
                            </li>                       
                        </c:if>
                        
                        


                    </ul>
                </div>
            </div>
        </nav>


        <!-- Carousel ================================================== -->

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                
                 <div class="carousel-item active">
                    <img class="d-block img-fluid" src="https://i.imgur.com/tp3oTPN.jpg" alt="1">
                    <div class="carousel-caption"> 
                        <h3 style="font-family: 'Audiowide';"><img src="https://i.imgur.com/s7qhnfH.png" style="width:30px; height:30px"> PIŁKA NOŻNA</h3>

                        <a href="#" class="btn" style="background-color: #fff200; color:black; font-weight: bold; height: 40px; width: 150px; " >ZDARZENIA</a>
                    </div>
                </div>
                
                <div class="carousel-item">
                    <img class="d-block img-fluid" src="https://i.imgur.com/afPgOgd.png" alt="1">
                    <div class="carousel-caption"> 
                        <h3 style="font-family: 'Audiowide';">BONUS NA START</h3>
                        <p>Odbierz bonus przy pierwszej rejestracji!</p>
                        <a href="rejestracja.jsp" class="btn" style="background-color: #fff200; color:black; font-weight: bold; height: 40px; width: 150px; " >REJESTRACJA</a>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="d-block img-fluid" src="https://i.imgur.com/rmh6zfb.png" alt="2">
                    <div class="carousel-caption"> 
                        <h3 style="font-family: 'Audiowide';">KOSZYKARSKI BONUS</h3>
                        <p>Koszykarski bonus co tydzień!</p>
                        <a href="promocje.jsp" class="btn" style="background-color: #fff200; color:black; font-weight: bold; height: 40px; width: 150px; " >WIĘCEJ</a>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="d-block img-fluid" src="https://i.imgur.com/Z2b9l2e.png" alt="3">
                    <div class="carousel-caption"> 
                        <h3 style="font-family: 'Audiowide';">SPORTY WIRTUALNE</h3>
                        <p>Graj całą dobę!</p>
                        <a href="sportyWirt.jsp" class="btn" style="background-color: #fff200; color:black; font-weight: bold; height: 40px; width: 150px; " >WIĘCEJ</a>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="d-block img-fluid" src="https://i.imgur.com/ANjX7O1.png" alt="3">
                    <div class="carousel-caption"> 
                        <h3 style="font-family: 'Audiowide';">RANKING SPECJALNY</h3>
                        <p>Wygraj bilety na mecze reprezentacji!</p>
                        <a href="promocje.jsp" class="btn" style="background-color: #fff200; color:black; font-weight: bold; height: 40px; width: 150px; " >WIĘCEJ</a>
                    </div>
                </div>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
       

        <!-- Page Content -->
        <div class="w-90 p-5" >

            <div class="row">

                 <div class="col-lg-2">
                    <!--   <h1 class="my-4"  >SPORTY</h1> -->
                <div class="list-group">
                        <a href="#" class="list-group-item active" style="font-weight: bold; background-color: #fff200; color:#343a40; font-size: 20px; border-color:#fff200;">SPORTY</a>
                        <!-- 
                        <a href="pilkanozna.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">PIŁKA NOŻNA</a>
                       
                        <a href="pilkareczna.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">PIŁKA RĘCZNA</a>
                        <a href="koszykowka.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">KOSZYKÓWKA</a>
                        <a href="hokej.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">HOKEJ</a>
                        <a href="tennis.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">TENNIS</a>
                        <a href="baseball.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">BASEBALL</a>
                        -->
                        
                      <!--  <div class="sidenav"> -->
                 <!--   <button class="list-group-item"   style="background-color: #343a40; color:#fff200; border-color:#343a40; list-style-type: none;"></button> -->


    


                 <%
                     ArrayList list = new ArrayList();
                     ArrayList sublist = new ArrayList();
                     try {
                         Class.forName("org.postgresql.Driver");
                         Connection con = DriverManager.getConnection("jdbc:postgresql://sigma.pwsz.krosno.pl:5432/buk", "postgres", "26!D$196eF85");
                 %>

                 <%
                     String query1 = "select * from Dyscyplina";
                     Statement st1 = con.createStatement();
                     ResultSet rs1 = st1.executeQuery(query1);

                     while (rs1.next()) {


                 %>

                 <button class="list-group-item"   style="background-color: #343a40; color:#fff200; text-align: left; list-style-type: none;">
                     <li><%= rs1.getString("nazwa")%>
                         <span class="glyphicon glyphicon-chevron-down" aria-hidden="false"></span>
                 </button>

                 <ul class="list-group-item" style="background-color: #fff200; border: 0px; color:#343a40; border-color:#343a40; list-style-type: none; display: none;">
                     <%
                         String query2 = "select nazwa from Region";
                         Statement st2 = con.createStatement();
                         ResultSet rs2 = st2.executeQuery(query2);
                         while (rs2.next()) {
                     %>  


                     <li>
                         <a href="#" class="list-group-item" style="background-color: #fff200; color: #343a40; ">
                             <%= rs2.getString("nazwa")%>
                         </a>
                     </li>
                     <%
                         }
                     %>
                 </ul>
                </li>


                <%
                    }
                %>
</ul>

<%
    } catch (Exception e1) {
    }
%>
                        
                        

                    </div>
                      <br><br>
                     <div class="list-group">
                        <a href="#" class="list-group-item active" style="font-weight: bold; background-color: #fff200; color:#343a40; font-size: 20px; border-color:#fff200;">INFORMACJE</a>
                        <a href="pomoc.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">KONTAKT</a>
                        <a href="regulamin.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">REGULAMIN</a>
                        <a href="platnosci.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">PŁATNOŚCI</a>
                        <a href="promocje.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">PROMOCJE</a>
                        <a href="statystyki.jps" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">STATYSTYKI</a>
                        <a href="sprzaklad.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">SPRAWDŹ ZAKŁAD</a>
                        <a href="wyiki.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">WYNIKI</a>

                    </div>
                </div>
                
                
                <!-- /.col-lg-3 -->

                 <div class="col-lg-2">


                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                </div>
                
                  <div class="col-lg-2">


                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                </div>
                
                <div class="col-lg-2">


                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                </div>
                
                <div class="col-lg-2">


                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                    <div class="card mt-4" style="background-color: #fff200; color:#343a40; border-color:#fff200;">
                        <img class="card-img-top img-fluid" src="https://i.imgur.com/shQtpdB.jpg" alt="">
                        <div class="card-body">
                            <h3 class="card-title" style="font-weight: bold">POLSKA</h3>
                            <a href="#" style="color: red; font-weight: bold; " >ZDARZENIA: 1234</a>
                        </div>
                    </div>

                </div>
                <!-- /.col-lg-9 -->

            </div>

        </div>
        <!-- /.container -->




        <br><br>


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        
        
  <script type="text/javascript"> 
        var dropdown = document.getElementsByClassName("list-group-item");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
        
     </script>   
        
        
        


        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white" style="color:#fff200">Copyright &copy; <img src="https://i.imgur.com/s7qhnfH.png" style="width:20px; height:20px"> <text style="color:#fff200; font-family: 'Audiowide'; font-size: 15px; ">LV.BET2  2018</p>
            </div>
            <!-- /.container -->
        </footer>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>