/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dtos.UserDTO;
import dao.userDAO;

/**
 *
 * @author adm
 */
@WebServlet(name = "CustomerManager", urlPatterns = {"/customermanager"})
public class CustomerManager extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("user");
            String action = request.getParameter("action");
            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                if (action == null) {
                    userDAO dao = new userDAO();
                    List<UserDTO> user1 = dao.getUser();
                    request.setAttribute("user", user1);
                    request.getRequestDispatcher("/admin/customer.jsp").forward(request, response);
                }
                if (action.equals("update")) {
                    String user_id = request.getParameter("user_id");
                    String isAdmin = request.getParameter("permission");
                    int id = Integer.parseInt(user_id);
                    userDAO dao = new userDAO();
                    dao.setAdmin(id, isAdmin);
                    response.sendRedirect("customermanager");
                }

                if (action.equalsIgnoreCase("delete")) {
                    String user_id = request.getParameter("user_id");
                    int id = Integer.parseInt(user_id);
                    userDAO dao = new userDAO();
                    dao.delete(id);
                    response.sendRedirect("customermanager");
                }

                if (action.equalsIgnoreCase("updateall")) {
                    String user_id = request.getParameter("user_id");
                    int id = Integer.parseInt(user_id);
                    String user_name = request.getParameter("user_name");
                    String user_pass = request.getParameter("user_pass");
                    String user_email = request.getParameter("user_email");

                    userDAO dao = new userDAO();
                    dao.update(id, user_name, user_email, user_pass);
                    response.sendRedirect("customermanager");
                }
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
//            response.sendRedirect("404.jsp");
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
