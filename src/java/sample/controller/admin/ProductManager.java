/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller.admin;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import dao.ProductDAO;
import dtos.ProductDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.controller.user.User;
import javax.servlet.annotation.MultipartConfig;

public class ProductManager extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        try {

            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("user");

            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                if (action == null || action == "") {
                    ProductDAO c = new ProductDAO();
                    List<ProductDTO> product = c.getAll();
                    request.setAttribute("ProductData", product);
                    request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
                }
                
                if (action.equalsIgnoreCase("insert")) {
                    ProductDAO c = new ProductDAO();
                    request.getRequestDispatcher("/admin/productinsert.jsp").forward(request, response);
                }
                
                if (action.equalsIgnoreCase("insertproduct")) {
                    String id_name = request.getParameter("id_name");
                    String name = request.getParameter("product_name");
                    String quantity = request.getParameter("quantity");
                    double price = Double.parseDouble(request.getParameter("price"));
                    int rate = Integer.parseInt(request.getParameter("rate"));
                    float discount = Float.parseFloat(request.getParameter("discount"));
                    String describe = request.getParameter("describe");
                    String[] pimage = request.getParameterValues("image");
                    String image = "images/products/" + pimage[0]; 
                    ProductDAO dao = new ProductDAO();
                    dao.InsertProduct(name, id_name, quantity, price, rate, image, describe, discount);
                    response.sendRedirect("productmanager?action=insert");
                }

                if (action.equalsIgnoreCase("deleteproduct")) {
                    int product_id = Integer.parseInt(request.getParameter("id"));
                    ProductDAO dao = new ProductDAO();
                    dao.ProductDelete(product_id);
                    response.sendRedirect("productmanager");

                }

                if (action.equalsIgnoreCase("updateproduct")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String id_name = request.getParameter("id_name");
                    String name = request.getParameter("name");
                    Double price = Double.parseDouble(request.getParameter("price"));
                    String describe = request.getParameter("describe");
                    float discount = Float.parseFloat(request.getParameter("discount"));
                    String quantity = request.getParameter("quantity");
                    String[] pimage = request.getParameterValues("image");
                    String image = "images/products/" + pimage[0];     
                    
                    ProductDAO dao = new ProductDAO();
                    dao.UpdateProduct(id, id_name, name, price, describe, discount, quantity, image);
                    response.sendRedirect("productmanager");
                }
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("404.jsp"); // Redirect to an error page if there is a number format exception
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
