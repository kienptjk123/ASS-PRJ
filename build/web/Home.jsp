
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>                         
        <jsp:include page="layout/menu.jsp"/>
        <div class="center">         
            <div class="container">

                <div class="container-content">
                    <div class="body-btn">
                        <div class="container-content_header">
                            <ul>
                                <li class="li-header">
                                    <i class="fa fa-list-ul"></i>
                                    <a href="HomeController">
                                        <p style="color: #FA4F30">Tất cả danh mục</p>

                                    </a>
                                </li>
                                <li class="li-list">
                                    <a href="HomeController?action=tagname&type=dienthoai">Điện thoại</a>
                                </li>
                                <li class="li-list">
                                    <a href="HomeController?action=tagname&type=dongho">Đồng hồ</a>
                                </li>
                                <li class="li-list">
                                    <a href="HomeController?action=tagname&type=aothun">Áo thun</a>
                                </li>
                                <div class="item_icon">
                                    <i class="fa fa-filter"></i>
                                    <p>Bộ lọc tìm kiếm</p>
                                </div>
                                <h5>Khoảng giá</h5>

                                <form action="HomeController?action=search" method="POST">
                                    <div class="form-search">
                                        <input placeholder="$ TỪ" type="text" name="searchCart1"/>
                                        <div style="margin: auto">-</div>
                                        <input placeholder="$ ĐẾN" type="text" name="searchCart2"/>
                                    </div>
                                    <input type="submit" value="ÁP DỤNG"/>
                                </form>

                                <div class="grade">
                                    <div>
                                        <div class="item_icon">
                                            <i class="fas fa-chart-line"></i>
                                            <p>Đánh giá</p>
                                        </div>
                                        <input type="hidden" value="0" name="numberStar" id="chosseStar">
                                        <div class="select">
                                            <div class="option" id="option1" style="margin-bottom: 10px; cursor: pointer">
                                                <a href="HomeController?action=starRating&type=more5" style="text-decoration: none; color: black;">
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                </a>

                                            </div>

                                            <div class="option" id="option2" style="margin-bottom: 10px;cursor: pointer">
                                                <a href="HomeController?action=starRating&type=more4" style="text-decoration: none; color: black;">
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i  class="fa fa-star"></i>
                                                    <span style="font-weight: 600; font-size: 20px; margin-left: 10px">Trở lên</span>
                                                </a>
                                            </div>
                                            <div class="option" id="option3" style="margin-bottom: 10px;cursor: pointer">
                                                <a href="HomeController?action=starRating&type=more3" style="text-decoration: none; color: black;">
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <span style="font-weight: 600; font-size: 20px; margin-left: 10px">Trở lên</span>
                                                </a>                           
                                            </div>
                                            <div class="option" id="option4" style="margin-bottom: 10px;cursor: pointer">
                                                <a href="HomeController?action=starRating&type=more2" style="text-decoration: none; color: black;">
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i style="color: #FFC51A" class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <span style="font-weight: 600; font-size: 20px; margin-left: 10px">Trở lên</span>
                                                </a>                       
                                                <div class="option" id="option5" style="margin-bottom: 10px;cursor: pointer; margin-top: 10px">
                                                    <a href="HomeController?action=starRating&type=more1" style="text-decoration: none; color: black;">
                                                        <i style="color: #FFC51A" class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <span style="font-weight: 600; font-size: 20px; margin-left: 10px">Trở lên</span>
                                                    </a>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                        </div>
                    </div>

                    <div class="container-content_item">
                        <div class="header-item">
                            <div class="header-left" onclick="handleItemClick(event)">
                                <a>Sắp xếp theo</a>
                                <a class="left-item active" data-id="popular" href="HomeController?action=tag&type=popular">Phổ biến</a>
                                <a class="left-item" data-id="newest" href="HomeController?action=tag&type=new">Mới nhất</a>
                                <div class="dropdown">
                                    <button style="color: #000; background-color: #ffffff; border: none; font-family: sans-serif;" class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Bộ lọc
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="HomeController?action=sort&type=low">Giá từ thấp đến cao</a>
                                        <a class="dropdown-item" href="HomeController?action=sort&type=high">Giá từ cao xuống thấp </a>
                                        <a class="dropdown-item" href="HomeController?action=sort&type=a-z">A-Z</a>
                                    </div>
                                </div>

                            </div>
                            <div class="header-right">
                                <div class="paginationn">
                                    <c:choose>
                                        <c:when test="${page > 1}">
                                            <a href="HomeController?page=${page - 1}">&lt;</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="disabled">&lt;</a>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${page < requestScope.numberpage}">
                                            <a href="HomeController?page=${page + 1}">&gt;</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="disabled">&gt;</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                        <div class="content-btn ">
                            <c:forEach items="${productPage}" var="i">
                                <div class="product_items">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a href="#" class="primary_img">
                                                <img src="${i.image[0]}"  alt="">
                                            </a>
                                            <a href="#" class="secondary_img">
                                                <img style="width: 100%" src="${i.image[1]}" alt="">
                                            </a>

                                            <div class="action_links">            
                                                <a href="HomeController?action=productdetail&product_id=${i.id}" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <form style="margin-top: 5px" action="wishlist?action=add" method="POST">
                                                    <input hidden name="product_id" value="${i.id}">

                                                    <a href="#" title="Add to Wishlist">
                                                        <button style="width: 0; height: 24px; margin-top: -13px; margin-left: 3px" 
                                                                class="btn btn-sm add" type="submit" title="Add to Wishlist" 
                                                                id="show-emp-${i.id}" data-user-id="${i.id}" data-target="#ModalUP${i.id}">
                                                            <i style="font-size: 1.2rem" class="fas fa-heart"></i>
                                                        </button>
                                                    </a>
                                                </form>
         
                                                <a style="margin-top: 6px" href="#" title="Quick View" >
                                                    <button style="width: 0; height: 0; margin-top: -24px; margin-left: 3px" 
                                                            class="btn btn-sm view" type="submit" title="Quick view" 
                                                            id="show-emp-${u.user_id}" data-user-id="${u.user_id}" data-target="#ModalUP${u.user_id}">
                                                        <i style="font-size: 1.2rem" class="fa fa-eye"></i>
                                                    </button>
                                                </a>
                                                </li>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h4 class="product_name">
                                                <a href="#">${i.name}</a>
                                            </h4>

                                            <div class="price_box">
                                                <c:if test="${i.price != i.salePrice}">
                                                    <div class="box_current">
                                                        <span class="old_price">$${i.price}</span>
                                                    </div>                                                   
                                                </c:if>
                                                <div class="box_old">
                                                    <span class="current_price">$${i.salePrice}</span>
                                                </div>
                                                <div class="product-view__shipping">
                                                    <svg height="12" viewBox="0 0 20 12" width="20" class="shopee-svg-icon icon-free-shipping">
                                                    <g fill="none" fill-rule="evenodd" transform="">
                                                    <rect fill="#00bfa5" fill-rule="evenodd" height="9" rx="1" width="12" x="4"></rect>
                                                    <rect height="8" rx="1" stroke="#00bfa5" width="11" x="4.5" y=".5"></rect>
                                                    <rect fill="#00bfa5" fill-rule="evenodd" height="7" rx="1" width="7" x="13" y="2"></rect>
                                                    <rect height="6" rx="1" stroke="#00bfa5" width="6" x="13.5" y="2.5"></rect>
                                                    <circle cx="8" cy="10" fill="#00bfa5" r="2"></circle>
                                                    <circle cx="15" cy="10" fill="#00bfa5" r="2"></circle>
                                                    <path d="m6.7082481 6.7999878h-.7082481v-4.2275391h2.8488017v.5976563h-2.1405536v1.2978515h1.9603297v.5800782h-1.9603297zm2.6762505 0v-3.1904297h.6544972v.4892578h.0505892c.0980164-.3134765.4774351-.5419922.9264138-.5419922.0980165 0 .2276512.0087891.3003731.0263672v.6210938c-.053751-.0175782-.2624312-.038086-.3762568-.038086-.5122152 0-.8758247.3017578-.8758247.75v1.8837891zm3.608988-2.7158203c-.5027297 0-.8536919.328125-.8916338.8261719h1.7390022c-.0158092-.5009766-.3446386-.8261719-.8473684-.8261719zm.8442065 1.8544922h.6544972c-.1549293.571289-.7050863.9228515-1.49238.9228515-.9864885 0-1.5903965-.6269531-1.5903965-1.6464843 0-1.0195313.6165553-1.6669922 1.5872347-1.6669922.9580321 0 1.5366455.6064453 1.5366455 1.6083984v.2197266h-2.4314412v.0351562c.0221328.5595703.373095.9140625.9169284.9140625.4110369 0 .6924391-.1376953.8189119-.3867187zm2.6224996-1.8544922c-.5027297 0-.853692.328125-.8916339.8261719h1.7390022c-.0158091-.5009766-.3446386-.8261719-.8473683-.8261719zm.8442064 1.8544922h.6544972c-.1549293.571289-.7050863.9228515-1.49238.9228515-.9864885 0-1.5903965-.6269531-1.5903965-1.6464843 0-1.0195313.6165553-1.6669922 1.5872347-1.6669922.9580321 0 1.5366455.6064453 1.5366455 1.6083984v.2197266h-2.4314412v.0351562c.0221328.5595703.373095.9140625.9169284.9140625.4110369 0 .6924391-.1376953.8189119-.3867187z" fill="#fff"></path>
                                                    <path d="m .5 8.5h3.5v1h-3.5z" fill="#00bfa5"></path>
                                                    <path d="m0 10.15674h3.5v1h-3.5z" fill="#00bfa5"></path>
                                                    <circle cx="8" cy="10" fill="#047565" r="1"></circle>
                                                    <circle cx="15" cy="10" fill="#047565" r="1"></circle>
                                                    </g>
                                                    </svg>
                                                </div>
                                            </div>

                                            <div class="product_rating">
                                                <ul>
                                                    <c:set var="numstar" value="${i.starRating}"/>
                                                    <c:forEach begin="1" end="${numstar}" step="1">
                                                        <li>
                                                            <a href="#" style="color: orange">
                                                                <i class="fa fa-star"></i>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:if test="${numstar != 5}">
                                                        <c:forEach begin="${numstar + 1}" end="5" step="1">
                                                            <li>
                                                                <a href="#" style="color: black">
                                                                    <i class="fa fa-star"></i>
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="product-view__discount-badge">
                                            <span class="product-view__discount-badge-rate">${i.discount}%</span><span>Giảm</span>
                                        </div>
                                    </div>
                                </div>    
                            </c:forEach>

                            <c:forEach items="${productPage}" var="i">
                                <div class="modall hidee" id="ModalUP${i.id}">
                                    <div class="modal-showw">
                                        <div class="row">
                                            <div class="form-group col-md-5">
                                                <a href="#" class="primary_img">
                                                    <img src="${i.image[0]}"  alt="">
                                                </a>
                                            </div>
                                            <div class="form-group col-md-7">
                                                <i style="font-size: 1rem;display: flex;
                                                   font-size: 1.8rem;
                                                   text-align: left;
                                                   margin: 0 auto 0 0;
                                                   margin-left: 470px; cursor: pointer" class="fas fa-times"></i>
                                                <h4 class="product_name">
                                                    <a style="text-align: start" href="#">${i.name}</a>
                                                </h4>

                                                <div class="gap-price" style="display: flex; gap: 20px">
                                                    <c:if test="${i.price != i.salePrice}">
                                                        <div class="box_current">
                                                            <span style="font-size: 1.5rem" class="old_price">$${i.price}</span>
                                                        </div>                                                   
                                                    </c:if>
                                                    <div class="box_old">
                                                        <span style="font-size: 1.5rem" class="current_price">$${i.salePrice}</span>
                                                    </div>
                                                    <span style="font-size: 1rem;text-transform: uppercase; color: white; font-weight: bold; padding: 1px 3px; background-color: #F7472E; border-radius: 0.125rem; margin: auto; margin-right: 250px">
                                                        ${i.discount}%
                                                    </span>
                                                </div>

                                                <div class="status-gap">
                                                    <span style="display: flex; text-align: start">${i.describe}</span>
                                                </div>

                                                <form action="cart?action=view" method="POST">
                                                    <input type="hidden" name="product_id" value="${i.id}">
                                                    <div class="product_variant quantity" style="margin-top: 20px; display: flex; gap: 30px">
                                                        <label style="margin: auto">Quantity: </label>
                                                        <input style="width: 35%; padding: 10px 20px; border: 1px solid black" min="1" name="quantity" type="number">
                                                        <button style="padding: 10px 20px; color: white; background-color: #F6422D" class="button" 
                                                                type="submit">Thêm vào giỏ hàng</button>  
                                                    </div>
                                                </form>    
                                            </div>
                                        </div>                                    
                                    </div>
                                    </form>                
                                </div>
                            </c:forEach>


                        </div>


                        <c:set var="page" value="${requestScope.page}"/>
                        <div class="pagination">
                            <c:choose>
                                <c:when test="${page > 1}">
                                    <a style="cursor: pointer" href="HomeController?page=${page - 1}">
                                        <i class="fas fa-angle-left"></i>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a style="cursor: pointer" class="disabled">
                                        <i class="fas fa-angle-left"></i>
                                    </a>
                                </c:otherwise>
                            </c:choose>

                            <c:forEach begin="1" end="${requestScope.numberpage}" var="i">
                                <a class="${i == page ? 'active' : ''}" href="HomeController?page=${i}">${i}</a>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${page < requestScope.numberpage}">
                                    <a style="cursor: pointer" href="HomeController?page=${page + 1}">
                                        <i class="fas fa-angle-right"></i>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a style="cursor: pointer" class="disabled">
                                        <i class="fas fa-angle-right"></i>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp"/>

        <style>
            .modall {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 140%;
                background-color: rgba(0, 0, 0, 0.6);
                z-index: 100;               
            }

            .modal-showw{
                width: 900px;
                padding: 10px 10px;
                background-color: #fff;
                border-radius: 5px;
                max-height: 400px;
                overflow: hidden;
                position: relative;
                margin: 270px auto;
                padding: 20px;
                animation: showModal linear 0.2s;
                text-align: center;
                overflow-y: auto;
            }

            @keyframes showModal {
                from {
                    top: -200px;
                    opacity: 0;
                }
                to {
                    top: 0;
                    opacity: 1;
                }
            }

            .hidee {
                display: none;
            }

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            ul li {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .header_top_right {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                margin: 10px 50px 0 0;
            }

            .header_right_info ul{
                display: flex;
                gap: 7px;
            }

            .header_top_right .header_right_info > ul > li {
                margin-right: 11px;
            }

            .header_top_right .header_right_info > ul > li > a {
                color: #fff;
            }

            .mini_cart {
                position: absolute;
                min-width: 355px;
                padding: 0 28px;
                background: #fff;
                border: 0;
                z-index: 999;
                right: 0;
                top: 142%;
                max-height: 0;
                visibility: hidden;
                overflow: hidden;
                border: 1px solid #ebebeb;
                transition: 0.5s;
            }

            .mini_cart_wrapper:hover .mini_cart {
                max-height: 550px;
                padding: 20px 28px 33px;
                visibility: visible;
            }

            .fa-cog {
                color: white;
            }

            .mini_cart_table {
                padding: 23px 0;
            }

            .cart_total {
                display: flex;
                justify-content: space-between;
            }

            .cart_total span {
                font-size: 14px;
                font-weight: 400;
            }

            .cart_button:first-child {
                margin-bottom: 15px;
            }

            .cart_button a {
                text-transform: uppercase;
                border-radius: 3px;
                font-size: 14px;
                font-weight: 500;
                display: block;
                text-align: center;
                line-height: 20px;
                margin-bottom: 0;
                padding: 10px 0;
                color: #000000;
                border: 2px solid #000000;
                text-decoration: none;
            }

            .header_top_right .header_account > ul > li:last-child {
                margin-right: 0;
                padding-right: 0;
            }  

            .header_top_right .dropdown_links {
                right: -6px;
                left: auto;
            }

            .dropdown_links li a {
                text-transform: uppercase;
                display: block;
                font-size: 12px;
                white-space: nowrap;
                padding: 8px 8px 8px 20px;
                line-height: 20px;
                color: #000000;
                text-decoration: none;
            }

            .dropdown_links li a:hover {
                color: #F8492F;
            }

            .dropdown_links {
                position: absolute;
                background: #fff;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
                min-width: 130px;
                text-align: left;
                top: 110%;
                left: 0;
                -webkit-transition: all 0.5s ease-out;
                transition: all 0.5s ease-out;
                overflow: hidden;
                z-index: 9999;
                border-radius: 3px;
                visibility: hidden;
                max-height: 0;
            }

            .header_top_right .header_account > ul > li {
                position: relative;
                margin-right: 10px;
                padding-right: 10px;
            }

            .header_account > ul > li:hover ul.dropdown_links {
                visibility: visible;
                max-height: 200px;
            }

            .header_top_right .header_account {
                margin-right: 0;
                margin-left: 10px;
            }         

            .picture {
                display: flex;
                max-height: 200px;
            }

            .picture_load {
                margin: auto;
            }

            .picture_load img {
                margin-top: 40px;
                width: 140%;
            }

            .mySlides {display: none;}
            img {vertical-align: middle;}

            .slide {
                background-color: rgba(229, 231, 235, 0.5);
                max-height: 1000px;
            }

            .slideshow-container {
                max-width: 65rem;
                position: relative;
                margin: auto;
            }


            .mySlides img {
                height: 450px;
                margin-top: 30px;
                border-radius: 10px;
                box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            }

            .text {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 8px;
                width: 100%;
                text-align: center;
            }

            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            .dot {
                height: 0;
                width: 0;
                margin: 0 2px;
                background-color: #bbb;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            .active {
                background-color: #717171;
            }

            .the:hover {
                text-decoration: none;
            }

            .fade {
                animation-name: fade;
                animation-duration: 1.5s;
            }

            @keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }

            @media only screen and (max-width: 300px) {
                .text {font-size: 11px}
            }

            .header {
                padding-top: 0.5rem;
                background-color: #F8492F;
            }

            .container {
                max-width: 80rem;
                margin-left: auto;
                margin-right: auto;
                padding-left: 1rem;
                padding-right: 1rem;
            }

            .title {
                display: flex;
                justify-content: flex-end;
            }

            .title a {
                color: white;
                margin-left: 0.75rem;
                margin-right: 0.75rem;
                text-decoration: none;
                font-size: 1.3rem;
            }

            .title a:hover {
                color: #FDC7C1;
            }

            .content {
                display: flex;
                justify-content: space-around;
                padding-bottom: 1.5rem;
                align-items: center;
                gap: 40px;
            }

            .icon {
                display: flex;
            }

            .icon i {
                color: white;
                font-size: 4rem;
                text-align: center;
                margin-top: -15px;
            }

            .icon h2 {
                color: white;
                font-size: 2.5rem;
                margin-left: 10px;
            }

            form input{
                width: 100%;
                padding: 10px 10px;
                outline: none;
                border-radius: 2px;
                border: none;
            }

            form input[placeholder="Free Ship Đơn từ 0Đ"] {
                font-size: 1rem;
            }

            form button {
                border: none;
                padding: 8px 34px;
                background-color: #F8492F;
                cursor: pointer;
            }

            form button:hover {
                background-color: #F05E42;
            }

            form button i {
                color: white;
                font-size: 1.5rem;
            }

            .tt {
                padding: 0.25rem;
                width: 950px;
                display: flex;
                background-color: white;
            }

            .shop i {
                color: white;
                font-size: 2rem;
            }

            /*            .header-item {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                        }
            
                        .header-left {
                            display: flex;
                            gap: 5px;
                            align-items: center;
                            padding: 20px 0;             
                        }
            
                        .left-item {
                            padding: 0.4rem 0.85rem;
                            color: black;
                            text-transform: capitalize;
                        }
            
                        .left-item:hover {
                            text-decoration: none;
                            color: black;
                        }*/


            .header-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #DDE0E5;
                padding: 1rem 0;
            }
            .header-left {
                display: flex;
                align-items: center;
            }
            .header-left a {
                padding: 10px 25px;
                text-decoration: none;
                color: black;
                border: 1px solid #dcdcdc;
                margin-right: 5px;
                border-radius: 5px;
                cursor: pointer;
            }
            .header-left a:hover {
                background-color: #f0f0f0;
            }
            .header-left a.left-item {
                background-color: white;
            }
            .header-left a.left-item.active {
                background-color: #FA4F30;
                color: white;
            }
            /*            .header-left select {
                            padding: 10px;
                            border: 1px solid #dcdcdc;
                            border-radius: 5px;
                            margin-left: 5px;
                        }*/

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-toggle {
                cursor: pointer;
                padding: 10px;
                border: 1px solid #dcdcdc;
                border-radius: 5px;
            }

            .dropdown-menu {
                display: none;
                position: absolute;
                background-color: #ffffff;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-menu a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-menu a:hover {
                background-color: #ddd;
            }

            .show {
                display: block;
            }


            .paginationn {
                display: flex;
                align-items: center;
                margin-right:  10px;
            }

            .paginationn span {
                margin-right: 10px;
                color: black;
                color: black;

            }

            .paginationn a {
                padding: 5px 12px;
                border: 1px solid #eaeaea;
                color: black;
                color: black;
                background-color: white;
            }
            .paginationn a:hover {
                background-color: #f0f0f0;
                text-decoration: none;
            }


            .shop i:hover {
                cursor: pointer;
            }

            .container-content {
                display: grid;
                grid-template-columns: repeat(12, minmax(0, 1fr));
                gap: 6px;
                margin-top: 60px;
            }

            .center {
                background-color: rgba(229,231,235, 0.5);
                padding-bottom: 5rem;
                margin-top: -60px;
            }

            .body-btn {
                grid-column: span 3 / span 3;
                padding-top: 1.5rem;
                margin-top: 20px;
                padding-right: 2rem;
            }

            .container-content_item {
                grid-column: span 9 / span 9;
                padding-top: 1.5rem;
                margin-top: 20px;
            }

            .container-content_header li {
                list-style: none;
            }

            .li-header {
                display: flex;
                color: #F8492F;
                gap: 15px;
                border-bottom: 2px solid #d2d2d2;
                align-items: center;
            }

            .li-header i,
            .li-header p
            {
                margin: auto 0;
                font-size: 1.5rem;
                padding: 10px 0 15px 0;
                font-weight: bold;
                display: flex;
                align-items: center;
            }


            li {
                cursor: pointer;
                font-size: 1.5rem;
            }

            .li-list {
                margin-top: 15px;
            }       

            .li-list a {
                color: black;
                font-size: 1.3rem;
                margin-left: 0.75rem;
                text-decoration: none;
            }

            .li-list a:hover {
                color: #F7452E;
            }

            .item_icon {
                font-size: 1.5rem;
                display: flex;
                margin-top: 40px;
                gap: 15px;
                border-bottom: 2px solid #d2d2d2;
                color: #F8492F;
                align-items: center;
            }

            .single_product:hover .product_thumb a.secondary_img {
                opacity: 1;
                visibility: visible;
            }


            .product_thumb a.secondary_img {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                opacity: 0;
                visibility: hidden;
            }

            .product_thumb::before {
                background: rgba(0, 0, 0, 0.15);
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 100%;
                display: inline-block;
                content: "";
                z-index: 2;
                opacity: 0;
                pointer-events: none;
                transition: ease 0.3s all;
            }

            .item_icon p,
            .item_icon i
            {
                font-weight: bold;
                padding: 10px 0 15px 0;
                margin: auto 0;
            }

            h5 {
                font-size: 1.3rem;
                font-weight: normal;
                margin-top: 25px;
            }

            form {
                margin-top: 15px;
            }

            .form-search {
                display: flex;
                gap: 20px;
                margin-top: 15px;
            }

            .form-search input[type = "text"] {
                font-size: 1rem;
            }

            form input[type = "submit"] {
                margin-top: 30px;
                background-color: #F8492F;
                color: white;
                font-size: 1rem;
            }

            form input[type = "submit"]:hover {
                background-color: #E5715B;
                cursor: pointer;
            }

            .grade {
                margin-top: 40px;
                border-bottom: 2px solid #d2d2d2;
            }

            .select {
                margin-top: 25px;
            }

            .content-btn {
                display: grid;
                grid-template-columns: repeat(5, minmax(0, 1fr));
                gap: 0.75rem;
                margin-top: 20px;

            }

            .product_items {
                grid-column: span 1 / span 1;
                background-color: white;
            }

            .secondary_img_img img{
                max-width: 100%;
                height: auto;
                vertical-align: middle;
                border-style: none;
            }

            .primary_img img{
                max-width: 100%;
                height: auto;
                vertical-align: middle;
                border-style: none;
            }

            .product_thumb {
                position: relative;
            }           

            .action_links {
                transition: all 0.3s ease;
                position: absolute;
                left: 5px;
                top: 10px;
                opacity: 0;
                visibility: hidden;
                z-index: 9;
                flex-direction: column;
                display: flex;
                gap: 9px;
            }

            .action_links a {
                font-size: 1.2rem;
                padding: 8px 12px;
                border: 1px solid #F84B2F;
                transition: all 0.3s ease;
                transform: translateX(-60px);
            }

            .action_links a button i{
                display: flex;
                justify-content: center;
            }

            .action_links a:hover {
                background-color: black;
            }

            .single_product:hover .action_links {
                opacity: 1;
                visibility: visible;
            }
            .single_product:hover .action_links a {
                transform: translateX(0);
            }

            .action_links ul li {
                margin-bottom: 10px;
            }

            .action_links ul li:last-child {
                margin-bottom: 0;
            }
            .action_links i.fa.fa-shopping-cart  {
                color: #f6692a;
            }

            .action_links i.fas {
                color: #f6692a;
            }

            i.fa.fa-eye{
                color: #f6692a;
            }

            .action_links ul li a {
                line-height: 38px;
                width: 40px;
                height: 40px;
                text-align: center;
                font-size: 20px;
                border: 2px solid #f6692a;
                color: #000000;
                display: block;
                transition: all 0.3s ease;
                transform: translateX(-60px);
            }
            .action_links ul li a:hover {
                color: #f6692a;
                background: #000000;
            }

            .action_links ul li.wishlist a {
                transition: ease 0.5s all;
            }
            .action_links ul li.compare a {
                transition: ease 0.7s all;
            }
            .action_links ul li.quick_button a {
                transition: ease 0.9s all;
            }

            .action_links i.fas fa-heart {
                color: #f6692a;
            }

            .product_content {
                padding: 0.5rem;
            }

            .product_name {
                margin-bottom: 5px;
            }

            a, button, img, input, span {
                transition: all 0.3s ease 0s;
            }

            .single_product {
                position: relative;
            }

            .product_content h4 a {
                color: black;
                margin: 0;
                font-size: 1.2rem;
                font-weight: 300;
                overflow: hidden;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                text-align: start;
            }

            .product_name a {
                line-height: 15px;
                font-weight: 700;
                text-transform: capitalize;
                font-size: 1.2rem;
                color: black;
                line-height: inherit;
                text-decoration: none;
                cursor: pointer;
                overflow: hidden;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                text-align: center;
                margin-top: 5px;
            }

            .price_box {
                display: flex;    
                justify-content: flex-start;
                gap: 6px;
            }

            .box_current {
                text-decoration-line: line-through;
                margin: auto 0;
            }

            .old_price{
                font-size: 1.2rem;
                line-height: 1.25rem;
                display: flex;
                opacity: 0.5;
            }

            .current_price {
                font-size: 1.2rem;
                color: #F94F30;
                font-weight: 400;
                flex: 1;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

            .product_rating ul{
                display: flex;
                justify-content: flex-start;
                padding: 5px 0 0 0;
            }

            .product_rating ul li{
                font-size: 1rem;
            }

            .product-view__shipping {
                display: flex;
                margin: auto;
            }

            .product-view__discount-badge {
                position: absolute;
                top: 82%;
                right: 4%;
                width: 36px;
                height: 40px;
                padding: 4px 2px 3px;
                text-align: center;
                font-size: 0.75rem;
                line-height: 1.2rem;
                color: yellow;
                background-color: yellow;
            }

            .product-view__discount-badge:before {
                content: "";
                display: block;
                position: absolute;
                top: 100%;
                right: 0;
                border-width: 0 18px 4px 18px;
                border-style: solid;
                border-color: transparent currentColor transparent currentColor;
            }

            .product-view__discount-badge-rate {
                display: block;
                color: red;
                font-weight: bold;
            }

            .product-view__discount-badge span:last-child {
                color: black;
                opacity: 0.4;
                text-transform: uppercase;
                font-weight: bold;
            }

            .pagination {
                margin-top: 30px;
                display: flex;
                justify-content: center;
                text-align: center;
            }

            .pagination a {
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 10px;
                background-color: transparent;
                min-width: 40px;
                height: 35px;
                font-size: 1.4rem;
                color: rgba(0, 0, 0, 0.4);
                text-decoration: none;

            }

            .pagination a.active {
                background-color: #F6422D;
                color: white;

            }

            .pagination a:hover:not(.active) {
                color: #F6422D;
                text-decoration: none;
            }


        </style>

        <script>
            const viewButtons = document.querySelectorAll(".btn-sm.view");
            const modals = document.querySelectorAll(".modall");
            const iconCloseModals = document.querySelectorAll(".form-group i");

            function togglePrimaryModal(modal) {
                modal.classList.toggle("hidee");
            }

            viewButtons.forEach((button, index) => {
                button.addEventListener("click", () => {
                    togglePrimaryModal(modals[index]);
                });
            });

            iconCloseModals.forEach((icon, index) => {
                icon.addEventListener("click", () => {
                    togglePrimaryModal(modals[index]);
                });
            });

            modals.forEach((modal) => {
                modal.addEventListener("click", (e) => {
                    if (e.target == e.currentTarget) {
                        togglePrimaryModal(modal);
                    }
                });
            });

        </script>

        <script>
            let slideIndex = 0;
            showSlides();
            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 2000); // Change image every 2 seconds
            }

            function handleItemClick(event) {
                const clickedElement = event.target;
                if (clickedElement.classList.contains('left-item')) {
                    const itemId = clickedElement.getAttribute('data-id');
                    const items = document.querySelectorAll('.header-left .left-item');
                    items.forEach(item => item.classList.remove('active'));
                    clickedElement.classList.add('active');
                }
            }

            document.addEventListener('DOMContentLoaded', function () {
                var dropdown = document.querySelector('.dropdown');
                var button = dropdown.querySelector('.dropdown-toggle');
                var menu = dropdown.querySelector('.dropdown-menu');
                button.addEventListener('click', function () {
                    menu.classList.toggle('show');
                });
                window.addEventListener('click', function (event) {
                    if (!dropdown.contains(event.target)) {
                        menu.classList.remove('show');
                    }
                });
            });
