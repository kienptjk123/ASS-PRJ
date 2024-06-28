<%-- 
    Document   : cart
    Created on : Oct 17, 2021, 8:29:54 AM
    Author     : Khuong Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Lịch sử đơn hàng</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />        <!-- Main Style CSS -->
    </head>

    <body>
        <jsp:include page="layout/menu.jsp"/>
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li style="color: black">Lịch sử đơn hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>

        <div class="shopping_cart_area">
            <div class="container">  
                <form> 
                    <div class="row">
                        <div class="cart_page table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="product_thumb">Ảnh</th>
                                        <th class="product-price">Tên sản phẩm</th>
                                        <th class="product_quantity">Số lượng</th>
                                        <th class="product_total">Đơn giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.detail}" var="d">
                                        <tr>
                                            <td class="product_thumb">
                                                <a href="#">
                                                    <img src="${d.product.image[0]}" alt="">
                                                </a>
                                            </td>
                                            <td class="product_name">
                                                <a style="text-decoration: none" href="#">
                                                    ${d.product.name}
                                                </a>
                                            </td>
                                            <td class="product_quantity">${d.quantity}</td>
                                            <td class="product_total"> <fmt:formatNumber pattern="##########" value="${d.price}"/> $</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>   
                        </div>
                    </div>
                </form> 
            </div>     
        </div>

        <jsp:include page="layout/footer.jsp"/>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            a{
                text-decoration: none;
            }

            a:hover {
                text-decoration: none;
            }
            .breadcrumbs_area {
                padding: 20px 0;
            }

            .breadcrumb_content ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .breadcrumb_content ul li {
                display: inline;
                color: #999;
            }

            .shopping_cart_area {
                padding: 50px 0;
            }

            .cart_page {
                margin-top: 30px;
            }

            .table-responsive {
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                text-align: center;
            }

            th {
                background-color: #f5f5f5;
                padding: 15px;
                font-weight: bold;
                border: 1px solid #ddd;
            }

            td {
                padding: 15px;
                border: 1px solid #ddd;
            }

            .product_thumb img {
                max-width: 100px;
                height: auto;
            }

            .product_name a, .product_thumb a {
                color: #333;
                text-decoration: none;
            }

            .product_name a:hover, .product_thumb a:hover {
                text-decoration: underline;
            }

            thead th {
                background-color: #f5f5f5;
                color: #333;
                font-size: 16px;
            }
          
            tbody tr:nth-child(even) {
                background-color: #fff;
            }

            tbody td {
                vertical-align: middle;
            }

            .product_total {
                color: #f00;
                font-weight: bold;
            }

            .product_size, .product_color {
                color: #ff6600;
            }


        </style>      

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>