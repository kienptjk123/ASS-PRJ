<%-- 
    Document   : menu
    Created on : Jun 21, 2024, 11:23:53 PM
    Author     : adm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!--    area header start-->
<div class="header">
    <div class="container">                           
        <ul style="padding-top: 0.5rem; display: flex; 
            justify-content: flex-end; padding-bottom: 0.5rem">
            <c:if test="${sessionScope.user != null}">
                <ul class="top_links">
                    <li>
                        <a href="#">Xin chào ${sessionScope.user.user_name}</a>
                        <div class="dropdown-menuu">
                            <c:if test="${sessionScope.user.user_name != null}">
                                <a href="user?action=myaccount">Tài khoản của tôi</a>
                                <div class="divider"></div>
                            </c:if>
                            <c:if test="${fn: toUpperCase(sessionScope.user.isAdmin) == 'TRUE'}">
                                <a href="dashboard">Quản lý</a>
                                <div class="divider"></div>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <a href="user?action=logout">Đăng xuất</a>
                            </c:if>
                        </div>
                    </li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <li style=" text-transform: capitalize; 
                    color: white; font-weight: 600; font-size: 1.2rem; margin: auto 0.75rem auto 0" class="top_links"><a style="color: white" href="user?action=login">Đăng nhập<i class="ion-chevron-down"></i></a>
                <li style="width: 1px; height: 1.6rem; background-color: #FA8F82; margin-top: 0.4rem"></li>
                <li style="margin: auto 0">
                    <a style="margin: 0 0.75rem; text-transform: capitalize; 
                       color: white; font-weight: 600; font-size: 1.2rem" href="./../register.jsp">Đăng kí</a>
                </li>    
            </c:if>          
        </ul>

        <div class="content">
            <div class="icon">
                <a style="display: flex" class="the" href="HomeController?action=search">
                    <i class="fa fa-shopping-bag"></i>
                    <h2>Shopping</h2>
                </a>
            </div>
            <form action="HomeController?action=searchName" method="POST">
                <div class="tt">
                    <input type="text" name="searchName" placeholder="Free Ship Đơn từ 0Đ"/>
                    <button class="search" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </form>       
            <a href="cart?action=showcart" style="position: relative; margin: auto">
                <i style="font-size: 2rem; color: white; margin: auto" class="fa fa-shopping-cart">
                    <span style="position: absolute;
                          top: -12px;
                          right: -15px;
                          background: white;
                          color: black;
                          border-radius: 50%;
                          padding: 2px 6px;
                          font-size: 1.2rem;
                          line-height: 1;" class="cart-count">${sessionScope.size}</span>
                </i>
            </a>   
            <a href="wishlist?action=showcartt" style="position: relative; margin: auto">
                <i style="font-size: 2rem; color: white; margin: auto" class="far fa-heart">
                    <span style="position: absolute;
                          top: -12px;
                          right: -15px;
                          background: white;
                          color: black;
                          border-radius: 50%;
                          padding: 2px 6px;
                          font-size: 1.2rem;
                          line-height: 1;" class="cart-count">${sessionScope.sizee}</span>
                </i>
            </a>
        </div>
    </div>

</div>


<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    a:hover {
        text-decoration: none;
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
        gap: 15px;
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
        text-decoration: none;
    }

    .icon i:hover {
        text-decoration: none;
    }

    .icon h2 {
        color: white;
        font-size: 2.5rem;
        margin-left: 10px;
        text-decoration: none;
    }

    .icon h2:hover {
        text-decoration: none;
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

    .top_links {
        list-style: none;
        position: relative;
        display: inline-block;
    }

    .top_links > li {
        position: relative;
    }

    .top_links > li > a {
        text-decoration: none;
        color: white;
        padding: 10px 15px;
        display: block;
        font-size: 1.3rem;
    }

    .dropdown-menuu a:hover {
        color: #F84A2F;
        background-color: #FFFFFF;
    }

    .dropdown-menuu {
        display: none;
        position: absolute;
        top: 95%;
        left: 80px;
        background-color: white;
        border: 1px solid #ccc;
        box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        min-width: 160px;
        z-index: 1000;
    }

    .dropdown-menuu a {
        color: black;
        padding: 10px 15px;
        text-decoration: none;
        display: block;
        font-size: 1rem;
    }



    .top_links > li:hover .dropdown-menuu {
        display: block;
    }

    .dropdown-menuu .divider {
        height: 1px;
        margin: 5px 0;
        overflow: hidden;
        background-color: #e5e5e5;
    }
</style>