/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import DAO.QuizDAO;
import Model.Category;
import Model.Quiz;
import Model.QuizUser;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
 * @author MSI
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryController"})
public class CategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        CategoryDAO cDao = new CategoryDAO();
        QuizDAO qDao = new QuizDAO();
        List<Category> listC = cDao.getAllCategory();
        QuizDAO dao = new QuizDAO();
        // get parameter index
        String indexPage = request.getParameter("index");
        // get categoyry id
        String categoryId = request.getParameter("categoryId");
        // get txt search
        String txtSearch = request.getParameter("txtSearch");
        // check text search null or not
        if (txtSearch == null) {
            txtSearch = "";
        }
        int endPage = 1;
        System.out.println("+"+indexPage+"+");
        // check index page null or not
        if (indexPage == null) {
            indexPage = "1";
        }
        List<QuizUser> listQuiz = null;
        if (categoryId == null) {
            categoryId = "";
        }
        if ("".equals(categoryId.trim())) {
            listQuiz = dao.getAllQuizByPage(indexPage, txtSearch);
            endPage = dao.countAllQuizSearch(txtSearch);
        } else {
            listQuiz = dao.getAllQuizByPageAndCategory(indexPage, txtSearch, categoryId);
            endPage = dao.countAllQuizByPageAndCategory(txtSearch, categoryId);
        }
        if (endPage % 6 == 0) {
            endPage = endPage / 6;
        } else {
            endPage = endPage / 6 + 1;
        }
        System.out.println(listQuiz.size());
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("endPage", endPage);
        request.setAttribute("index", indexPage);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("listC", listC);
        request.setAttribute("listQuiz", listQuiz);
        request.getRequestDispatcher("Category.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
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
