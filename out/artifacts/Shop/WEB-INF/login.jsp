<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="../assets/css/styles.css" rel="stylesheet">
    <link href="../assets/css/styles.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
</head>
<body>
<%--Login:--%>
<%--<form action="/loginServlet" method="post">--%>
<%--    email: <input type="text" name="email"><br>--%>
<%--    password: <input type="password" name="password"><br>--%>
<%--    <input type="submit" value="LOGIN">--%>
<%--</form>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%--Register:--%>
<%--<form action="/registerServlet" method="post">--%>
<%--    name: <input type="text" name="name"><br>--%>
<%--    surname: <input type="text" name="surname"><br>--%>
<%--    email: <input type="text" name="email"><br>--%>
<%--    password: <input type="password" name="password"><br>--%>
<%--    userType:  <select name="type">--%>
<%--    <option value="USER">USER</option>--%>
<%--    <option value="MANAGER">MANAGER</option>--%>
<%--</select><br>--%>
<%--    <input type="submit" value="REGISTER">--%>
<%--</form>--%>


<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="active" id="login-form-link">Login</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="register-form-link">Register</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="login-form" action="/loginServlet" method="post" role="form"
                                  style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="email" tabindex="1" class="form-control"
                                           placeholder="Username" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" tabindex="2" class="form-control"
                                           placeholder="Password">
                                </div>
                                <div class="form-group text-center">
                                    <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                    <label for="remember"> Remember Me</label>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4"
                                                   class="form-control btn btn-login" value="Log In">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <a href="https://phpoll.com/recover" tabindex="5"
                                                   class="forgot-password">Forgot Password?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form id="register-form" action="/registerServlet" method="post" role="form"
                                  style="display: none;">
                                <div class="form-group">
                                    <input type="text" name="name" tabindex="1" class="form-control" placeholder="name"
                                           value="">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="surname" tabindex="1" class="form-control"
                                           placeholder="surname" value="">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" tabindex="1" class="form-control"
                                           placeholder="Email Address" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" tabindex="2" class="form-control"
                                           placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <select name="type" class="form-control">
                                        <option value="USER">USER</option>
                                        <option value="MANAGER">MANAGER</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit"
                                                   tabindex="4" class="form-control btn btn-register"
                                                   value="Register Now">
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
