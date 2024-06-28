<%-- 
    Document   : productinsert
    Created on : Oct 19, 2021, 11:22:22 PM
    Author     : Khuong Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Thêm sản phẩm | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body class="app sidebar-mini rtl">
        <header class="app-header">        
        </header>
        <aside class="app-sidebar">
            <div style="margin-top: 40px; border-bottom: 1px solid black; width: 100%">
                <div  class="app-sidebar__user">
                    <img class="app-sidebar__user-avatar" src="../admin/images/boy.png" width="70px"
                         alt="User Image">
                    <div>
                        <p style="text-align: center; margin-top: 10px" class="app-sidebar__user-name"><b style="color: black">
                                Admin ${sessionScope.user.user_name}</b></p>
                    </div>
                </div>
            </div>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class="fas fa-tachometer-alt"></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item" href="customermanager"><i class="fas fa-users"></i><span
                            class="app-menu__label">Quản lý khách hàng</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i class="fas fa-tags"></i>
                        <span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="ordermanager"><i class="fas fa-box-open"></i><span
                            class="app-menu__label">Quản lý đơn hàng</span></a></li>

            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">                   
                    <ul style="list-style: none; text-align: end" class="app-nav">       
                        <li>
                            <a style="padding: 10px; margin-bottom: 20px" class="app-nav__item" href="HomeController">
                                <i style="font-size: 2.5rem; color: #2fcaf8;" class="fas fa-sign-in-alt"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="app-title">
                        <ul style="background-color: white" class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row editeer">
                <div class="col-md-12" >
                    <div class="tile" style="padding: 20px 0">
                        <h3 style="padding: 10px 20px; border-bottom: 1px solid #49933c;"sclass="tile-title">Tạo mới sản phẩm</h3>
                        <div class="tile-body">                       
                            <form class="row" action="productmanager?action=insertproduct" method="POST">
                                <div class="form-group col-md-4">
                                    <label for="exampleSelect1" class="control-label">Danh mục</label><br>
                                    <input style="border: none ;padding: 12px 10px; width: 495px; border-radius: 5px; background-color: #e9ecef;" name="id_name" type="text" placeholder="">
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tên sản phẩm</label>
                                    <input style="border: none ;padding: 12px 10px; width: 495px; border-radius: 5px; background-color: #e9ecef;" name="product_name" type="text">
                                </div>
                                <div class="form-group  col-md-4">
                                    <label class="control-label">Số lượng</label>
                                    <input style="border: none ;padding: 12px 10px; width: 495px; border-radius: 5px; background-color: #e9ecef;" name="quantity" type="number">
                                </div>
                                <div class="form-group  col-md-4">
                                    <label class="control-label">Giá bán</label>
                                    <input style="border: none ;padding: 12px 10px; width: 495px; border-radius: 5px; background-color: #e9ecef;" name="price" type="text">
                                </div>
                                <div class="form-group  col-md-4">
                                    <label class="control-label">Đánh giá</label>
                                    <input style="border: none ;padding: 12px 10px; width: 495px; border-radius: 5px; background-color: #e9ecef;" name="rate" type="text">
                                </div>                                                                                                            
                                <div class="form-group  col-md-4">
                                    <label class="control-label">Giảm giá</label>
                                    <input style="border: none ;padding: 12px 10px; width: 495px; border-radius: 5px; background-color: #e9ecef;" name="discount" type="text">
                                </div>                             
                                <div style="margin-top: 10px; text-align: start; margin-left: 20px">
                                    <label class="">Ảnh sản phẩm</label>
                                    <div id="myfileupload">
                                        <input type="file" id="uploadfile" multiple name="image" onchange="previewImage(event)"/>
                                    </div>
                                </div>
                                <div class="form-group col-md-12" style="margin-top: 10px">
                                    <label class="control-label">Mô tả sản phẩm</label>
                                    <textarea class="form-control" name="describe" id="describe"></textarea>
                                </div>
                                <div style="padding: 0 18px">
                                    <button class="btn btn-save" type="submit" onclick="return confirmSave()">Lưu lại</button>
                                    <a class="btn btn-cancel" data-dismiss="modal" href="productmanager">Hủy bỏ</a>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>

        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
            }
            a:hover {
                text-decoration: none;
            }
            .btn-save {
                padding: 10px 20px;
                text-align: center;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                display: inline-block;
                margin: 5px 0;
                background-color: #28a745;
                color: white;
            }

            .btn-cancel {
                height: 45px;
                padding: 10px 20px;
                text-align: center;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                display: inline-block;
                margin: 5px 0 0 30px;
                background-color: #dc3545;
                color: white;
            }

            span h5 {
                font-size: 1.2rem;
                font-weight: bold;
                border-bottom: 1px solid black;
                padding-bottom: 10px;
            }

            label {
                text-align: start;
                font-size: 1rem;
            }

            .mon {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            .modall {
                position: absolute;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background-color: rgba(0, 0, 0, 0.6);
            }

            .modal-showw{
                width: 600px;
                background-color: #fff;
                border-radius: 5px;
                overflow: hidden;
                position: relative;
                margin: 150px auto;
                padding: 20px;
                animation: showModal linear 0.2s;
                text-align: center;
            }

            .editeer {
                box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; 
            }

            .title {
                padding: 20px;
            }
            .app-sidebar {
                width: 250px;
                background-color: #2fcaf8;
                color: white;
                height: 100vh;
                position: fixed;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 30px 6px;
            }

            .app-sidebar__user {
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
            }

            .app-sidebar__user-avatar {
                border-radius: 50%;
                margin-right: 10px;
            }

            .app-menu {
                width: 100%;
                list-style: none;
                padding: 0;
                margin-top: 20px;
                flex-grow: 1;
            }

            .row {
                margin: 0;
            }

            .app-menu__item {
                width: 100%;
                padding: 20px 30px;
                color: black;
                text-decoration: none;
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .app-menu__item:hover {
                background-color: #00baff;
                color: black;
                text-decoration: none;
            }

            .app-menu__icon {
                margin-right: 10px;
            }

            .app-content {
                margin-left: 250px;
                padding: 20px;
                width: calc(100% - 250px);
            }

            .app-title {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                padding: 0 10px;
                font-size: 1rem;
            }

            .breadcrumb {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
            }

            .breadcrumb-item {
                margin-right: 10px;
            }

            .breadcrumb-item a {
                text-decoration: none;
                color: #333;
            }

            .widget-small {
                display: flex;
                background: #fff;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                align-items: center;
            }

            .widget-small .info {
                margin-left: 10px;
            }

            .widget-small i {
                font-size: 40px;
            }

            .widget-small.primary {
                border-left: 4px solid #007bff;
            }

            .widget-small.info {
                border-left: 4px solid red;
            }

            .widget-small.warning {
                border-left: 4px solid greenyellow;
            }

            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }

            .table th, .table td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }

            .table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }

            .table-bordered {
                border: 1px solid #dee2e6;
            }

            .table-bordered th, .table-bordered td {
                border: 1px solid #dee2e6;
            }

            .table-hover tbody tr:hover {
                background-color: rgba(0, 0, 0, 0.075);
            }

            .badge {
                padding: 5px 10px;
                color: white;
                border-radius: 5px;
            }

            .app-title {
                display: block;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                -webkit-box-pack: justify;
                -ms-flex-pack: justify;
                justify-content: space-between;
                -webkit-box-orient: horizontal;
                -webkit-box-direction: normal;
                -ms-flex-direction: row;
                flex-direction: row;
                background-color: #FFF;
                border-radius: .375rem;
                padding: 10px 30px;
                -webkit-box-shadow: 0 1px 2px rgb(0 0 0 / 10%);
                box-shadow: 0 1px 2px rgb(0 0 0 / 10%);
                border-left: 6px solid #FFD43B;
                margin-bottom: 20px;
            }

            a:hover {
                color: black;
            }

            .app {
                padding: 0;
                margin: 0;
            }

            .app-nav__item {
                display: block;
                padding: 15px;
                line-height: 0px;
                color: rgb(0, 28, 64);
            }

            .hidee {
                display: none;
            }

            .modal-backdrop{
                width: 0;
            }

        </style>
        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('preview');
                    output.src = reader.result;
                    output.style.display = 'block';
                };
                reader.readAsDataURL(event.target.files[0]);
            }

            function confirmSave() {
                return confirm("Bạn có chắc chắn muốn lưu sản phẩm này ?");
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>
