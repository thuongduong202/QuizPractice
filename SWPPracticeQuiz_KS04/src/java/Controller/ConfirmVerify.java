/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Model.Register;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ConfirmVerify", urlPatterns = {"/ConfirmVerify"})
public class ConfirmVerify extends HttpServlet {

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
            HttpSession session = request.getSession();
            Register register = (Register) session.getAttribute("authcode");
            System.out.println(register);
            UserDAO dao = new UserDAO();
            String code = request.getParameter("authcode");
            String time = request.getParameter("time");
            int n=0;
            if(!time.equals("")){
                n = Integer.parseInt(time)+1;
            }
            
//            System.out.println(code);
            if (code.equalsIgnoreCase(register.getCode())) {
                //   out.println("Verification Done");
                //dao.register(user.getUsername(), user.getPassword(), user.getEmail());
                dao.register(register.getUserName(), register.getPassword(), register.getEmail(), register.getPhone());
                //request.setAttribute("messVerify2", "Verification Done");
                request.setAttribute("message", "Register successfully! Sign in now.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
//                out.print(user.getUsername()+ user.getPassword()+ user.getEmail());
            } else {
                if (n < 2) {
                    request.setAttribute("time", n);
                    request.setAttribute("authcode", code);
                    //  out.println("Incorrect verification code");
                    request.setAttribute("messVerify1", "Incorrect verification code");
                    request.getRequestDispatcher("verifyRegister.jsp").forward(request, response);
                } else {
                    request.setAttribute("message1", "Failed to verify email.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmVerify.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConfirmVerify.class.getName()).log(Level.SEVERE, null, ex);
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
