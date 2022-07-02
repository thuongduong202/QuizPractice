package Controller;

import DAO.QuizDAO;
import Model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteQuizController", urlPatterns = {"/DeleteQuizController"})
public class DeleteQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String quizid = request.getParameter("quizid");
        if (user == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            QuizDAO dao = new QuizDAO();
            boolean checkQuizExsist = dao.checkQuizExist(quizid);
            if (checkQuizExsist) {
                dao.deleteQuiz(quizid);
                request.setAttribute("messageDelete", "Delete Quiz successfully.");
                request.getRequestDispatcher("ViewOwnQuizController").forward(request, response);

            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
