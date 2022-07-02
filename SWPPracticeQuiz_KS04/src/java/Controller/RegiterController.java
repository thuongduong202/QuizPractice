/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Model.Register;
import Model.User;
import Validation.Utilities;
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
 * @author HP
 */
@WebServlet(name = "RegiterController", urlPatterns = {"/RegiterController"})
public class RegiterController extends HttpServlet {

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
            UserDAO dao = new UserDAO();
            if (submit == null) {
                dispath(request, response, "register.jsp");
            } else {
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String rePassword = request.getParameter("rePassword");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                User u = new User();
                u = dao.checkAccountExist(email);
                if (!rePassword.equalsIgnoreCase(password)) {
                    request.setAttribute("message1", "The re-entered password does not match the entered password!");
                    dispath(request, response, "register.jsp");
                } else {
                    if (u == null) {
                        Utilities sm = new Utilities();
                        String code = sm.generateRandomCode();
                        //User user = new User(ID, userName, password, email, "", phone, "", 0);
                        Register register = new Register(userName, password, email, phone, 0, code);
                        String Subject = "Create account QuizPractice";
                        String msg = "Registered successfully.Please verify your account using this code: " + code;
                        boolean test = sm.sendEmail(email, Subject, msg);
                        if (test == true) {
                            HttpSession session = request.getSession();
                            session.setAttribute("authcode", register);
                            dispath(request, response, "verifyRegister.jsp");
                        } else {
                            request.setAttribute("message2", "Failed to send verification email");
                            dispath(request, response, "register.jsp");
                        }
                    } else {
                        request.setAttribute("message2", "Email already exists, please use another email!");
                        //dispath(request, response, "/JSP/register.jsp");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
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
//        processRequest(request, response);
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
            Logger.getLogger(RegiterController.class.getName()).log(Level.SEVERE, null, ex);
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
