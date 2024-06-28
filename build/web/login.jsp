
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Login page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body>
        <div class="off_canvars_overlay"></div>
        <div class="col-md-6 col-12 fxt-bg-color form-login">
            <div class="gap" style="max-width: 450px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                <div class="breadcrumbs_area other_bread">
                    <div class="body-content" style="display: flex; margin-left: 20px; gap: 140px">   
                        <div class="icon" style="margin: auto 0; ">
                            <a style="display: flex; align-items: center; " class="the" href="HomeController?action=search">
                                <i style="color: #EE4D2D; font-size: 1.2rem" class="fa fa-shopping-bag"></i>
                            </a>
                        </div>
                        <div class="login-header" style="display: flex; margin: auto 0; gap: 10px">
                            <a style="font-size: 1.2rem; margin: auto 0" href="./login.jsp">
                                Đăng nhập
                            </a>
                            <p style="margin: auto 0">|</p>
                            <a style="color: black; font-size: 1.2rem; margin: auto 0" href="./register.jsp">
                                Đăng ký
                            </a>
                        </div>
                    </div>         
                </div>

                <div class="customer_login">
                    <div class="container">
                        <div class="form-row">
                            <div class="account_form">
                                <h2>Đăng nhập</h2>
                                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                                <form action="user?action=checkLogin" method="POST">
                                    <p>   
                                        <input name="user_email" type="text" value="${cookie.email.value}" placeholder="Email">
                                    </p>
                                    <p style="color: red; align-content: center;">
                                        ${requestScope.error}
                                    </p>
                                    <p>   
                                        <input name="user_pass" type="password" value="${cookie.pass.value}" placeholder="Mật khẩu">
                                    </p>   
                                    <div class="login_submit" style="margin-top: 25px">
                                        <div class="submit-left" style="display: flex; justify-content: space-between">
                                            <a href="#">Quên mật khẩu</a>
                                            <label for="remember">
                                                <input ${(cookie.rem.value eq 'ON')?"checked":""} id="remember" name="remember" value="ON" type="checkbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button style="margin-top: 15px" type="submit">Đăng nhập</button>
                                    </div>
                                </form>
                            </div>    
                        </div>
                    </div>    
                </div>
            </div>

        </div>

        <div class="col-md-6 col-12 fxt-none-767 fxt-bg-img" data-bg-image="images/figure/aa.jpg" style="background-image: url(images/app/nen2.jpg);"></div>

        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                display: flex;
                height: 100vh;
                font-family: Arial, sans-serif;
            }

            .form-row {
                display: block;
            }

            .fxt-bg-img {
                background-repeat: no-repeat;
                background-position: center center;
                background-size: cover;
                min-height: 100vh;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
            }

            .form-login {

                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;             
            }

            .form-login .container {
                width: 100%;
            }

            .form-login .breadcrumbs_area {
                margin-bottom: 20px;
            }

            .form-login .icon {
                margin-bottom: 20px;
            }

            .form-login .login-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .form-login .login-header a {
                font-size: 1.2em;
                color: red;
            }

            .form-login .login-header a:hover {
                text-decoration: none;
            }

            .form-login .account_form h2 {
                margin-bottom: 20px;
                color: red;
            }

            .form-login .account_form form p {
                margin-bottom: 20px;
            }

            .form-login .account_form form label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .form-login .account_form form input[type="text"],
            .form-login .account_form form input[type="password"] {
                width: 100%;
                padding: 10px;
                border: 0;
                border-bottom: 1px solid #e7e7e7;
                border-radius: 5px;
            }

            .form-login {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .form-login .login_submit a {
                color: red;
                text-decoration: none;
            }

            .form-login .login_submit a:hover {
                text-decoration: underline;
            }

            .form-login .login_submit label {
                display: flex;
                align-items: center;
            }

            .form-login .login_submit button {
                background-color: red;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

        </style>

        <<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
