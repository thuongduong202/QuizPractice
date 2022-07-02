/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.QuizDAO;
import Model.Question;
import Model.Quiz;
import Model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fptshop
 */
public class ViewQuizDetailController extends HttpServlet {

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String xQuizid = request.getParameter("quizid");
        String currentIndex = request.getParameter("currentIndex");
        if (user != null) {
            QuizDAO dao = new QuizDAO();
            Quiz quiz = dao.getQuizDetails(xQuizid);
            if (currentIndex == null) {
                currentIndex = "1";
            } else if (Integer.parseInt(currentIndex) < 1) {
                currentIndex = String.valueOf(quiz.getListQuestions().size());
            } else if (Integer.parseInt(currentIndex) > quiz.getListQuestions().size()) {
                currentIndex = "1";
            }
            Question question = dao.getQuestionDetails(xQuizid, currentIndex);
            request.setAttribute("quizid", xQuizid);
            request.setAttribute("currentIndex", currentIndex);
            request.setAttribute("question", question);
            request.setAttribute("quiz", quiz);
            request.getRequestDispatcher("viewQuizDetail.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewQuizDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
