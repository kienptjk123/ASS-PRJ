/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller.user;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CartProduct;
import dao.billDAO;


public class Checkout extends HttpServlet {

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
        try {
            // Initialize session and retrieve cart
            HttpSession session = request.getSession(true);
            CartProduct cart = null;
            billDAO dao = new billDAO();
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (CartProduct) o;
            } else {
                cart = new CartProduct();
            }

            dtos.UserDTO acc = null;
            Object u = session.getAttribute("user");
            if (u != null) {
                acc = (dtos.UserDTO) u;

                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                int phonenumber = Integer.parseInt(phone);

                // Add order to database
                dao.addOrder(acc, cart, address, phonenumber);

                // Clear cart session
                session.removeAttribute("cart");
                session.setAttribute("size", 0);

                // Get current date and time
                Date dt = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String dateString = formatter.format(dt);

                request.setAttribute("code", "00");
                request.setAttribute("message", "success");

                response.sendRedirect("HomeController?search");
            } else {
                // Redirect to login page if user is not logged in
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
            // Forward to 404 page in case of an error
            request.getRequestDispatcher("404.jsp").forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession(true);
            Object u = session.getAttribute("user");
            if (u != null) {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                response.sendRedirect("user?action=login");
            }

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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    
}
