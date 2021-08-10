<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PostPlus</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>PostPlus</title>
    <!-- Favicons-->
    <link rel="shortcut icon" href="../assets/images/module-9.jpg">
    <link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/apple-touch-icon-114x114.png">
    <!-- Web Fonts-->
    <link href="https://fonts.googleapis.com/css?family=PT+Serif%7cSignika:300,400,600,700" rel="stylesheet">
    <!-- Bootstrap core CSS-->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Plugins and Icon Fonts-->
    <link href="assets/css/plugins.min.css" rel="stylesheet">
    <!-- Template core CSS-->
    <link href="assets/css/template.css" rel="stylesheet">
</head>
<body>

<!-- Preloader-->
<div class="page-loader">
    <div class="loader"></div>
</div>
<!-- Preloader end-->

<!-- Header-->
<header class="header header-transparent">

    <div class="navigation navigation-center">
        <div class="container-fluid">
            <!-- Brand-->
            <div class="inner-header"><a class="inner-brand" href="index.jsp"><img class="brand-dark"
                                                                                   src="../assets/images/module-9.jpg"
                                                                                   width="74px" alt=""><img
                    class="brand-light" src="../assets/images/module-9.jpg" width="74px" alt=""></a></div>
            <!-- Navigation-->
            <div class="inner-navigation collapse">
                <div class="inner-nav onepage-nav">
                    <ul>
                        <li><a href="index.jsp#home"><span class="menu-item-span">Գլխավոր</span></a></li>
                        <li><a href="index.jsp#special"><span class="menu-item-span">Հայտարարություններ</span></a></li>
                        <li><a href="/login-view"><span class="menu-item-span">Մուտք/Գրանցում</span></a></li>
                    </ul>
                </div>
            </div>


            <!-- Mobile menu-->
            <div class="nav-toggle"><a href="index.jsp#" data-toggle="collapse" data-target=".inner-navigation"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></div>
        </div>
    </div>


</header>
<% List<Post> posts = (List<Post>) request.getAttribute("post"); %>
<% List<Category> categories = (List<Category>) request.getAttribute("categories"); %>
<% User user = (User) session.getAttribute("user"); %>
<% Category category = (Category) session.getAttribute("categories"); %>


<!-- Header end-->


<!-- Wrapper-->

<!-- Hero-->
<section class="module-cover parallax fullscreen" id="home" data-background="assets/images/module-6.jpg"
         data-overlay="1" data-gradient="1">
    <div class="container">
        <div class="row">
            <div class="col-md-12 m-auto">
                <div class="text-center">
                    <h1 class="display-1">ՀԱՅՏԱՐԱՐՈՒԹՅՈՒՆՆԵՐ</h1>
                    <p>PostPlus օնլայն հարթակ հայտարարություններին ծանոթանալու համար<br/> Խնայեք ժամանակ
                    </p>
                    <div class="space" data-mY="40px"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero end-->

<!-- Special Offers-->
<section class="module bg-gray" id="special" style="background-image: url('../assets/images/module-1.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-md-6 m-auto text-center">
                <p class="subtitle" style="background-color: #0b0b0b">PostPlus-ը համագործակցում է News.am կայքի հետ</p>
                <div class="divider-border"></div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <div class="space" data-mY="60px"></div>
            </div>
        </div>

        <div class="row">


            <div class="col-md-12">


                <div>
                    <br>
                    <h3 style="text-align: center; color: white" >All Posts:</h3> <br>

                </div>
            </div>
        </div>


        <div class="owl-carousel menu-carousel" data-carousel-options="{&quot;nav&quot;: false}" >
            <% for (Post post : posts) {%>
            <tr>
                <div class="menu-classic-item" style="border: 1px solid black; width:50%; margin:auto; background-color: white;">
                    <div class="menu-classic-item-img"><a class="photo"></a><img
                            src="/image?path=<%=post.getPicUrl()%>" style="width:30%;" alt="">
                    </div>
                    <div class="menu-classic-item-inner">
                        <h6><%=post.getTitle()%>
                        </h6>
                        <p><%=post.getText()%>
                        </p>
                        <p><%=post.getCategory().getName()%>
                        </p>
                        <p><%=post.getUser().getName()%>
                        </p>
                    </div>
                </div>
                    <%}%>
        </div>
    </div>
</section>
<!-- Special Offers End-->


<svg class="footer-circle" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100"
     viewbox="0 0 100 100" preserveaspectratio="none">
    <path d="M0 100 C40 0 60 0 100 100 Z"></path>
</svg>
<!-- Footer-->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div>
                <!-- Text widget-->
                <aside class="widget widget_text">
                    <div class="textwidget">
                        <p><img src="../assets/images/module-9.jpg" width="74px" alt=""></p>
                        <p>Սույն կայքում տեղ գտած լրատվական հրապարակումների հեղինակային իրավունքը պատկանում է բացառապես PostPlus
                            լրատվական-վերլուծական գործակալությանը։ Սույն կայքի բոլոր
                            լրատվական հրապարակումները անհատական օգտագործման համար են։
                            Տեղեկատվություն տարածող այլ միջոցներում սույն կայքի հրապարակումների
                            (մասնակի կամ ամբողջական) վերահրապարկման համար անհրաժեշտ է
                            PostPlus լրատվական-վերլուծական գործակալության գրավոր թույլտվությունը։
                            Խախտում թույլ տված անձինք կենթարկվեն պատասխանատվության օրենքով սահմանված կարգով։</p>
                        <ul class="icon-list">
                            <li><i class="ti-email"></i> info@postplus.am</li>
                            <li><i class="ti-headphone-alt"></i> +374 41 82 47 04</li>
                            <li><i class="ti-location-pin"></i> ITSpaceLLC, Gyumri, Armenia</li>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
    </div>
    <div class="small-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="copyright">© 2021 PostPlus</a>, All Rights Reserved.</div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer end-->
</div>
<!-- Wrapper end-->


<!-- Scripts-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
<script src="assets/js/plugins.min.js"></script>
<script src="assets/js/custom.min.js"></script>
</body>
</html>


