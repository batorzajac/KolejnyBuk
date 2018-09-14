<%-- 
    Document   : index
    Created on : 2018-03-24, 22:00:16
    Author     : Edyta
--%>
<%@page import="bukkk.Wyds"%>
<%@page import="bukkk.Wyd"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet'>
        <title>regulamin</title>
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

 <body style="background-image: linear-gradient(to right, darkblue , darkcyan,darkblue);">

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
                            <a class="nav-link" href="pilkanozna.jsp">ZAKŁADY BUKMACHERSKIE</a>
                        </li>
                        
                            
            


                                <%  
                                    try {
                request.setCharacterEncoding("UTF-8");
                String userid = request.getParameter("username");
                String pwd = request.getParameter("password");
                Class.forName("org.postgresql.Driver");
                            Connection connection = DriverManager.getConnection("jdbc:postgresql://sigma.pwsz.krosno.pl:5432/buk", "postgres", "26!D$196eF85");

                PreparedStatement pst = connection.prepareStatement("SELECT login,uprawnienia_id,konto  FROM uzytkownik WHERE login=? AND haslo=?");
                pst.setString(1, userid);
                pst.setString(2, pwd);

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {

                    session = request.getSession(false);
                    session.setAttribute("user_name", rs.getString("login"));
                    session.setAttribute("konto",rs.getString("konto"));
                    session.setAttribute("user_role", rs.getString("uprawnienia_id"));
                    
                }
                                    
                                    
                                    
                                    String x;
                                int role=0;
                                    if(session.getAttribute("user_role")!=null)
                                    { x = session.getAttribute("user_role").toString();
                                     role = Integer.parseInt(x);}
                                    
                                    if (session.getAttribute("User") != null) {
                                %> 


                                <%}%>




                                <%
                                    if (role==1) {

                                %> 
                                <div class="dropdown">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="background-color:#343a40; border:0px; color:#FFF200;  text-decoration: none"><img src="https://i.imgur.com/vg5baWU.png" style="width:16px; height:16px">  ADMINISTRATOR:  
                                        <%=":  " + session.getAttribute("user_name") + " "%>
                                </button>
                                    <div class="dropdown-menu" style="background-color:#343a40; border:0px; color:#FFF200" >
                                        <a class="dropdown-item" href="adminWariant.jsp"  style="background-color:#343a40; border:0px; color:#FFF200; text-align: left"><img src="https://i.imgur.com/7NzFSkt.png" style="width:16px; height:16px"> Warianty </a>
                                        <a class="dropdown-item" href="adminWyd.jsp"  style="background-color:#343a40; border:0px; color:#FFF200; text-align: left"><img src="https://i.imgur.com/7NzFSkt.png" style="width:16px; height:16px"> Wydarzenia </a>
                                        

                                    </div>
                                </div>




                                <%}%>

                                <%
                                    
                                    
                                    if (role==2) {
                                %> 


                                     <div class="dropdown">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="background-color:#343a40; border:0px; color:#FFF200;  text-decoration: none"><img src="https://i.imgur.com/vg5baWU.png" style="width:16px; height:16px">  MODERATOR:  
                                        <%=":  " + session.getAttribute("user_name") + " "%>
                                </button>
                                    <div class="dropdown-menu" style="background-color:#343a40; border:0px; color:#FFF200" >
                                        <a class="dropdown-item" href="adminWyd.jsp"  style="background-color:#343a40; border:0px; color:#FFF200; text-align: left"><img src="https://i.imgur.com/7NzFSkt.png" style="width:16px; height:16px"> Wydarzenia </a>
                                      

                                    </div>
                                </div>




                                <%}%>
                                
                                
                                <%
                                    
                                    
                                    if (role==3) {
                                %> 


                                     <div class="dropdown">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="background-color:#343a40; border:0px; color:#FFF200;  text-decoration: none"><img src="https://i.imgur.com/vg5baWU.png" style="width:16px; height:16px">  GRACZ:  
                                        <%=":  " + session.getAttribute("user_name") + " "%>
                                </button>
                                    <div class="dropdown-menu" style="background-color:#343a40; border:0px; color:#FFF200" >
                                        <% 
                                            String kon=session.getAttribute("konto").toString();
                                            Double kont=Double.parseDouble(kon);
                                            String konReady=String.format("%.2f", kont);%>
                                        <a class="dropdown-item"   style="background-color:#343a40; border:0px; color:#FFF200; text-align: left">STAN KONTA: <%= konReady%> </a>
                                

                                    </div>
                                </div>




                                <%}%>
                                


                                <%
                                    if (role==0) {
                                %> 
                                <li class="nav-item">
                            <a class="nav-link" href="logowanie.jsp" style="color:#fff200"><img src="https://i.imgur.com/edtWQhU.png" style="width:16px; height:16px"> LOGOWANIE </a>
                             <li class="nav-item">
                            <a class="nav-link" href="rejestracja.jsp" style="color:#fff200"><img src="https://i.imgur.com/uGFdiH6.png" style="width:16px; height:16px"> REJESTRACJA</a>
                        </li>
                                </li>

                                <%}%>
                                <%

                                    Connection conn = null;
                                    Statement stat = null;
                                    ResultSet res = null;


                                %>
                                <%                         if (role!=0) {%>
                               
                                      <div class="dropdown">
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="background-color:#343a40; border:0px; color:#FFF200;  text-decoration: none"><img src="https://i.imgur.com/OEVzkTy.png" style="width:16px; height:16px">  KONTO 
                                  </button>
                                    <div class="dropdown-menu" style="background-color:#343a40; border:0px; color:#FFF200" >
                                            <% 
                                            String kon=session.getAttribute("konto").toString();
                                            Double kont=Double.parseDouble(kon);
                                            String konReady=String.format("%.2f", kont);%>
                                        <a class="dropdown-item"   style="background-color:#343a40; border:0px; color:#FFF200; text-align: left">STAN KONTA: <%= konReady%> </a>
										<a class="dropdown-item" href="historiaKupon.jsp"  style="background-color:#343a40; border:0px; color:#FFF200; text-align: left"> Historia zakładów</a>
					   <a class="dropdown-item" href="AdresAdmin.jsp"  style="background-color:#343a40; border:0px; color:#FFF200; text-align: left"> Zmień adres </a><hr style="border-color: white">
                                        <a class="dropdown-item" href="wyloguj.jsp" style="background-color:#343a40; border:0px; color:white; font-weight: bold; text-align: center">WYLOGUJ  <img src="https://i.imgur.com/wTK8PNF.png" style="width:16px; height:16px">  </a>

                                    </div>
                                </div>


                                <%}}


            catch(Exception e){       
                out.println("Something went wrong !! Please try again");       
            }%>


                    </ul>
                </div>
            </div>
        </nav>



       


        <!-- Page Content -->
          <div class="w-90 p-5" >

            <div class="row">

                 <div class="col-lg-2">
                    
                    <div class="list-group">
                        <a  class="list-group-item active" style="font-weight: bold; background-color: #fff200; color:#343a40; font-size: 20px; border-color:#fff200;"><img src="https://i.imgur.com/U3K1QeE.png" style="width:24px; height:24px; float: left"> SPORTY  </a>
                        
                        <%
                            Wyd wyd;
                            Wyds wydList = new Wyds();
                            ArrayList list = new ArrayList();
                            ArrayList sublist = new ArrayList();
                            try {
                                Class.forName("org.postgresql.Driver");
                                Connection con = DriverManager.getConnection("jdbc:postgresql://sigma.pwsz.krosno.pl:5432/buk", "postgres", "26!D$196eF85");
                        %>

                        <%
                            String query1 = "select distinct d.nazwa, d.id from Dyscyplina d join Rozgrywki rg on d.id=rg.dyscyplina_id join Wydarzenie w on rg.id=w.rozgrywki_id order by d.id";
                            Statement st1 = con.createStatement();
                            ResultSet rs1 = st1.executeQuery(query1);

                            while (rs1.next()) {


                        %>

                        <div class="list-group-item 1"   style="background-color: #343a40; color:#fff200; text-align: left;font-size: 15px; list-style-type: none;cursor:pointer ">
                            <li><%= rs1.getString("nazwa")%><img src="https://i.imgur.com/NsYmMBO.png" style="width:16px; height:16px; float: right">
                        </div>

                        <ul class="list-group-item" style="background-color: #343a40; border: 0px; color:#343a40; border-color:#343a40; list-style-type: none ; 
                            display: none; padding-top: 5px;padding-bottom: 5px;padding-right: 0; ">
                            <%

                                PreparedStatement pst = con.prepareStatement("select r.nazwa, count(*) from Region r join Rozgrywki rg on r.id=rg.region_id join Dyscyplina d on d.id=rg.dyscyplina_id join Wydarzenie w on rg.id=w.rozgrywki_id where d.nazwa=? group by r.nazwa order by count(*) desc;");
                                pst.setString(1, rs1.getString("nazwa"));
                                ResultSet rs2 = pst.executeQuery();
                                while (rs2.next()) {
                            %>  


                            <li>
                                <div  class="list-group-item 2" style="background-color: #fff200;text-align: left;font-size: 15px; color: #343a40; width: 100%;cursor:pointer">
                                    <%= (rs2.getString("nazwa") + " (" + rs2.getInt("count") + ")")%>
                                </div>
                                <ul class="list-group-item" style="background-color: #fff200; border: 0px; color:#343a40; border-color:#343a40; list-style-type: none; 
                                    display: none; padding-top: 5px;padding-bottom: 5px;padding-right: 0;">
                                    <%

                                        PreparedStatement pst2 = con.prepareStatement("select rg.nazwa,rg.id, count(*) from Rozgrywki rg join Region r on r.id=rg.region_id join Dyscyplina d on d.id=rg.dyscyplina_id join Wydarzenie w on rg.id=w.rozgrywki_id where d.nazwa=? and r.nazwa=? group by rg.nazwa,rg.id order by count(*) desc;");
                                        pst2.setString(1, rs1.getString("nazwa"));
                                        pst2.setString(2, rs2.getString("nazwa"));
                                        ResultSet rs3 = pst2.executeQuery();
                                        while (rs3.next()) {
                                    %>  


                                    <li>
                                        <form method="post" action="zakladWyszukaj.jsp" >
                                            <input type="hidden" name="idRozg" value="<%=rs3.getInt("id")%>">


                                            <button  type="submit" class="list-group-item" style="background-color: #343a40; color: #fff200;font-size: 13px;text-align: left; cursor:pointer ;width: 100%">
                                                <%= (rs3.getString("nazwa") + " (" + rs3.getInt("count") + ")")%>
                                            </button>
                                        </form>
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
                        <a  class="list-group-item active" style="font-weight: bold; background-color: #fff200; color:#343a40; font-size: 20px; border-color:#fff200;">INFORMACJE</a>
                        <a href="pomoc.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">KONTAKT</a>
                        <a href="regulamin.jsp" class="list-group-item" style="background-color: #343a40; color:#fff200; border-color:#343a40;">REGULAMIN</a>
                       
                    </div>
                </div>



                <!-- /.col-lg-3 -->

              <div class="col-lg-7">
                  <h3 style="font-family: 'Audiowide'; color:#fff200; font-weight:bold">ROZDZIAŁ 1</h3> <h4 style="color:#ffffff"> §1 Postanowienia wstępne</h4><br>
                  <p style="color:white">  Organizatorem zakładów wzajemnych-bukmacherskich przez sieć Internet na stronie lvbet2.pl jest firma LVBET2 Zakłady Bukmacherskie 
                      spółka z o.o. (dalej zwana “Spółką”) z siedzibą w Katowicach, przy ulicy Melchiora Wańkowicza 3, wpisana do Rejestru Przedsiębiorców Krajowego 
                      Rejestru Sądowego pod numerem 0000534588, przez Sąd Rejonowy Katowice - Wschód w Katowicach, Wydział VIII Gospodarczy - KRS, NIP: 9542751776, 
                      REGON: 360297047. Spółka posiada zezwolenie ministra właściwego do spraw finansów publicznych z dnia 13 maja 2016 roku o numerze PS4.6831.9.2016.EQK na urządzanie 
                      zakładów wzajemnych-bukmacherskich przez sieć Internet na stronie lvbet.pl.
                      
<p style="color:white"> Niniejszy Regulamin (dalej zwany “Regulaminem”) został sporządzony zgodnie z Ustawą z dnia 19 listopada 2009 roku o grach hazardowych,
    (zwana dalej “Ustawą”) i wszedł w życie w dniu jego zatwierdzenia przez ministra właściwego do spraw finansów publicznych. Wszystkie zakłady wzajemne-bukmacherskie organizowane 
    przez sieć Internet na stronie lvbet.pl są podporządkowane zasadom określonym w niniejszym Regulaminie.
Zakłady wzajemne-bukmacherskie przez sieć Internet organizowane przez Spółkę dostępne są wyłącznie na stronie internetowej lvbet.pl, która to strona może być wyświetlana 
w różnych wersjach graficznych jako np. m.lvbet.pl (strona lvbet.pl zoptymalizowana graficznie dla urządzeń mobilnych), highcontrast.lvbet.pl (strona lvbet.pl o wysokim 
kontraście dla Klientów niedowidzących), które działają jako jedna strona lvbet.pl i są obsługiwane na lvbet.pl przez serwery Spółki. W zależności od typu używanej przez 
klienta przeglądarki internetowej strona może być wyświetlana jako https://lvbet.pl, www.lvbet.pl, secure://lvbet.pl itp.</p>

<p style="color:white"> Zakłady wzajemne-bukmacherskie organizowane przez sieć Internet na stronie lvbet.pl przez Spółkę można zawierać wyłącznie na te zdarzenia, które są dostępne na tej stronie internetowej.</p>

<p style="color:white"> Zaakceptowanie niniejszego Regulaminu jest warunkiem niezbędnym dla otwarcia LVkonta.</p>

<p style="color:white"> Każdy z Klientów ma prawo i obowiązek zapoznać się z postanowieniami niniejszego Regulaminu i ma obowiązek ich przestrzegać. Nieznajomość lub niezrozumienie Regulaminu nie powoduje, że zakład staje się nieważny, a przy rozstrzyganiu ewentualnych sporów wynikających z zakładów nie można brać pod uwagę okoliczności, że Klient nie zna postanowień Regulaminu.<p>
<p style="color:white"> Przed zawarciem zakładu Klient może skonsultować się z uprawnionymi pracownikami Spółki odnośnie wyjaśnienia znaczenia poszczególnych zapisów Regulaminu pod adresem https://lvbet.pl/pomoc/. Wyjaśnienia otrzymane od pracowników mają jedynie charakter informacyjny. Dokonanie zawarcia zakładu oznacza, że Klient przyjął do wiadomości oraz zaakceptował zasady opisane w Regulaminie niezależnie od stopnia ich zrozumienia. Spółka nie ponosi odpowiedzialności za pomyłki Klienta wynikające z nieznajomości lub niezrozumienia postanowień Regulaminu.</p>
<p style="color:white"> Spółka zastrzega sobie prawo do odmowy zawarcia umowy z Klientem bez podania powodu.<p><br>
<p style="color:white; font-weight: bold"> Przyjęte na potrzeby niniejszego Regulaminu definicje pojęć:<p>
<p style="color:white"> Spółka - LV BET Zakłady Bukmacherskie spółka z o.o. z siedzibą w Katowicach, przy ulicy Melchiora Wańkowicza 3, wpisana do Rejestru Przedsiębiorców Krajowego Rejestru Sądowego pod numerem 0000534588, przez Sąd Rejonowy Katowice - Wschód w Katowicach, Wydział VIII Gospodarczy - KRS, NIP: 9542751776, REGON: 360297047</p> 
<p style="color:white"> Regulamin – zatwierdzony przez ministra właściwego do spraw finansów publicznych Regulamin zakładów wzajemnych – bukmacherskich organizowanych przez sieć Internet na stronie internetowej lvbet.pl przez “LV BET Zakłady Bukmacherskie” spółka z o.o. z siedzibą w Katowicach
<p style="color:white"> Zakład - zakład wzajemny-bukmacherski organizowany przez Spółkę i zawierany przez sieć Internet na stronie lvbet.pl</p>
<p style="color:white"> Zasady odpowiedzialnej gry – zasady określone szerzej w odrębnym Regulaminie, zatwierdzonym przez ministra właściwego do spraw finansów publicznych, obowiązujące Klientów i Spółkę na stronie internetowej lvbet.pl</p>
<p style="color:white"> Punkt stacjonarny – „naziemny” punkt przyjmowania przez Spółkę zakładów wzajemnych-bukmacherskich, działający na podstawie odrębnego zezwolenia ministra właściwego do spraw finansów publicznych </p>
<p style="color:white"> Konto – dowolny rachunek prowadzony na rzecz Klienta przez akceptowanych przez Spółkę dostawców usług płatniczych, o których mowa w art. 4 ust. 2 pkt 1-4, 6 i 9 Ustawy z dnia 19 sierpnia 2011 r. o usługach płatniczych. </p> 
 <br>
    <h3 style="font-family: 'Audiowide'; color:#fff200; font-weight:bold">ROZDZIAŁ 2</h3> <h4 style="color:#ffffff"> §2 Postanowienia ogólne</h4><br>
    <p style="color:white"> Niniejszy Regulamin stanowi podstawę do zawarcia zakładów wzajemnych-bukmacherskich przez sieć Internet na stronie lvbet.pl.</p>
<p style="color:white"> Udział w zakładach wzajemnych-bukmacherskich przez sieć Internet na stronie lvbet.pl mogą brać jedynie osoby fizyczne, które ukończyły 18 lat i skutecznie przeprowadziły proces rejestracji określony w § 5 niniejszego Regulaminu, które dokonują wpłat do Spółki lub wypłat od Spółki za pośrednictwem dostawców usług płatniczych, o których mowa w art. 4 ust. 2 pkt 1-4, 6 i 9 Ustawy z dnia 19 sierpnia 2011 r. o usługach płatniczych.</p>
<p style="color:white">Zakłady przyjmowane są tylko i wyłącznie na terenie Rzeczypospolitej Polskiej.</p>
<p style="color:white">Nie mogą zawierać zakładów osoby, wobec których na podstawie ustawy z dnia 6 czerwca 1997 roku Kodeks Karny orzeczono zakaz uczestnictwa w grach hazardowych i osoby wymienione w §5 ust 12 Regulaminu oraz osoby, które dokonały samozablokowania możliwości dokonywania zakładów wzajemnych-bukmacherskich przez sieć Internet na stronie lvbet.pl w okresie samozablokowania, zgodnie z zasadami odpowiedzialnej gry.</p>
<p style="color:white">Zakłady zawarte przez osoby nieuprawnione będą przez Spółkę unieważnione (stornowane).</p>
<p style="color:white">Zakłady zawarte z naruszeniem postanowień niniejszego Regulaminu mogą zostać przez Spółkę unieważnione (stornowane). </p>
<p style="color:white">Klient ma prawo w każdym momencie zamknąć LVkonto bez podania powodu.</p>
<p style="color:white">W przypadku naruszenia przez Klienta jakiegokolwiek postanowienia niniejszego Regulaminu, Spółka będzie miała prawo zamknąć LVkonto Klienta.</p>
<p style="color:white">Akceptacja niniejszego Regulaminu oznacza również, iż Klient wyraża zgodę na świadczenie usług drogą elektroniczną oraz wyraża zgodę na przetwarzanie swoich danych osobowych przez Spółkę i przechowywanie ich zgodnie z ustawą z dnia 29 sierpnia 1997r. o ochronie danych osobowych, jak i zgodnie z innymi przepisami prawa.  </p> 
              
              
              
              
              
              
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
    var dropdown = document.getElementsByClassName("list-group-item 1");
    var i;

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function () {
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

<script type="text/javascript">
    var dropdown = document.getElementsByClassName("list-group-item 2");
    var i;

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function () {
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