/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
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

/**
 *
 * @author HP
 */
@WebServlet(name = "NewPasswordController", urlPatterns = {"/NewPasswordController"})
public class SetNewPasswordController extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewPasswordController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String email = request.getParameter("email");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        if(newpass.equals(repass)){
            UserDAO dao = new UserDAO();
            try {
                // reset password
                dao.resetPassword(email, newpass);
            } catch (SQLException ex) {
                Logger.getLogger(SetNewPasswordController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("message", "Reset password successfully. Sign in now.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        else{
            request.setAttribute("email", email);
            request.setAttribute("newpass", newpass);
            request.setAttribute("repass", repass);
            request.setAttribute("message", "Re-password does not match the password.");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
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
