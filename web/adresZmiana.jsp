<%-- 
    Document   : adresZmiana
    Created on : 2018-09-13, 13:44:08
    Author     : MatekTSW
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
        <title>baza adresów</title>
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
            
    .button:focus {
  text-decoration: none;
  outline:none;
  border: none;
  box-shadow: none;
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



                 <div class="col-lg-9">

                         <%  
                                    try {
                request.setCharacterEncoding("UTF-8");
                String msc = request.getParameter("msc");
                String kp = request.getParameter("postalcode");
                String ulica = request.getParameter("ulica");
                String nrd = request.getParameter("nrdomu");
                String nrm = request.getParameter("nrmieszkania");
                String userid = session.getAttribute("user_name").toString();
                   Class.forName("org.postgresql.Driver");
                            Connection connectionn = DriverManager.getConnection("jdbc:postgresql://sigma.pwsz.krosno.pl:5432/buk", "postgres", "26!D$196eF85");     
                
                Statement st = connectionn.createStatement();

                                            int q = st.executeUpdate("insert into adres(miejscowosc, kod_pocztowy,ulica,nr_domu,nr_mieszkania) values "
                                                    + "('" + msc + "','" + kp + "','" + ulica + "','"  + nrd + "','"   + nrm + "' )");
                                            if (q > 0) {
                                            PreparedStatement pstnn = connectionn.prepareStatement("SELECT a.id  FROM adres a  WHERE a.miejscowosc=? AND a.kod_pocztowy=? AND a.ulica=? AND nr_domu=? AND nr_mieszkania=?");
                pstnn.setString(1, msc);
                pstnn.setString(2, kp);
                pstnn.setString(3, ulica);
                pstnn.setString(4, nrd);
                pstnn.setString(5, nrm);
                ResultSet rssss = pstnn.executeQuery();
                if (rssss.next()) {
                                     PreparedStatement ps9 = connectionn.prepareStatement("UPDATE uzytkownik SET adres_id=? WHERE login=?");
                                                ps9.setInt(1, rssss.getInt("id"));
                ps9.setString(2, userid);
                int z = ps9.executeUpdate();

                                                if (z > 0) {%>
                <div class="alert alert-success" role="alert">Adres został zmieniony</div>
                <%}
                }}
else{%>
                <div class="alert alert-warning" role="alert">Prawdopodobnie coś poszło nie tak!!!</div><%}
                
                
               

                PreparedStatement pstn = connectionn.prepareStatement("SELECT a.miejscowosc, a.kod_pocztowy,a.ulica,a.nr_domu,a.nr_mieszkania  FROM adres a join uzytkownik u on a.id=u.adres_id WHERE u.login=? ");
                pstn.setString(1, userid);
                

                ResultSet rsss = pstn.executeQuery();
                if (rsss.next()) {

                   
                    
                %>
                    <div>
                        <h3 style="font-family: 'Audiowide'; color:#fff200; font-weight:bold">WPROWADŹ ADRES</h3>
                        <form name="form" method="post" action="adresZmiana.jsp" id="form" onsubmit="return validate()" novalidate>

                            <div class="control-group form-group">
                                <div class="controls">

                                    <label style="color:white"> Miejscowość</label>
                                    <input type="text" name="msc" class="form-control" style="width: 300px;"required value="<%=rsss.getString("miejscowosc")%>">

                                </div>
                            </div>
                            <div class="control-group form-group">
                                <div class="controls">

                                    <label style="color:white">Kod pocztowy</label>
                                    <input type="text" name="postalcode" class="form-control" style="width: 300px;"required value="<%=rsss.getString("kod_pocztowy")%>">

                                </div>
                            </div>
                         
                            <div class="control-group form-group">
                                <div class="controls">

                                    <label style="color:white">Ulica</label>
                                    <input type="text" name="ulica" class="form-control" style="width: 300px;"required value="<%=rsss.getString("ulica")%>">

                                </div>
                            </div>
                            <div class="control-group form-group">
                                <div class="controls">

                                    <label style="color:white">Numer domu</label>
                                    <input type="number" name="nrdomu" class="form-control" style="width: 300px;"required value="<%=rsss.getString("nr_domu")%>">

                                </div>
                            </div>
                            <div class="control-group form-group">
                                <div class="controls">

                                    <label style="color:white">Numer mieszkania</label>
                                    <input type="text" name="nrmieszkania" class="form-control" style="width: 300px;"required value="<%=rsss.getString("nr_mieszkania")%>">

                                </div>
                            </div>
                            
<%}} catch(Exception e){       
                out.println("Something went wrong !! Please try again");       
            }
%>





                            
                            <!-- For success/fail messages -->
                            <button type="submit" value="Register" class="btn btn-primary" style="background-color: #fff200; color:black; font-weight: bold; height: 40px; width: 150px; ">ZAPISZ</button>

                        </form>
                        <br>
                            
                    </div>
                   

                </div>

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
