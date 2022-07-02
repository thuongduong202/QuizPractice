/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dangm
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/ChangePasswordController"})
public class ChangePasswordController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String submit = request.getParameter("submit");
            UserDAO u = new UserDAO();
//                    out.print("muii");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                dispath(request, response, "Login.jsp");
            } else {
                if (submit == null) {
                    dispath(request, response, "changePassword.jsp");
                } else {
                    String NewPassword = request.getParameter("NewPassword");
                    String ReNewPassword = request.getParameter("ReNewPassword");
                    String OldPassword = request.getParameter("OldPassword");
                    if (!ReNewPassword.equalsIgnoreCase(NewPassword)) {
                        request.setAttribute("messageFalse", "re-new password not same new password!");
                        dispath(request, response, "changePassword.jsp");
                    } else {
                        int n1 = u.checkAccount(user.getUserName(), OldPassword);
                        if (n1 > 0) {
                            int n = u.changePassword(NewPassword, user.getId());
                            if (n > 0) {
                                request.setAttribute("messageDone", "Change password successfull!");
                                dispath(request, response, "changePassword.jsp");
                            } else {
                                request.setAttribute("messageFalse", "Change password false!");
                                dispath(request, response, "changePassword.jsp");
                            }
                        } else {
                            request.setAttribute("messageFalse", "Old password incorrect!");
                            dispath(request, response, "changePassword.jsp");
                        }
                    }

                }
            }
        }
    }

    public void dispath(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher dispath = request.getRequestDispatcher(page);
        dispath.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
