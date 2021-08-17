<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<%@ page import="javafx.geometry.Pos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
    <link rel="shortcut icon" href="../assets/images/favicon.png">
    <link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/apple-touch-icon-114x114.png">
    <!-- Web Fonts-->
    <link href="https://fonts.googleapis.com/css?family=PT+Serif%7cSignika:300,400,600,700" rel="stylesheet">
    <!-- Bootstrap core CSS-->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Plugins and Icon Fonts-->
    <link href="../assets/css/plugins.min.css" rel="stylesheet">
    <!-- Template core CSS-->
    <link href="../assets/css/template.css" rel="stylesheet">
</head>
<body>
<% List<Post> posts = (List<Post>) request.getAttribute("posts");%>
<% User user = (User) session.getAttribute("user"); %>

Welcome <%=user.getName()%>

<a href="/logout"> logout </a>
<section class="module bg-gray" id="special" style="background-image: url('../assets/images/module-8.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-md-6 m-auto text-center">
                <h1 class="display-1">Հայտարարություններ</h1>
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
                    <h3 style="text-align: center">All Posts:</h3> <br>

                </div>
            </div>
        </div>


<%--        <div class="owl-carousel menu-carousel" data-carousel-options="{&quot;nav&quot;: false}">--%>
<%--            <% for (Post post : posts) {%>--%>
<%--            <tr>--%>
<%--                <div class="menu-classic-item"--%>
<%--                     style="border: 1px solid black; width:50%; margin:auto; background-color: white;">--%>
<%--                    <div class="menu-classic-item-img"><a class="photo"></a><img--%>
<%--                            src="/image?path=<%=post.getPicUrl()%>" style="width:30%;" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="menu-classic-item-inner">--%>
<%--                        <h6><%=post.getTitle()%>--%>
<%--                        </h6>--%>
<%--                        <p><%=post.getText()%>--%>
<%--                        </p>--%>
<%--                        <p><%=post.getCategory().getName()%>--%>
<%--                        </p>--%>
<%--                        <p><%=post.getUser().getName()%>--%>
<%--                        </p>--%>
<%--                        <p><a href="/removePost?id=<%=post.getId()%>">Delete</a></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                    <%}%>--%>
<%--        </div>--%>
<%--    </div>--%>


        <table border="1" style="background-color: #0b0b0b">
            <tr>
                <th>title</th>
                <th>text</th>
                <th>category</th>
                <th>user</th>
                <th>picture</th>
                <th>delete</th>
            </tr>
            <% for (Post post : posts) {%>
            <tr>
                <td><%=post.getTitle()%>
                </td>
                <td><%=post.getText()%>
                </td>
                <td><%=post.getCategory().getName()%>
                </td>
                <td><%=post.getUser().getName()%>
                </td>
                <td><% if (post.getPicUrl() != null) { %>
                    <img src="/image?path=<%=post.getPicUrl()%>" width="30"/>
                    <%}%>
                </td>
                <td><a href="/removePost?id=<%=post.getId()%>">Delete</a></td>
                <%
                    }
                %>
            </tr>
        </table>

</section>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
<script src="../assets/js/plugins.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
</body>
</html>
