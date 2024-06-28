/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CartProduct;
import dtos.CategoriesDTO;
import dtos.Item;
import dao.ProductDAO;
import dtos.ProductDTO;
import dtos.WishListDTO;

/**
 *
 * @author adm
 */
@WebServlet(name = "Wishlist", urlPatterns = {"/wishlist"})
public class Wishlist extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");

        if (action.equals("add")) {
            ProductDAO p = new ProductDAO();
            List<ProductDTO> getAll = p.getAll();
            WishListDTO cartt = null;
            Object o = session.getAttribute("cartt");
            if (o != null) {
                cartt = (WishListDTO) o;
            } else {
                cartt = new WishListDTO();
            }
            String product = request.getParameter("product_id");
            int product_id = 0;
            int quantity = 0;
            try {
                if (product != null && !product.isEmpty()) {
                    product_id = Integer.parseInt(product);
                } else {
                    throw new NumberFormatException("Product ID bị thiếu hoặc trống");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Product ID không hợp lệ");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }

            try {
                ProductDAO pdao = new ProductDAO();
                List<ProductDTO> productid = pdao.getID(product_id);
                if (productid == null) {
                    throw new Exception("Product không tồn tại: " + product_id);
                }
                for (ProductDTO product1 : productid) {
                    Item item = new Item(product1, quantity);
                    cartt.addItem(item);
                }
            } catch (Exception e) {
                e.printStackTrace();

                request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            List<Item> list1 = cartt.getItems();
            session.setAttribute("cartt", cartt);
            session.setAttribute("total", cartt.getTotalMoney());
            session.setAttribute("sizee", list1.size());
            request.setAttribute("data", getAll);
            request.getRequestDispatcher("HomeController?action=search").forward(request, response);
        }

        if (action.equalsIgnoreCase("showcartt")) {
            request.getRequestDispatcher("wishlist.jsp").forward(request, response);
        }
        if (action.equals("deletecartt")) {
            WishListDTO cartt = null;
            Object o = session.getAttribute("cartt");
            if (o != null) {
                cartt = (WishListDTO) o;
            } else {
                cartt = new WishListDTO();
            }
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            cartt.removeItem(product_id);
            List<Item> list = cartt.getItems();
            session.setAttribute("cartt", cartt);
            session.setAttribute("total", cartt.getTotalMoney());
            session.setAttribute("sizee", list.size());
            response.sendRedirect("wishlist.jsp");
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
