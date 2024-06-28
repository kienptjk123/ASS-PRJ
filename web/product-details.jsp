

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product details</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="layout/menu.jsp"/>

        <div class="breadcrumbs_area product_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li style="font-size: 2rem">product details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--product details start-->
        <div class="product_details">
            <div class="container">
                <c:forEach items="${requestScope.getID}" var="i">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 item-left">
                            <div class="product-details-tab">
                                <div id="img-1" class="zoomWrapper single-zoom">
                                    <a href="#">
                                        <img id="zoom1" src="${i.image[0]}" data-zoom-image="${i.image[0]}" alt="product">
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-7 col-md-7">
                            <div class="product_d_right">
                                <form action="cart" method="POST">
                                    <input type="hidden" name="product_id" value="${i.id}">
                                    <h1 style="font-size: 2rem">${i.name}</h1>
                                    <ul style="display: flex">
                                        <c:set var="numstar" value="${i.starRating}"/>
                                        <c:forEach begin="1" end="${numstar}" step="1">
                                            <li style=" list-style: none">
                                                <p  href="#" style="color: orange">
                                                    <i style="font-size: 1.5rem" class="fa fa-star"></i>
                                                </p>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <div class="product_price" style="display: flex; gap: 20px">
                                        <span style="text-decoration-line: line-through;
                                              margin: auto 0;font-size: 2rem;line-height: 1.25rem;display: flex;opacity: 0.5;" class="old-price">${i.price} $</span>
                                        <span style="font-size: 2rem;
                                              color: #F94F30;
                                              font-weight: 400;
                                              overflow: hidden;
                                              white-space: nowrap;
                                              text-overflow: ellipsis;" class="current_price">${i.salePrice} $
                                        </span>
                                        <span style="font-size: 1rem;text-transform: uppercase; color: white; font-weight: bold; padding: 1px 3px; background-color: #F7472E; border-radius: 0.125rem; margin: auto; margin-right: 250px">
                                            ${i.discount}%
                                        </span>
                                    </div>

                                    <div class="product_variant quantity">
                                        <label>Quantity: </label>
                                        <input  min="1" name="quantity" type="number">
                                        <button class="button" type="submit">Thêm vào giỏ hàng</button>  
                                    </div>                               
                                </form>
                            </div>
                        </div>

                        <div class="">
                            <div class="product_desc">
                                <h3 style="font-size: 1.8rem;line-height: 1.75rem;text-transform: capitalize; padding: 1rem; background-color: #F9FAFB">
                                    Mô tả sản phẩm
                                </h3>
                                <p style="font-size: 1.3rem; padding: 10px 40px;">${i.describe}</p>
                            </div>
                        </div>

                    </div>
                </c:forEach>              
            </div>
        </div>    
    </div>
    <!--product details end-->
    <!--product info end-->

    <!--product section area start-->
    <!--    <section class="product_section related_product">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm tương tự</h2>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
    <c:forEach items="${ProductByCategory}" var="pc">
      <div class="col-lg-3">
          <div class="single_product">
                <div class="product_thumb">
                    <a class="primary_img" href="product?action=productdetail&product_id=${pc.product_id}"><img src="${pc.img}" alt=""></a>
                </div>
                <div class="product_content">
                    <h3><a href="product?action=productdetail&product_id=${pc.product_id}">${pc.product_name}</a></h3>
                    <span class="current_price">${pc.product_price}</span>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</div>
</div>
</section>-->


    <!--product details end-->
    <!--product info end-->

    <!--product section area start-->

    <jsp:include page="layout/footer.jsp"/>

    <style>
        /* Reset some default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        label {
            margin: 0;
            font-weight: bold;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }

        .breadcrumbs_area {
            background-color: white;
            padding: 20px 0;
        }

        .breadcrumb_content ul {
            list-style: none;
            display: flex;
            align-items: center;
        }

        .breadcrumb_content ul li {
            margin-right: 5px;
            text-transform: capitalize;
        }

        .breadcrumb_content ul li a {
            text-decoration: none;
            color: #333;
        }

        .breadcrumb_content ul li a:hover {
            color: #F8492F;
        }

        .product_details {
            padding: 40px 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product_details .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .item-left {
            text-align: center;
        }

        .product-details-tab {
            padding: 20px;
        }

        .product-details-tab img {
            max-width: 100%;
            padding: 10px;
            background-color: #fff;
        }

        .product_d_right {
            padding: 20px;
        }

        .product_d_right h1 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .product_price {
            margin-bottom: 20px;
        }

        .product_price .current_price {
            font-size: 20px;
            font-weight: bold;
            color: #d9534f;
        }

        .product_desc {
            margin-bottom: 20px;
        }

        .product_variant {
            margin-bottom: 20px;
        }
        .quantity {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .product_variant h3 {
            font-size: 16px;
            margin-bottom: 10px;
            color: #333;
        }

        .product_variant select,
        .product_variant input {
            width: 15%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .product_variant button {
            background-color: #F6422D;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .product_variant button:hover {
            background-color: #F6422E;
        }


    </style>
    <script src="assets/js/plugins.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
    <script>
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
