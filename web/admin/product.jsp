
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách sản phẩm </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">

        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
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
                            <li class="breadcrumb-item"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div style="padding: 5px 10px;
                                     background-color: #9df99d;
                                     margin-left: 14px;
                                     margin-bottom: 20px; border-radius: 5px" class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="productmanager?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>                            
                            </div>
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th style="width: 100px">Mã sản phẩm</th>
                                        <th>Danh mục</th>
                                        <th style="width: 200px">Tên sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Giảm giá</th>
                                        <th style="width: 500px">Thông tin</th>
                                        <th>Số lượng</th>
                                        <th>Ảnh</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ProductData}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.id_name}</td>
                                            <td>${p.name}</td>
                                            <td>${p.price}</td>  
                                            <td>${p.discount}%</td>
                                            <td>${p.describe}</td>
                                            <td>${p.quantity}</td>
                                            <td><img src="${p.image[0]}" alt="" width="100px;"></td>

                                            <td style="display: flex; justify-content: space-between">                                               
                                                <form action="productmanager?action=deleteproduct" method="POST">
                                                    <input hidden name="id" value="${p.id}">
                                                    <button style="background-color: orange" class="btn btn-primary btn-sm trash" type="submit" title="Xóa" value="${p.id}" onclick="return confirmDelete()">
                                                            <i style="color: white ;font-size: 1.2rem" class="fas fa-trash-alt"></i>
                                                    </button>
                                                </form>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" 
                                                        id="show-emp" data-toggle="modal" data-target="#ModalUP${p.id}"><i style="font-size: 1.2rem" class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>  
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <c:forEach items="${ProductData}" var="p">
            <div class="modall hidee" id="ModalUP${p.id}">
                <form action="productmanager?action=updateproduct" method="POST">
                    <div class="modal-showw">
                        <div class="">
                            <div class="">
                                <span class="">
                                    <h5>Chỉnh sửa thông tin sản phẩm</h5>
                                </span>
                            </div>
                        </div>
                        <div class="mon">
                            <input hidden name="id" value="${p.id}">
                            <div class="mon-gap">
                                <label class="">Danh mục</label><br>
                                <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="id_name" value="${p.id_name}">

                            </div>
                            <div class="mon-gap">
                                <label class="">Tên sản phẩm</label><br>
                                <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="name" value="${p.name}">
                            </div>
                            <div class="mon-gap">
                                <label class="">Giá</label><br>
                                <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="number" name="price" required value="${p.price}">
                            </div> 
                            <div class="mon-gap">
                                <label class="">Discount</label><br>
                                <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="discount" required value="${p.discount}">
                            </div>  
                            <div class="mon-gap">
                                <label class="l">Thông tin</label><br>
                                <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="describe" value="${p.describe}">
                            </div>
                            <div class="mon-gap">
                                <label class="">Số lượng</label><br>
                                <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="quantity" value="${p.quantity}">
                            </div>
                        </div>

                        <div class="" style="margin-top: 10px; text-align: start">
                            <label class="">Ảnh sản phẩm</label>
                            <div id="myfileupload">
                                <input type="file" id="uploadfile" multiple name="image" value="${p.image[0]}" onchange="previewImage(event)"/>
                            </div>                               
                        </div>
                        <button class="btn btn-save" type="submit" onclick="return confirmUpdate()">Lưu lại</button>
                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                    </div>
                </form>
            </div>
        </c:forEach>

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
                padding: 10px 20px;
                text-align: center;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                display: inline-block;
                margin: 0px 30px;
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

            th{
                text-align: center;
                background-color: rgba(0, 0, 0, 0.075);
            }

        </style>
        <script>
            const editButtons = document.querySelectorAll(".btn-primary.edit");
            const cancelButtonsPrimary = document.querySelectorAll(".btn-cancel");
            const modals = document.querySelectorAll(".modall");

            function toggle(modal) {
                modal.classList.toggle("hidee");
            }

            editButtons.forEach((button, index) => {
                button.addEventListener("click", () => {
                    toggle(modals[index]);
                });
            });

            cancelButtonsPrimary.forEach((button, index) => {
                button.addEventListener("click", () => {
                    toggle(modals[index]);
                });
            });

            modals.forEach((modal) => {
                modal.addEventListener("click", (e) => {
                    if (e.target == e.currentTarget) {
                        toggle(modal);
                    }
                });
            });

            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('preview');
                    output.src = reader.result;
                    output.style.display = 'block';
                };
                reader.readAsDataURL(event.target.files[0]);
            }

            function confirmDelete() {
                return confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
            }
            
            function confirmUpdate() {
                return confirm("Bạn có chắc chắn muốn sửa sản phẩm này?");
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>