/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuizDAO;
import Model.Quiz;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author fptshop
 */
@WebServlet(name = "SearchOwnQuizController", urlPatterns = {"/SearchOwnQuizController"})
public class SearchOwnQuizController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter pr = response.getWriter();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String inputWords = request.getParameter("inputWords");
            QuizDAO dao = new QuizDAO();
            int userID = user.getId();
            List<Quiz> listQuiz = dao.searchQuizInLibrary2(userID, inputWords);
            request.setAttribute("listQuiz", listQuiz);
            request.getRequestDispatcher("viewOwnQuiz.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchOwnQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
