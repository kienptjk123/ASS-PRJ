

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Reid - checkout page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    </head>

    <body>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>                             
                                <li>Thanh Toán</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="Checkout_section" id="accordion">
            <div class="container">
                <div class="checkout_form">

                    <form action="checkout" method="POST">
                        <div class="row">
                            <div class="col-lg-5 col-md-5">
                                <h3>Chi tiết đơn hàng</h3>
                                <div class="row">

                                    <div class="col-lg-12 mb-20">
                                        <label>Tên khách hàng<span>*</span></label>
                                        <input readonly="" value="${sessionScope.user.user_name}" type="text">
                                    </div>
                                    <div class="col-lg-12 mb-20">
                                        <label> Email <span>*</span></label>
                                        <input readonly="" value="${sessionScope.user.user_email}" type="text">
                                    </div>
                                    <div class="col-lg-12 mb-20">
                                        <label>Địa chỉ<span>*</span></label>
                                        <input required name="address" type="text">
                                    </div>
                                    <div class="col-lg-12 mb-20">
                                        <label>Số điện thoại<span>*</span></label>
                                        <input required name="phone" type="number">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7">

                                <h3>Sản phẩm</h3>
                                <div class="order_table table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Image</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <tr>
                                                    <td> ${i.product.name} <strong> × ${i.quantity}</strong></td>
                                                    <td> <img style="width: 30%" src="${i.product.image[0]}" alt=""></td>
                                                    <td> ${i.price * i.quantity }$</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                    <c:if test="${sessionScope.cart!=null}">
                                        <div style="margin-top: 60px">
                                            <div class="check-order">
                                                <p>Tổng giá: </p>
                                                <p>${sessionScope.total}</p>
                                            </div>
                                            <div class="check-order">
                                                <p>Phí ship: </p>
                                                <p>52$</p>
                                            </div>
                                            <div class="check-order">
                                                <p>Tổng đơn: </p>
                                                <p><strong>${sessionScope.total + 52}$</strong></p>
                                            </div>        
                                        </div>

                                    </c:if>
                                </div>                              

                                <div class="order_button">
                                    <button type="submit">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="layout/footer.jsp"/>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .check-order {
            display: flex;
            gap: 30px;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        .breadcrumbs_area {
            background-color: #f5f5f5;
            color: black;
            padding: 15px 0;
        }

        .breadcrumb_content ul {
            padding: 0;
            list-style: none;
        }

        .breadcrumb_content ul li {
            display: inline;
            font-size: 18px;
            color: black;
        }

        .Checkout_section {
            padding: 20px 0;
        }

        .checkout_form h3 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .checkout_form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .checkout_form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .order_table table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .order_table th, .order_table td {
            padding: 10px 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .order_table td {
            padding: 5px 5px;
        }

        .payment_method label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .payment_method input {
            margin-right: 10px;
        }

        .order_button {
            text-align: center;
        }

        .order_button button {
            padding: 10px 20px;
            background-color: orange;
            border: none;
            color: #fff;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
        }

        .order_button button:hover {
            background-color: darkorange;
        }
    </style>

    <script src="assets/js/plugins.js"></script>

    <script src="assets/js/main.js"></script>
</body>

</html>
