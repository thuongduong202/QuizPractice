/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuizDAO;
import Model.QuizUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SearchHomeController", urlPatterns = {"/SearchHomeController"})
public class SearchHomeController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchHomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchHomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        QuizDAO qDao = new QuizDAO();
        String txtSearch = request.getParameter("txtSearch");
        List<QuizUser> list = null;
        if (!txtSearch.isEmpty()) {
            try {
                list = qDao.getAllQuizByTitle(txtSearch);
            } catch (SQLException ex) {
                Logger.getLogger(SearchHomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                list = qDao.getAllQuiz();
            } catch (SQLException ex) {
                Logger.getLogger(SearchHomeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (list != null && list.size()>0) {
            request.setAttribute("txtSearch", txtSearch);
            request.setAttribute("listQuiz", list);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            String message = "Can not found any quiz.";
            request.setAttribute("message", message);
            request.setAttribute("txtSearch", txtSearch);
            request.setAttribute("listQuiz", null);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
        request.getRequestDispatcher("HomeController").forward(request, response);
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
