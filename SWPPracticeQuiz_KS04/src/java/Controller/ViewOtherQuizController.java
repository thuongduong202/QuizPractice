package Controller;

import DAO.CategoryDAO;
import DAO.QuizDAO;
import DAO.UserDAO;
import Model.Category;
import Model.Quiz;
import Model.User;
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

@WebServlet(name = "ViewOtherQuizController", urlPatterns = {"/ViewOtherQuizController"})
public class ViewOtherQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        int userid = Integer.parseInt(request.getParameter("userid").trim());
        if (user!=null && userid == user.getId()) {
            request.getRequestDispatcher("ViewOwnQuizController").forward(request, response);
        } else {
            UserDAO udao = new UserDAO();
            User oUser = udao.getUserById(userid + "");
            String indexPage = request.getParameter("index");
            String categoryId = request.getParameter("categoryId");
            String txtSearch = request.getParameter("txtSearch");
            if (txtSearch == null) {
                txtSearch = "";
            }
            System.out.println(categoryId);
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            System.out.println(index);

            if (oUser != null) {
                QuizDAO dao = new QuizDAO();
                int xUserid = oUser.getId();
                int count = dao.getTotalOwnQuiz(xUserid, txtSearch);
                if (categoryId != null) {
                    if (!categoryId.equals("")) {
                        count = dao.getTotalOwnQuizByCategory(xUserid, categoryId, txtSearch);

                    }
                }
                int endPage = count / 6;
                if (count % 6 != 0) {
                    endPage++;
                }
                QuizDAO qDao = new QuizDAO();
                CategoryDAO cDao = new CategoryDAO();
                List<Category> listC = cDao.getAllCategory();

                List<Quiz> listQuiz = dao.quizPagination(index, xUserid, txtSearch);
//            List<Quiz> listQuiz = dao.getAllQuiz(xUserid);

                if (categoryId != null) {

                    if (!categoryId.equals("")) {
                        listQuiz = dao.quizPagination(index, xUserid, categoryId, txtSearch);

                    }
                }
                int numberOfQuiz = dao.getTotalOwnQuiz(xUserid, "");
                System.out.println(txtSearch);
                request.setAttribute("txtSearch", txtSearch);
                request.setAttribute("categoryId", categoryId);
                request.setAttribute("listQuiz", listQuiz);
                request.setAttribute("endPage", endPage);
                request.setAttribute("index", indexPage);
                request.setAttribute("listC", listC);
                request.setAttribute("oUser", oUser);
                request.setAttribute("numberOfQuiz", numberOfQuiz);
                request.setAttribute("userid", userid);
                request.getRequestDispatcher("viewOthersQuiz.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewOtherQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewOtherQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
