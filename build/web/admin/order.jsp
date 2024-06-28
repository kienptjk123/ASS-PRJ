
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách đơn hàng</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">

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
                            <li class="breadcrumb-item"><a href="#"><b>Danh sách đơn hàng</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">                          
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID đơn hàng</th>
                                        <th>Khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày mua</th>
                                        <th>Tổng tiền</th>
                                        <th>Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${bill}" var="b">
                                        <tr>
                                            <td>${b.bill_id}</td>
                                            <td>${b.user.user_name}</td>
                                            <td>(+84)${b.phone}</td>
                                            <td>${b.address}</td>
                                            <td>${b.date}</td>
                                            <td>${b.total}</td>
                                            <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="ordermanager?action=showdetail&bill_id=${b.bill_id}"><i class="fa"></i>Chi tiết đơn hàng</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
                background: rgb(255, 212, 59);
            }

            th{
                text-align: center;
                background-color: rgba(0, 0, 0, 0.075);
            }

        </style>           
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <script src="admin/js/plugins/pace.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">
        $('#sampleTable').DataTable();
        //Thời Gian
        function time() {
            var today = new Date();
            var weekday = new Array(7);
            weekday[0] = "Chủ Nhật";
            weekday[1] = "Thứ Hai";
            weekday[2] = "Thứ Ba";
            weekday[3] = "Thứ Tư";
            weekday[4] = "Thứ Năm";
            weekday[5] = "Thứ Sáu";
            weekday[6] = "Thứ Bảy";
            var day = weekday[today.getDay()];
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            nowTime = h + " giờ " + m + " phút " + s + " giây";
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
            tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                    '</span>';
            document.getElementById("clock").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }
        }
        </script>
        <script>

            $(document).ready(jQuery(function () {
                jQuery(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    window.location = "productmanager?action=deleteproduct&product_id=" + $(this).attr("value");
                                    swal("Đã xóa thành công.!", {
                                    });
                                }
                            });
                });
            }));
        </script>
        <script>
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
