/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet(name = "ViewOwnQuizController", urlPatterns = {"/ViewOwnQuizController"})
public class ViewOwnQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        // get user in session
        User user = (User) session.getAttribute("user");
        // get parameter index
        String indexPage = request.getParameter("index");
        // get categoyry id
        String categoryId = request.getParameter("categoryId");
        // get txt search
        String txtSearch = request.getParameter("txtSearch");
        // check text search null or not
        if(txtSearch==null){
            txtSearch="";
        }
        System.out.println(categoryId);
        // check index page null or not
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        // check user log in or not
        if (user != null) {
            QuizDAO dao = new QuizDAO();
            int xUserid = user.getId();
            // get number of quizzes 
            int count = dao.getTotalOwnQuiz(xUserid,txtSearch);
            // check category id null or not
            if (categoryId != null) {
                // check category id empty or not
                if (!categoryId.equals("")){
                    // get number of quiz by categoryid
                    count = dao.getTotalOwnQuizByCategory(xUserid, categoryId,txtSearch);

                }
            }
            // get end page
            int endPage = count / 6;
            // each page has 6 quizzes
            if (count % 6 != 0) {
                endPage++;
            }
            QuizDAO qDao = new QuizDAO();
            CategoryDAO cDao = new CategoryDAO();
            // get all category
            List<Category> listC = cDao.getAllCategory();
            // get list quizzes in each page 
            List<Quiz> listQuiz = dao.quizPagination(index, xUserid, txtSearch);
//            List<Quiz> listQuiz = dao.getAllQuiz(xUserid);
            // check category id null or not
            if (categoryId != null) {
                if (!categoryId.equals("")){
                    // get list quizzes in each page by category id
                    listQuiz = dao.quizPagination(index, xUserid, categoryId, txtSearch);

                }
            }
            UserDAO udao = new UserDAO();
            user = udao.getUserById(user.getId()+"");
            int numberOfQuiz = dao.getTotalOwnQuiz(user.getId(),"");
            // set 
            request.setAttribute("user", user);
            request.setAttribute("numberOfQuiz", numberOfQuiz);
            request.setAttribute("txtSearch", txtSearch);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("listQuiz", listQuiz);
            request.setAttribute("endPage", endPage);
            request.setAttribute("index", indexPage);
            request.setAttribute("listC", listC);
            // go to viewOwnQuiz.jsp
            request.getRequestDispatcher("viewOwnQuiz.jsp").forward(request, response);
        } else {
            // go to login.jsp
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewOwnQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewOwnQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
