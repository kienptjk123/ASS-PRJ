
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Giỏ hàng</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="layout/menu.jsp"/>

        <div class="off_canvars_overlay"></div>
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li>Giỏ hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!-- shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container">  
                <form> 
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc">
                                <div class="cart_page table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product_remove">Delete</th>
                                                <th class="product_thumb">Image</th>
                                                <th class="product_name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product_quantity">Quantity</th>
                                                <th class="product_total">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <tr>
                                                    <td class="product_remove">
                                                        <a href="cart?action=deletecart&product_id=${i.product.id}">
                                                            <i style="color: #F6432E" class="fas fa-trash"></i>
                                                        </a>
                                                    </td>
                                                    <td class="product_thumb">
                                                        <a href="HomeController?action=productdetail&product_id=${i.product.id}">
                                                            <img src="${i.product.image[0]}" alt="">
                                                        </a>
                                                    </td>
                                                    <td class="product_name">
                                                        <a href="product?action=productdetail&product_id=${i.product.id}">
                                                            ${i.product.name}
                                                        </a>
                                                    </td>
                                                    <td class="product-price">
                                                        <fmt:formatNumber pattern="##########" value="${i.product.salePrice}"/>$
                                                    </td>
                                                    <td class="product_quantity">
                                                        <input style="text-align: center" name="quantity" min="1" max="100" value="${i.quantity}" type="number">
                                                    </td>
                                                    <td class="product_total">
                                                        <fmt:formatNumber pattern="##########" value="${i.price * i.quantity}"/>$
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>   
                                </div> 
                                <!--                                <div class="cart_submit">
                                                                    <button type="submit">update cart</button>
                                                                </div> -->
                            </div>
                        </div>
                    </div>

                    <!--coupon code area start-->
                    <c:if test="${sessionScope.cart!=null}">
                        <div class="coupon_area">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="coupon_code right">
                                        <h3>Hóa đơn</h3>
                                        <div class="coupon_inner">
                                            <div class="cart_subtotal">
                                                <p>Tổng đơn hàng</p>
                                                <p class="cart_amount"><fmt:formatNumber pattern="##########" value="${sessionScope.total}"/>$</p>
                                            </div>
                                            <div class="cart_subtotal ">
                                                <p>Phí ship</p>
                                                <p class="cart_amount">52$</p>
                                            </div>

                                            <div class="cart_subtotal">
                                                <p>Total</p>
                                                <p class="cart_amount"><fmt:formatNumber pattern="##########" value="${sessionScope.total + 52}"/>$</p>
                                            </div>
                                            <div class="checkout_btn">
                                                <a href="checkout">Thanh toán</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </form> 
            </div>     
        </div>

        <jsp:include page="layout/footer.jsp"/>

        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .breadcrumbs_area {
                padding: 20px 0;
                background: white;
            }

            .breadcrumb_content ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .breadcrumb_content ul li {
                display: inline;
                margin-right: 10px;
            }

            .shopping_cart_area {
                padding: 20px 0;
            }
            
            .product_name a {
                color: black;
                text-decoration: none;
            }
            
            .table_desc {
                margin-bottom: 20px;
            }

            .cart_page table {
                width: 100%;
                border-collapse: collapse;
            }

            .cart_page table th, .cart_page table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .cart_page table th {
                background: #f4f4f4;
            }

            .cart_page table img {
                width: 140px;
            }

            .coupon_area {
                margin-top: 20px;
            }

            .cart_totals {
                border: 1px solid #ddd;
                padding: 20px;
                background: #f4f4f4;
            }

            .cart_totals h3 {
                margin-top: 0;
            }

            .cart_subtotal {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
            }

            .checkout_btn {
                text-align: right;
                margin-top: 20px;
            }

            .checkout_btn a {
                background: #F8492F;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
            }

        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>