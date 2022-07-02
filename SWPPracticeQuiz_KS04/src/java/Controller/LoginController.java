package Controller;


import DAO.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;

@WebServlet(name = "LoginController", urlPatterns = { "/LoginController" })
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        Cookie[] a = request.getCookies();
        String xValue = MyLib.searchCookie(a, "user");
        if (xValue == null || xValue.trim().equals("")) {
            // pr.print("<h3> No data in cookie! </h3>");
            request.getRequestDispatcher("Login.jsp").include(request, response);
            return;
        }
        String[] b = xValue.split("[|]+");
        String xEmail = b[0];
        String xPass = b[1];
        UserDAO u = new UserDAO();
        User x = null;
        try {
            x = u.getUserForLogin(xEmail, xPass);
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("user", x);
        String logResult = "";
        if (x == null) {
            logResult = "Sorry, Email and/or password are/is invalid!";
        } else {
            logResult = "Login is successful!";
        }
        pr.print(logResult);
        request.getRequestDispatcher("index.html").include(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String xEmail, xPass;
        Object xRemMe;
        xEmail = request.getParameter("name");
        xPass = request.getParameter("pass");
        xRemMe = request.getParameter("remMe");
        boolean isRemMe;
        User x = null;
        UserDAO t = new UserDAO();
        try {
            x = t.getUserForLogin(xEmail, xPass);
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getSession().setAttribute("user", x);
        String logResult = "";
        if (x == null) {
            request.setAttribute("notice", "Login failed, email/password is invalid!");
            request.getRequestDispatcher("Login.jsp").include(request, response);
        } else {
            if (xRemMe != null) {
                String namePass = xEmail.trim() + "|" + xPass.trim();
                Cookie y = new Cookie("user", namePass);
                // đưa vào cookie của máy ng dùng
                y.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(y);
            }
            HttpSession session = request.getSession();
            session.setAttribute("user", x);
            session.setMaxInactiveInterval(60*60);
            request.getRequestDispatcher("HomeController").forward(request, response);
        }
    }

}
