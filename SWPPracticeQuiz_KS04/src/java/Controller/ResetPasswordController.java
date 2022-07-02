package Controller;

import DAO.UserDAO;
import Model.User;
import Validation.Utilities;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.DispatcherType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author HP
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/ResetPasswordController"})
public class ResetPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResetPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String email = request.getParameter("email");
        String code = Utilities.generateRandomCode();
        String subject = "User Email Verification";
        String msg = "QuizPractice send you code for Reset Password. Your code is " + code;
        UserDAO dao = new UserDAO();
        // check account has registered
        User user = null;
        try {
            user = dao.checkAccountExist(email);
        } catch (SQLException ex) {
            Logger.getLogger(ResetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
        // if user has registered
        if (user != null) {
            // send email to user's email
            boolean sendEmail = Utilities.sendEmail(email, subject, msg);
            if (sendEmail) {
                request.setAttribute("code", code);
                request.setAttribute("email", email);
                request.getRequestDispatcher("verifyResetPassword.jsp").forward(request, response);
            } else {
                request.setAttribute("message2", "Failed to send verification email. Please check your email correctly.");
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            }
        }
        // user did not registered
        else {
            request.setAttribute("message1", "Your email is not registered");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String time = request.getParameter("time");
        int n = 0;
        // check if user has entered wrong code
        if (!time.equals("")) {
            n = Integer.parseInt(time) + 1;
        }
        String code = request.getParameter("code");
        String email = request.getParameter("email");
        String correct_code = request.getParameter("correct_code");
        // check if code correct
        if (code.equals(correct_code)) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        } 
        // code not correct
        else {
            // entered wrong not exceed 3 times
            if (n < 2) {
                request.setAttribute("time", n);
                request.setAttribute("correct_code", correct_code);
                request.setAttribute("email", email);
                request.setAttribute("message1", "Wrong code to verify email.");
                request.getRequestDispatcher("verifyResetPassword.jsp").forward(request, response);
            } 
            // entered wrong exceed 3 times
            else {
                request.setAttribute("email", email);
                request.setAttribute("message1", "You enter exceed 3 times. Cannot verify your email.");
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
