
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body onload="time()" class="app sidebar-mini rtl modal-open">      
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div style="margin-top: 40px; border-bottom: 1px solid black; width: 100%">
                <div  class="app-sidebar__user">
                    <img class="app-sidebar__user-avatar" src="../admin/images/boy.png" width="50px"
                         alt="User Image">
                    <div>
                        <p style="text-align: center; margin-top: 10px" class="app-sidebar__user-name"><b style="color: black">Admin ${sessionScope.user.user_name}</b></p>
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
                            <a style="padding: 10px; margin-bottom: 20px; background-color: rgb(255, 212, 59)" class="app-nav__item" href="HomeController">
                                <i style="font-size: 2.5rem; color: #2fcaf8;" class="fas fa-sign-in-alt"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="app-title">
                        <ul style="background-color: white" class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><b>Danh sách người dùng</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID khách hàng</th>
                                        <th>Tên khách hàng</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>isAdmin</th>
                                        <th style="width: 30px">Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${user}" var="u">
                                        <tr>
                                            <td>${u.user_id}</td>
                                            <td>${u.user_name}</td>
                                            <td>${u.user_email}</td>
                                            <td>${u.user_pass}</td>
                                            <td>${u.isAdmin}</td>
                                            <td style="display: flex; gap: 40px; justify-content: center">
                                                <button class="btn btn-primary btn-sm edit" title="Sửa" id="show-emp-${u.user_id}" data-user-id="${u.user_id}" data-target="#ModalUP${u.user_id}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-primary btn-sm update" title="Update" id="show-emp-${u.user_id}" data-user-id="${u.user_id}" data-target="#ModalUP${u.user_id}">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                                <!--<form method="POST" action="customermanager?action=delete">-->  
                                                <form action="customermanager?action=delete" method="POST">
                                                    <input hidden name="user_id" value="${u.user_id}">
                                                    <button class="btn btn-primary btn-sm delete" type="submit" title="Delete" id="show-emp-${u.user_id}" data-user-id="${u.user_id}" data-target="#ModalUP${u.user_id}" onclick="return confirmDelete()">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
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
        <c:forEach items="${user}" var="u">           
            <div class="modall hidee" id="ModalUP${u.user_id}">
                <form method="POST" action="customermanager?action=update">
                    <div class="modal-showw">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <span style="text-align: center" class="thong-tin-thanh-toan">
                                    <h5>Thêm Làm quản trị viên</h5>
                                </span>
                            </div>
                        </div>
                        <div class="row" style="justify-content: center">
                            <div class="form-group col-md-6">
                                <label for="exampleSelect1" class="control-label">Quyền quản trị</label>
                                <input hidden name="user_id" value="${u.user_id}">
                                <select name="permission" class="form-control" id="exampleSelect1">
                                    <option value="True">Cho phép</option>
                                    <option value="False">Hủy bỏ</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <button style="margin-right: 15px" class="btn btn-save" type="submit" onclick="return confirmUpdate()">Lưu lại</button>
                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                        <br>
                    </div>
                </form>                
            </div>
        </c:forEach>

        <c:forEach items="${user}" var="u">           
            <div class="modalll hideee" id="ModalUP${u.user_id}">
                <form method="POST" action="customermanager?action=updateall">
                    <div class="modal-showww">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <span style="text-align: center" class="thong-tin-thanh-toan">
                                    <h5>Chỉnh sửa thông tin khách hàng</h5>
                                </span>
                            </div>
                        </div>
                        <div class="main-new" style="width: 100%; margin: 15px 0">
                            <div class="mon">
                                <input hidden name="user_id" value="${u.user_id}">
                                <div class="mon-gap">
                                    <label class="control-label">Name</label>
                                    <input  style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="user_name" value="${u.user_name}"/>   
                                </div>
                                <div class="mon-gap">
                                    <label class="control-label">Email</label>
                                    <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="user_email" value="${u.user_email}"/>
                                </div>
                                <div class="mon-gap">
                                    <label class="control-label">Password</label>
                                    <input style="padding: 12px 10px; width: 270px; border-radius: 5px; background-color: #e9ecef;" type="text" name="user_pass" value="${u.user_pass}"/>   
                                </div>
                            </div>
                        </div>
                        <br>
                        <button style="margin-right: 15px" class="btn btn-save" type="submit"  onclick="return confirmUpdatee()">Lưu lại</button>
                        <a class="btn btn-cancell" data-dismiss="modal" href="#">Hủy bỏ</a>
                        <br>
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
                height: 100vh;
            }
            .mon {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            a:hover {
                text-decoration: none;
            }
            .thong-tin-thanh-toan h5 {
                text-align: center;
            }

            .control-label {
                text-align: start;
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
                text-align: center;
                margin: auto;
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                width: 300px;
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

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
                color: white;
            }                  

            .modall {
                position: absolute;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background-color: rgba(0, 0, 0, 0.6);
            }

            .modalll {
                position: absolute;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background-color: rgba(0, 0, 0, 0.6);
            }

            .modal-showw{
                width: 450px;
                background-color: #fff;
                border-radius: 5px;
                overflow: hidden;
                position: relative;
                margin: 380px auto;
                padding: 20px;
                animation: showModal linear 0.2s;
                text-align: center;
            }

            .modal-showww{
                width: 600px;
                background-color: #fff;
                border-radius: 5px;
                overflow: hidden;
                position: relative;
                margin: 380px auto;
                padding: 20px;
                animation: showModal linear 0.2s;
                text-align: center;
            }

            h5 {
                font-size: 18px;
                margin: 0;
                padding-bottom: 15px;
                border-bottom: 1px solid #ddd;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label.control-label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .form-control {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .btn {
                padding: 10px 20px;
                text-align: center;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                display: inline-block;
                margin: 5px 0;
            }

            .btn-save {
                background-color: #28a745;
                color: white;
            }

            .btn-cancel {
                background-color: #dc3545;
                color: white;
                text-decoration: none;
            }

            .btn:hover {
                opacity: 0.9;
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

            .hideee {
                display: none;
            }

            .app {
                padding: 0;
                margin: 0;
            }

            .btn-cancell {
                background-color: #dc3545;
                color: white;
                text-decoration: none;
            }

            th{
                text-align: center;
                background-color: rgba(0, 0, 0, 0.075);
            }
        </style>      
        <script>
            const editButtons = document.querySelectorAll(".btn-primary.edit");
            const updateButtons = document.querySelectorAll(".btn-primary.update");
            const modals = document.querySelectorAll(".modall");
            const modalls = document.querySelectorAll(".modalll");
            const cancelButtonsPrimary = document.querySelectorAll(".btn-cancel");
            const cancelButtonsSecondary = document.querySelectorAll(".btn-cancell");

            function togglePrimaryModal(modal) {
                modal.classList.toggle("hidee");
            }

            function toggleSecondaryModal(modall) {
                modall.classList.toggle("hideee");
            }

            editButtons.forEach((button, index) => {
                button.addEventListener("click", () => {
                    togglePrimaryModal(modals[index]);
                });
            });

            updateButtons.forEach((button, index) => {
                button.addEventListener("click", () => {
                    toggleSecondaryModal(modalls[index]);
                });
            });

            cancelButtonsPrimary.forEach((button, index) => {
                button.addEventListener("click", () => {
                    togglePrimaryModal(modals[index]);
                });
            });

            cancelButtonsSecondary.forEach((button, index) => {
                button.addEventListener("click", () => {
                    toggleSecondaryModal(modalls[index]);
                });
            });

            modals.forEach((modal) => {
                modal.addEventListener("click", (e) => {
                    if (e.target == e.currentTarget) {
                        togglePrimaryModal(modal);
                    }
                });
            });

            modalls.forEach((modall) => {
                modall.addEventListener("click", (e) => {
                    if (e.target == e.currentTarget) {
                        toggleSecondaryModal(modall);
                    }
                });
            });
            
            function confirmUpdate() {
                return confirm("Bạn có chắc chắn muốn thay đổi quyền của người dùng này?");
            }
            
            function confirmUpdatee() {
                return confirm("Bạn có chắc chắn muốn cập nhật thông tin người dùng này?");
            }
            
            function confirmDelete() {
                return confirm("Bạn có chắc chắn muốn xóa người dùng này?");
            }

        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>
