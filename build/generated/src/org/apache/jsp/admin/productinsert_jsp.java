package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class productinsert_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"vi\">\n");
      out.write("    <head>\n");
      out.write("        <title>Thêm sản phẩm | Quản trị Admin</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <!-- Main CSS-->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"admin/css/main.css\">\n");
      out.write("        <!-- Font-icon css-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css\">\n");
      out.write("        <!-- or -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://unpkg.com/boxicons@latest/css/boxicons.min.css\">\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.2/css/all.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"\n");
      out.write("              href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <script src=\"http://code.jquery.com/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            function readURL(input, thumbimage) {\n");
      out.write("                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome\n");
      out.write("                    var reader = new FileReader();\n");
      out.write("                    reader.onload = function (e) {\n");
      out.write("                        $(\"#thumbimage\").attr('src', e.target.result);\n");
      out.write("                    }\n");
      out.write("                    reader.readAsDataURL(input.files[0]);\n");
      out.write("                } else { // Sử dụng cho IE\n");
      out.write("                    $(\"#thumbimage\").attr('src', input.value);\n");
      out.write("\n");
      out.write("                }\n");
      out.write("                $(\"#thumbimage\").show();\n");
      out.write("                $('.filename').text($(\"#uploadfile\").val());\n");
      out.write("                $('.Choicefile').css('background', '#14142B');\n");
      out.write("                $('.Choicefile').css('cursor', 'default');\n");
      out.write("                $(\".removeimg\").show();\n");
      out.write("                $(\".Choicefile\").unbind('click');\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $(\".Choicefile\").bind('click', function () {\n");
      out.write("                    $(\"#uploadfile\").click();\n");
      out.write("\n");
      out.write("                });\n");
      out.write("                $(\".removeimg\").click(function () {\n");
      out.write("                    $(\"#thumbimage\").attr('src', '').hide();\n");
      out.write("                    $(\"#myfileupload\").html('<input type=\"file\" id=\"uploadfile\"  onchange=\"readURL(this);\" />');\n");
      out.write("                    $(\".removeimg\").hide();\n");
      out.write("                    $(\".Choicefile\").bind('click', function () {\n");
      out.write("                        $(\"#uploadfile\").click();\n");
      out.write("                    });\n");
      out.write("                    $('.Choicefile').css('background', '#14142B');\n");
      out.write("                    $('.Choicefile').css('cursor', 'pointer');\n");
      out.write("                    $(\".filename\").text(\"\");\n");
      out.write("                });\n");
      out.write("            })\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"app sidebar-mini rtl\">\n");
      out.write("        <style>\n");
      out.write("            .Choicefile {\n");
      out.write("                display: block;\n");
      out.write("                background: #14142B;\n");
      out.write("                border: 1px solid #fff;\n");
      out.write("                color: #fff;\n");
      out.write("                width: 150px;\n");
      out.write("                text-align: center;\n");
      out.write("                text-decoration: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("                padding: 5px 0px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                align-items: center;\n");
      out.write("                justify-content: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .Choicefile:hover {\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #uploadfile,\n");
      out.write("            .removeimg {\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #thumbbox {\n");
      out.write("                position: relative;\n");
      out.write("                width: 100%;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .removeimg {\n");
      out.write("                height: 25px;\n");
      out.write("                position: absolute;\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                top: 5px;\n");
      out.write("                left: 5px;\n");
      out.write("                background-size: 25px;\n");
      out.write("                width: 25px;\n");
      out.write("                /* border: 3px solid red; */\n");
      out.write("                border-radius: 50%;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .removeimg::before {\n");
      out.write("                -webkit-box-sizing: border-box;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                content: '';\n");
      out.write("                border: 1px solid red;\n");
      out.write("                background: red;\n");
      out.write("                text-align: center;\n");
      out.write("                display: block;\n");
      out.write("                margin-top: 11px;\n");
      out.write("                transform: rotate(45deg);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .removeimg::after {\n");
      out.write("                /* color: #FFF; */\n");
      out.write("                /* background-color: #DC403B; */\n");
      out.write("                content: '';\n");
      out.write("                background: red;\n");
      out.write("                border: 1px solid red;\n");
      out.write("                text-align: center;\n");
      out.write("                display: block;\n");
      out.write("                transform: rotate(-45deg);\n");
      out.write("                margin-top: -2px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <!-- Navbar-->\n");
      out.write("        <header class=\"app-header\">\n");
      out.write("            <<a class=\"app-sidebar__toggle\" href=\"#\" data-toggle=\"sidebar\"\n");
      out.write("                aria-label=\"Hide Sidebar\"></a>\n");
      out.write("            <ul class=\"app-nav\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                <!-- User Menu-->\n");
      out.write("                <li><a class=\"app-nav__item\" href=\"dashboard\"><i class='bx bx-log-out bx-rotate-180'></i> </a>\n");
      out.write("\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </header>\n");
      out.write("        <!-- Sidebar menu-->\n");
      out.write("        <!-- Sidebar menu-->\n");
      out.write("        <div class=\"app-sidebar__overlay\" data-toggle=\"sidebar\"></div>\n");
      out.write("        <aside class=\"app-sidebar\">\n");
      out.write("            <div style=\"margin-top: 40px; border-bottom: 1px solid black; width: 100%\">\n");
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
      out.write("                            <li class=\"breadcrumb-item\"><a href=\"#\"><b>Danh sách người dùng</b></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        <div id=\"clock\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <div class=\"tile\">\n");
      out.write("                        <h3 class=\"tile-title\">Tạo mới sản phẩm</h3>\n");
      out.write("                        <div class=\"tile-body\">                       \n");
      out.write("                            <form class=\"row\" action=\"productmanager?action=insertproduct\" method=\"POST\" enctype=\"multipart/form-data\">\n");
      out.write("                                <div class=\"form-group col-md-3\">\n");
      out.write("                                    <label class=\"control-label\">Mã sản phẩm </label>\n");
      out.write("                                    <input class=\"form-control\" name=\"product_id\" type=\"text\" placeholder=\"\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-3\">\n");
      out.write("                                    <label for=\"exampleSelect1\" class=\"control-label\">Danh mục</label>\n");
      out.write("                                    <select name=\"category_id\" class=\"form-control\" id=\"exampleSelect1\">\n");
      out.write("                                        <option>-- Chọn danh mục --</option>\n");
      out.write("                                        ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-3\">\n");
      out.write("                                    <label class=\"control-label\">Tên sản phẩm</label>\n");
      out.write("                                    <input class=\"form-control\" name=\"product_name\" type=\"text\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group  col-md-3\">\n");
      out.write("                                    <label class=\"control-label\">Giá bán</label>\n");
      out.write("                                    <input class=\"form-control\" name=\"price\" type=\"number\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-3\">\n");
      out.write("                                    <label class=\"control-label\">Size</label>\n");
      out.write("                                    <input class=\"form-control\" name=\"size\" type=\"text\" placeholder=\"S,L,XL,...\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-3\">\n");
      out.write("                                    <label class=\"control-label\">Màu</label>\n");
      out.write("                                    <input class=\"form-control\" placeholder=\"Blue,Gray,...\" name=\"color\" type=\"text\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group  col-md-3\">\n");
      out.write("                                    <label class=\"control-label\">Số lượng</label>\n");
      out.write("                                    <input class=\"form-control\" name=\"quantity\" type=\"number\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-12\">\n");
      out.write("                                    <label class=\"control-label\">Ảnh sản phẩm</label>\n");
      out.write("                                    <div id=\"myfileupload\">\n");
      out.write("                                        <input type=\"file\" id=\"uploadfile\" name=\"product_img\" onchange=\"readURL(this);\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <div id=\"thumbbox\">\n");
      out.write("                                        <img height=\"450\" width=\"400\" alt=\"Thumb image\" id=\"thumbimage\" style=\"display: none\" />\n");
      out.write("                                        <a class=\"removeimg\" href=\"javascript:\"></a>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div id=\"boxchoice\">\n");
      out.write("                                        <a href=\"javascript:\" class=\"Choicefile\"><i class=\"fas fa-cloud-upload-alt\"></i> Chọn ảnh</a>\n");
      out.write("                                        <p style=\"clear:both\"></p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-12\">\n");
      out.write("                                    <label class=\"control-label\">Mô tả sản phẩm</label>\n");
      out.write("                                    <textarea class=\"form-control\" name=\"describe\" id=\"describe\"></textarea>\n");
      out.write("                                </div>\n");
      out.write("                                <button class=\"btn btn-save\" type=\"submit\">Lưu lại</button>\n");
      out.write("                                &nbsp;\n");
      out.write("                                <a class=\"btn btn-cancel\" href=\"productmanager\">Hủy bỏ</a>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("        <div class=\"modal fade\" id=\"adddanhmuc\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\"\n");
      out.write("             data-backdrop=\"static\" data-keyboard=\"false\">\n");
      out.write("            <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"form-group  col-md-12\">\n");
      out.write("                                <span class=\"thong-tin-thanh-toan\">\n");
      out.write("                                    <h5>Thêm mới danh mục </h5>\n");
      out.write("                                </span>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group col-md-12\" >\n");
      out.write("\n");
      out.write("                                <h2 style=\"color: red; padding-left: 10px\">\n");
      out.write("                                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h2>\n");
      out.write("                                <label class=\"control-label\">Nhập tên danh mục mới</label>\n");
      out.write("                                <form action=\"productmanager?action=insertcategory\" method=\"post\"> \n");
      out.write("                                    <input class=\"form-control\" type=\"text\" name=\"name\" required>\n");
      out.write("                                    <br>\n");
      out.write("                                    <button class=\"btn btn-save\" type=\"submit\">Lưu lại</button>\n");
      out.write("                                    <a class=\"btn btn-cancel\" data-dismiss=\"modal\" href=\"#\">Hủy bỏ</a>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group col-md-12\">\n");
      out.write("                                <label class=\"control-label\">Danh mục sản phẩm hiện đang có</label>\n");
      out.write("                                <ul style=\"padding-left: 20px;\">\n");
      out.write("                                    ");
      if (_jspx_meth_c_forEach_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"admin/js/jquery-3.2.1.min.js\"></script>\n");
      out.write("        <script src=\"admin/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"admin/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"admin/js/main.js\"></script>\n");
      out.write("        <script src=\"admin/js/plugins/pace.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("                                            const inpFile = document.getElementById(\"inpFile\");\n");
      out.write("                                            const loadFile = document.getElementById(\"loadFile\");\n");
      out.write("                                            const previewContainer = document.getElementById(\"imagePreview\");\n");
      out.write("                                            const previewContainer = document.getElementById(\"imagePreview\");\n");
      out.write("                                            const previewImage = previewContainer.querySelector(\".image-preview__image\");\n");
      out.write("                                            const previewDefaultText = previewContainer.querySelector(\".image-preview__default-text\");\n");
      out.write("                                            const object = new ActiveXObject(\"Scripting.FileSystemObject\");\n");
      out.write("                                            inpFile.addEventListener(\"change\", function () {\n");
      out.write("                                                const file = this.files[0];\n");
      out.write("                                                if (file) {\n");
      out.write("                                                    const reader = new FileReader();\n");
      out.write("                                                    previewDefaultText.style.display = \"none\";\n");
      out.write("                                                    previewImage.style.display = \"block\";\n");
      out.write("                                                    reader.addEventListener(\"load\", function () {\n");
      out.write("                                                        previewImage.setAttribute(\"src\", this.result);\n");
      out.write("                                                    });\n");
      out.write("                                                    reader.readAsDataURL(file);\n");
      out.write("                                                }\n");
      out.write("                                            });\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
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
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${CategoryData}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("cat");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                            <option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cat.category_id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cat.category_name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</option>\n");
          out.write("                                        ");
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

  private boolean _jspx_meth_c_forEach_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent(null);
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${CategoryData}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_1.setVar("cat");
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                        <li>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cat.category_name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</li>\n");
          out.write("                                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_1.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }
}
