package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class orderdetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>Chi tiết đơn hàng</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"admin/css/main.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body onload=\"time()\" class=\"app sidebar-mini rtl\">\n");
      out.write("        <!-- Navbar-->\n");
      out.write("\n");
      out.write("        <aside class=\"app-sidebar\">\n");
      out.write("            <div style=\"margin-top: 40px; border-bottom: 1px solid black\">\n");
      out.write("                <div  class=\"app-sidebar__user\">\n");
      out.write("                    <img class=\"app-sidebar__user-avatar\" src=\"../admin/images/boy.png\" width=\"50px\"\n");
      out.write("                         alt=\"User Image\">\n");
      out.write("                    <div>\n");
      out.write("                        <p style=\"text-align: center; margin-top: 10px\" class=\"app-sidebar__user-name\"><b style=\"color: black\">Admin ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.user.user_name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</b></p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"app-menu\">\n");
      out.write("                <li><a class=\"app-menu__item\" href=\"dashboard\"><i class=\"fas fa-tachometer-alt\"></i><span\n");
      out.write("                            class=\"app-menu__label\">Bảng điều khiển</span></a></li>\n");
      out.write("                <li><a class=\"app-menu__item\" href=\"customermanager\"><i class=\"fas fa-users\"></i><span\n");
      out.write("                            class=\"app-menu__label\">Quản lý khách hàng</span></a></li>\n");
      out.write("                <li><a class=\"app-menu__item\" href=\"productmanager\"><i class=\"fas fa-tags\"></i>\n");
      out.write("                        <span class=\"app-menu__label\">Quản lý sản phẩm</span></a>\n");
      out.write("                </li>\n");
      out.write("                <li><a class=\"app-menu__item\" href=\"ordermanager\"><i class=\"fas fa-box-open\"></i><span\n");
      out.write("                            class=\"app-menu__label\">Quản lý đơn hàng</span></a></li>\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </aside>\n");
      out.write("        <main class=\"app-content\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">                   \n");
      out.write("                    <ul style=\"list-style: none; text-align: end\" class=\"app-nav\">       \n");
      out.write("                        <li>\n");
      out.write("                            <a style=\"padding: 10px; margin-bottom: 20px; background-color: rgb(255, 212, 59)\" class=\"app-nav__item\" href=\"HomeController\">\n");
      out.write("                                <i style=\"font-size: 2.5rem; color: #2fcaf8;\" class=\"fas fa-sign-in-alt\"></i>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <div class=\"app-title\">\n");
      out.write("                        <ul style=\"background-color: white\" class=\"app-breadcrumb breadcrumb\">\n");
      out.write("                            <li class=\"breadcrumb-item\"><a href=\"#\"><b>Chi tiết đơn hàng</b></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        <div id=\"clock\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <div class=\"tile\">\n");
      out.write("                        <div class=\"tile-body\">\n");
      out.write("                            <table class=\"table table-hover table-bordered\" id=\"sampleTable\">\n");
      out.write("                                <thead>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <th>Ảnh</th>\n");
      out.write("                                        <th>Mã sản phẩm</th>\n");
      out.write("                                        <th>Tên sản phẩm</th>\n");
      out.write("                                        <th>Số lượng</th>\n");
      out.write("                                        <th>Đơn giá</th>\n");
      out.write("                                    </tr>\n");
      out.write("                                </thead>\n");
      out.write("                                <tbody>\n");
      out.write("                                    ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                font-family: 'Arial', sans-serif;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                display: flex;\n");
      out.write("            }\n");
      out.write("            a:hover {\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-sidebar {\n");
      out.write("                width: 250px;\n");
      out.write("                background-color: #2fcaf8;\n");
      out.write("                color: white;\n");
      out.write("                height: 100vh;\n");
      out.write("                position: fixed;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                align-items: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-sidebar__user {\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                flex-direction: column;\n");
      out.write("                justify-content: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-sidebar__user-avatar {\n");
      out.write("                border-radius: 50%;\n");
      out.write("                margin-right: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-menu {\n");
      out.write("                width: 100%;\n");
      out.write("                list-style: none;\n");
      out.write("                padding: 0;\n");
      out.write("                margin-top: 20px;\n");
      out.write("                flex-grow: 1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-menu__item {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 20px 30px;\n");
      out.write("                color: black;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                gap: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-menu__item:hover {\n");
      out.write("                background-color: #00baff;\n");
      out.write("                color: black;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-menu__icon {\n");
      out.write("                margin-right: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-content {\n");
      out.write("                margin-left: 250px;\n");
      out.write("                padding: 20px;\n");
      out.write("                width: calc(100% - 250px);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-title {\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: space-between;\n");
      out.write("                align-items: center;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .breadcrumb {\n");
      out.write("                list-style: none;\n");
      out.write("                padding: 0;\n");
      out.write("                margin: 0;\n");
      out.write("                display: flex;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .breadcrumb-item {\n");
      out.write("                margin-right: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .breadcrumb-item a {\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: #333;\n");
      out.write("            }        \n");
      out.write("\n");
      out.write("            .table {\n");
      out.write("                width: 100%;\n");
      out.write("                margin-bottom: 1rem;\n");
      out.write("                color: #212529;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table th, .table td {\n");
      out.write("                padding: 0.75rem;\n");
      out.write("                vertical-align: top;\n");
      out.write("                border-top: 1px solid #dee2e6;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table thead th {\n");
      out.write("                vertical-align: bottom;\n");
      out.write("                border-bottom: 2px solid #dee2e6;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table tbody + tbody {\n");
      out.write("                border-top: 2px solid #dee2e6;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-bordered {\n");
      out.write("                border: 1px solid #dee2e6;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-bordered th, .table-bordered td {\n");
      out.write("                border: 1px solid #dee2e6;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-hover tbody tr:hover {\n");
      out.write("                background-color: rgba(0, 0, 0, 0.075);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-title {\n");
      out.write("                display: block;\n");
      out.write("                display: -ms-flexbox;\n");
      out.write("                display: flex;\n");
      out.write("                -webkit-box-align: center;\n");
      out.write("                -ms-flex-align: center;\n");
      out.write("                align-items: center;\n");
      out.write("                -webkit-box-pack: justify;\n");
      out.write("                -ms-flex-pack: justify;\n");
      out.write("                justify-content: space-between;\n");
      out.write("                -webkit-box-orient: horizontal;\n");
      out.write("                -webkit-box-direction: normal;\n");
      out.write("                -ms-flex-direction: row;\n");
      out.write("                flex-direction: row;\n");
      out.write("                background-color: #FFF;\n");
      out.write("                border-radius: .375rem;\n");
      out.write("                padding: 10px 30px;\n");
      out.write("                -webkit-box-shadow: 0 1px 2px rgb(0 0 0 / 10%);\n");
      out.write("                box-shadow: 0 1px 2px rgb(0 0 0 / 10%);\n");
      out.write("                border-left: 6px solid #FFD43B;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a:hover {\n");
      out.write("                color: black;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app {\n");
      out.write("                padding: 0;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-nav__item {\n");
      out.write("                display: block;\n");
      out.write("                padding: 15px;\n");
      out.write("                line-height: 0px;\n");
      out.write("                color: rgb(0, 28, 64);\n");
      out.write("                background: rgb(255, 212, 59);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style> \n");
      out.write("        <script src=\"admin/js/jquery-3.2.1.min.js\"></script>\n");
      out.write("        <script src=\"admin/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"admin/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"admin/js/main.js\"></script>\n");
      out.write("        <script src=\"admin/js/plugins/pace.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"admin/js/plugins/jquery.dataTables.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"admin/js/plugins/dataTables.bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("        $('#sampleTable').DataTable();\n");
      out.write("        //Thời Gian\n");
      out.write("        function time() {\n");
      out.write("            var today = new Date();\n");
      out.write("            var weekday = new Array(7);\n");
      out.write("            weekday[0] = \"Chủ Nhật\";\n");
      out.write("            weekday[1] = \"Thứ Hai\";\n");
      out.write("            weekday[2] = \"Thứ Ba\";\n");
      out.write("            weekday[3] = \"Thứ Tư\";\n");
      out.write("            weekday[4] = \"Thứ Năm\";\n");
      out.write("            weekday[5] = \"Thứ Sáu\";\n");
      out.write("            weekday[6] = \"Thứ Bảy\";\n");
      out.write("            var day = weekday[today.getDay()];\n");
      out.write("            var dd = today.getDate();\n");
      out.write("            var mm = today.getMonth() + 1;\n");
      out.write("            var yyyy = today.getFullYear();\n");
      out.write("            var h = today.getHours();\n");
      out.write("            var m = today.getMinutes();\n");
      out.write("            var s = today.getSeconds();\n");
      out.write("            m = checkTime(m);\n");
      out.write("            s = checkTime(s);\n");
      out.write("            nowTime = h + \" giờ \" + m + \" phút \" + s + \" giây\";\n");
      out.write("            if (dd < 10) {\n");
      out.write("                dd = '0' + dd\n");
      out.write("            }\n");
      out.write("            if (mm < 10) {\n");
      out.write("                mm = '0' + mm\n");
      out.write("            }\n");
      out.write("            today = day + ', ' + dd + '/' + mm + '/' + yyyy;\n");
      out.write("            tmp = '<span class=\"date\"> ' + today + ' - ' + nowTime +\n");
      out.write("                    '</span>';\n");
      out.write("            document.getElementById(\"clock\").innerHTML = tmp;\n");
      out.write("            clocktime = setTimeout(\"time()\", \"1000\", \"Javascript\");\n");
      out.write("\n");
      out.write("            function checkTime(i) {\n");
      out.write("                if (i < 10) {\n");
      out.write("                    i = \"0\" + i;\n");
      out.write("                }\n");
      out.write("                return i;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        </script>\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            $(document).ready(jQuery(function () {\n");
      out.write("                jQuery(\".trash\").click(function () {\n");
      out.write("                    swal({\n");
      out.write("                        title: \"Cảnh báo\",\n");
      out.write("                        text: \"Bạn có chắc chắn là muốn xóa sản phẩm này?\",\n");
      out.write("                        buttons: [\"Hủy bỏ\", \"Đồng ý\"],\n");
      out.write("                    })\n");
      out.write("                            .then((willDelete) => {\n");
      out.write("                                if (willDelete) {\n");
      out.write("                                    window.location = \"productmanager?action=deleteproduct&product_id=\" + $(this).attr(\"value\");\n");
      out.write("                                    swal(\"Đã xóa thành công.!\", {\n");
      out.write("                                    });\n");
      out.write("                                }\n");
      out.write("                            });\n");
      out.write("                });\n");
      out.write("            }));\n");
      out.write("        </script>\n");
      out.write("        <script>\n");
      out.write("            var myApp = new function () {\n");
      out.write("                this.printTable = function () {\n");
      out.write("                    var tab = document.getElementById('sampleTable');\n");
      out.write("                    var win = window.open('', '', 'height=700,width=700');\n");
      out.write("                    win.document.write(tab.outerHTML);\n");
      out.write("                    win.document.close();\n");
      out.write("                    win.print();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${detail}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("d");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                        <tr>\n");
          out.write("                                            <td><img src=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.product.image[0]}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" alt=\"\" width=\"100px;\"></td>\n");
          out.write("                                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.product.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.product.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.quantity}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.price}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\n");
          out.write("                                        </tr>\n");
          out.write("                                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
