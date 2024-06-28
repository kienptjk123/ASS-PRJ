

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>my account</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="layout/menu.jsp"/>
        <div class="breadcrumbs_area other_bread" style="background-color: white">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li>Tài khoản của tôi</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <section class="main_content_area">
            <div class="container">   
                <div class="account_dashboard">
                    <div class="row">
                        <div class="col-sm-12 col-md-3 col-lg-3">
                            <!-- Nav tabs -->
                            <div class="dashboard_tab_button">
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li><a href="#account-details" data-toggle="tab" class="nav-link">Tài khoản</a></li>
                                    <li> <a href="#orders" data-toggle="tab" class="nav-link">Đơn hàng</a></li>
                                    <li><a href="user?action=logout" class="nav-link">Đăng xuất</a></li>
                                </ul>
                            </div>    
                        </div>
                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <div class="tab-content dashboard_content">
                                <div class="tab-pane fade" id="orders">
                                    <h3 style="background-color: white; border: none; margin-right: 10px">Đơn hàng</h3>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày khởi tạo</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Tổng đơn</th>
                                                    <th>Actions</th>	 	 	 	
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="bill" items="${bill}">
                                                    <tr>
                                                        <td>${bill.bill_id}</td>
                                                        <td>${bill.date}</td>
                                                        <td>${bill.address}</td>
                                                        <td>${bill.total}</td>
                                                        <td><a href="user?action=showdetail&bill_id=${bill.bill_id}" class="view">view</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade show active" id="account-details">
                                    <h3 style="background-color: white; border: none">Tài khoản của tôi </h3>
                                    <div class="login" style="border: none">
                                        <div class="login_form_container">
                                            <div style="background-color: white;" class="account_login_form">
                                                <form action="user?action=updateinfo" method="POST">
                                                    <label>Tên người dùng</label>
                                                    <input type="text" name="user_name" value="${sessionScope.user.user_name}">
                                                    <label>Email</label>
                                                    <input type="text" readonly name="user_email" value="${sessionScope.user.user_email}">
                                                    <label>Password</label>
                                                    <input type="password" name="user_pass" value="${sessionScope.user.user_pass}">
                                                    <div class="cart_submit" style="text-align: end; margin-top: 10px">
                                                        <button type="submit">save</button>
                                                    </div> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>     

        </section>			
        <jsp:include page="layout/footer.jsp"/>

        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            a {
                text-decoration: none;
            }

            a:hover {
                text-decoration: none;
            }

            body {
                font-family: Arial, sans-serif;
            }
            .main_content_area {
                margin-bottom: 25px;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .breadcrumbs_area {
                background-color: #f7f7f7;
                padding: 15px 0;
                margin-bottom: 20px;
            }

            .breadcrumb_content ul {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
                align-items: center;
            }

            .breadcrumb_content ul li {
                margin-right: 5px;
            }

            .breadcrumb_content ul li:after {
                content: ">";
                margin-left: 5px;
            }

            .breadcrumb_content ul li:last-child:after {
                content: "";
            }

            .account_dashboard {
                display: flex;
            }

            .dashboard_tab_button {
                background-color: white;
                padding: 15px 10px;
                color: #fff;
                border-radius: 4px;
                margin-right: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            }

            .dashboard_tab_button ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .dashboard_tab_button ul li {
                margin-bottom: 10px;
            }

            .dashboard_tab_button ul li a {
                color: black;
                text-decoration: none;
                display: block;
                padding: 10px 20px;
                border-radius: 4px;
                transition: background 0.3s;
            }

            .dashboard_tab_button ul li a:hover,
            .dashboard_tab_button ul li a.active {
                background-color: #f4511e;
            }

            .dashboard_content {
                flex: 1;
                background-color: #fff;
                padding: 20px;
                border-radius: 4px;
            }


            .table th,
            .table td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: center;
            }

            .table th {
                background-color: #f7f7f7;
            }

            .table a.view {
                color: #f4511e;
                text-decoration: none;
            }

            .account_login_form input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .account_login_form button {
                padding: 10px 20px;
                background-color: #f4511e;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .account_login_form button:hover {
                background-color: #333;
            }
            .active {
                background-color: white;
            }

            table {
                box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;
                border: none;
                width: 100%;
                border-collapse: collapse;
                margin-right: 142px;
                table-layout: auto;
            }

            .table thead th {
                vertical-align: middle;
                border-bottom: 2px solid #dee2e6;
            }

            .table-responsive {
                overflow: hidden;
            }
           
        </style>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>
