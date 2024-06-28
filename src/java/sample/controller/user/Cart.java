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

/**
 *
 * @author adm
 */
@WebServlet(name = "Cart", urlPatterns = {"/cart"})
public class Cart extends HttpServlet {

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

        if (action == null) {
            ProductDAO p = new ProductDAO();
            List<ProductDTO> getAll = p.getAll();
            CartProduct cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (CartProduct) o;
            } else {
                cart = new CartProduct();
            }

            String Squantity = request.getParameter("quantity");
            String product = request.getParameter("product_id");
         
            int product_id = 0;
            int quantity = 0;

            // Kiểm tra và phân tích product_id
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

            // Kiểm tra và phân tích quantity
            try {
                if (Squantity != null && !Squantity.isEmpty()) {
                    quantity = Integer.parseInt(Squantity);
                } else {
                    throw new NumberFormatException("Quantity bị thiếu hoặc trống");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Quantity không hợp lệ");
                request.getRequestDispatcher("error.jsp").forward(request, response);
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
                    cart.addItem(item);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            List<Item> list1 = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list1.size());
            request.setAttribute("data", getAll);
            request.getRequestDispatcher("HomeController?action=productdetail&product_id=" + product_id).forward(request, response);
        }
        
        if (action.equalsIgnoreCase("view")) {
            ProductDAO p = new ProductDAO();
            List<ProductDTO> getAll = p.getAll();
            CartProduct cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (CartProduct) o;
            } else {
                cart = new CartProduct();
            }

            String Squantity = request.getParameter("quantity");
            String product = request.getParameter("product_id");
         
            int product_id = 0;
            int quantity = 0;

            // Kiểm tra và phân tích product_id
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

            // Kiểm tra và phân tích quantity
            try {
                if (Squantity != null && !Squantity.isEmpty()) {
                    quantity = Integer.parseInt(Squantity);
                } else {
                    throw new NumberFormatException("Quantity bị thiếu hoặc trống");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Quantity không hợp lệ");
                request.getRequestDispatcher("error.jsp").forward(request, response);
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
                    cart.addItem(item);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            List<Item> list1 = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list1.size());
            request.setAttribute("data", getAll);
            request.getRequestDispatcher("HomeController?action=search").forward(request, response);
        }

        if (action.equalsIgnoreCase("showcart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        if (action.equals("deletecart")) {
            CartProduct cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (CartProduct) o;
            } else {
                cart = new CartProduct();
            }
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            cart.removeItem(product_id);
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            response.sendRedirect("cart.jsp");
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
