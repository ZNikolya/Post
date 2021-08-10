<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="../assets/css/styles.css" rel="stylesheet">
    <link href="../assets/css/styles.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<% List<Category> categories = (List<Category>) request.getAttribute("categories"); %>

<a href="/logout">Logout</a>
<br>


<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="active" id="login-form-link">Add Category</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="register-form-link">Add Post</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="login-form" action="/addCategoryServlet" method="post" role="form"
                                  style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="name" tabindex="1" class="form-control"
                                           placeholder="title" value="">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" id="login-submit" tabindex="4"
                                                   class="form-control btn btn-login" value="AddCategory">
                                        </div>
                                    </div>
                                </div>

                            </form>
                            <form id="register-form" enctype="multipart/form-data" action="/addPostServlet" method="post" role="form"
                                  style="display: none; ">
                                <div class="form-group">
                                    <input type="text" name="title" tabindex="1" class="form-control"
                                           placeholder="title"
                                           >
                                </div>
                                <div class="form-group">
                                    <input type="text" name="text" tabindex="1" class="form-control"
                                           placeholder="text" >
                                </div>
                                <div class="form-group">
                                    <select name="categoryId" class="form-control">
                                        <% for (Category category : categories) {%>
                                        <option value="<%=category.getId()%>"><%=category.getName()%>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="file" name="image" tabindex="2" class="form-control">
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit"
                                                   tabindex="4" class="form-control btn btn-register"
                                                   value="AddPost">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {

        $('#login-form-link').click(function (e) {
            $("#login-form").delay(100).fadeIn(100);
            $("#register-form").fadeOut(100);
            $('#register-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });
        $('#register-form-link').click(function (e) {
            $("#register-form").delay(100).fadeIn(100);
            $("#login-form").fadeOut(100);
            $('#login-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });

    });
</script>
</html>
