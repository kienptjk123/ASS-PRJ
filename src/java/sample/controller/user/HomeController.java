/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CategoriesDAO;
import dtos.CategoriesDTO;
import dtos.Item;
import dao.ProductDAO;
import dtos.ProductDTO;

/**
 *
 * @author hd
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "Home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            CategoriesDAO d = new CategoriesDAO();
            List<CategoriesDTO> list = d.getList();
            ProductDAO p = new ProductDAO();
            List<CategoriesDTO> categories = d.getList();
            List<ProductDTO> productsYear = p.getAll();
            List<ProductDTO> listAll = p.getAll();
            int page = 1, numPerPage = 15;
            int size = listAll.size();
            int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
            
            
            numberpage = Math.min(numberpage, 4);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * 15;
            end = Math.min(page * numPerPage, size);

            Boolean[] chid = new Boolean[categories.size() + 1];
            chid[0] = true;

            List<ProductDTO> listByPage = p.getListByPage(listAll, start, end);

            String id_raw = request.getParameter("id");

            request.setAttribute("data", list);
            request.setAttribute("chid", chid);
            request.setAttribute("listAll", listAll);
            request.setAttribute("category", categories);
            request.setAttribute("productsYear", productsYear);
            request.setAttribute("productPage", listByPage);
            request.setAttribute("page", page);
            request.setAttribute("numberpage", numberpage);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("productdetail")) {
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            ProductDAO c = new ProductDAO();
            List<ProductDTO> listAll = c.getAll();
            List<ProductDTO> getID = c.getID(product_id);
            request.setAttribute("listAll", listAll);
            request.setAttribute("getID", getID);
            request.getRequestDispatcher("product-details.jsp").forward(request, response);
        }

        if (action.equals("search")) {
            String url = ERROR;
            try {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                String searchCart1 = request.getParameter("searchCart1");
                String searchCart2 = request.getParameter("searchCart2");
                double priceFrom = 0;
                double priceTo = Double.MAX_VALUE;
                if (searchCart1 != null && !searchCart1.isEmpty()) {
                    priceFrom = Double.parseDouble(searchCart1);
                }
                if (searchCart2 != null && !searchCart2.isEmpty()) {
                    priceTo = Double.parseDouble(searchCart2);
                }
                List<ProductDTO> listPrice = p.getListPrice(priceFrom, priceTo);
                int page = 1, numPerPage = 15;
                int size = listPrice.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(listPrice, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                url = SUCCESS;
            } catch (Exception e) {
                log("Error at SearchCartController:" + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
        }

        if (action.equals("searchName")) {
            String url = ERROR;
            try {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                String searchName = request.getParameter("searchName");
                ProductDAO p = new ProductDAO();
                List<ProductDTO> listName = p.getListSearch(searchName);

                int page = 1, numPerPage = 15;
                int size = listName.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(listName, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);

                url = SUCCESS;
            } catch (Exception e) {
                log("Error at SearchCartController:" + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }

        }

        if (action.equals("sort")) {
            String type = request.getParameter("type");
            if (type.equals("low")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> sortLow = p.sortLow();

                int page = 1, numPerPage = 15;
                int size = sortLow.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(sortLow, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("high")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> sortHigh = p.sortHigh();

                int page = 1, numPerPage = 15;
                int size = sortHigh.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(sortHigh, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("a-z")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> sortName = p.sortName();

                int page = 1, numPerPage = 15;
                int size = sortName.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(sortName, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
        }

        if (action.equals("tagname")) {
            String type = request.getParameter("type");
            if (type.equals("dienthoai")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> DIENTHOAI = p.DIENTHOAI();

                int page = 1, numPerPage = 15;
                int size = DIENTHOAI.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(DIENTHOAI, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
            if (type.equals("dongho")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> DONGHO = p.DONGHO();

                int page = 1, numPerPage = 15;
                int size = DONGHO.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(DONGHO, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
            if (type.equals("aothun")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> AOTHUN = p.AOTHUN();

                int page = 1, numPerPage = 15;
                int size = AOTHUN.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(AOTHUN, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
        }

        if (action.equals("tag")) {
            String type = request.getParameter("type");
            if (type.equals("new")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> sortByDay = p.sortByDay();

                int page = 1, numPerPage = 15;
                int size = sortByDay.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(sortByDay, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("popular")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> all = p.getAll();

                int page = 1, numPerPage = 15;
                int size = all.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(all, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
        }

        if (action.equals("wishList")) {

        }

        if (action.equals("starRating")) {
            String type = request.getParameter("type");
            if (type.equals("more1")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> rating1 = p.rating1();

                int page = 1, numPerPage = 15;
                int size = rating1.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(rating1, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("more2")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> rating2 = p.rating2();

                int page = 1, numPerPage = 15;
                int size = rating2.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(rating2, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("more3")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> rating3 = p.rating3();

                int page = 1, numPerPage = 15;
                int size = rating3.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(rating3, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("more4")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> rating4 = p.rating4();

                int page = 1, numPerPage = 15;
                int size = rating4.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(rating4, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }

            if (type.equals("more5")) {
                CategoriesDAO d = new CategoriesDAO();
                List<CategoriesDTO> list = d.getList();
                ProductDAO p = new ProductDAO();
                List<ProductDTO> rating5 = p.rating5();

                int page = 1, numPerPage = 15;
                int size = rating5.size();
                int numberpage = ((size % numPerPage == 0) ? (size / 15) : (size / 15) + 1);
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * 15;
                end = Math.min(page * numPerPage, size);

                List<ProductDTO> listByPage = p.getListByPage(rating5, start, end);

                request.setAttribute("data", list);
                request.setAttribute("numberpage", numberpage);
                request.setAttribute("productPage", listByPage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