//            function addToWishlist(productId) {
//                $.ajax({
//                    type: 'GET', // hoặc 'POST' tùy vào cấu hình servlet của bạn
//                    url: 'HomeController?action=addWishList&productId=' + productId,
//                    success: function (response) {
//                        // Cập nhật số lượng yêu thích
//                        var wishlistCount = parseInt($('.header_wishlist span').text());
//                        if (isNaN(wishlistCount)) {
//                            wishlistCount = 0;
//                        }
//                        wishlistCount++;
//                        $('.header_wishlist span').text(wishlistCount);
//                    },
//                    error: function () {
//                        console.error('Lỗi khi thêm vào danh sách yêu thích');
//                    }
//                });
//            }


            function addToWishlist(productId) {
                $.ajax({
                    type: 'GET', // Hoặc 'POST' tùy thuộc vào cấu hình servlet của bạn
                    url: 'HomeController?action=addWishList&productId=' + productId,
                    success: function (response) {
                        // Cập nhật số lượng yêu thích
                        var wishlistCount = parseInt($('#wishlistCount').text());
                        wishlistCount++;
                        $('#wishlistCount').text(wishlistCount);
                    },
                    error: function () {
                        console.error('Lỗi khi thêm vào danh sách yêu thích');
                    }
                });
            }


        </script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
