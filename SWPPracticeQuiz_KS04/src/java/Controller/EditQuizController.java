/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import DAO.OptionDAO;
import DAO.QuestionDAO;
import DAO.QuizDAO;
import Model.Category;
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

@WebServlet(name = "EditQuizController", urlPatterns = {"/EditQuizController"})
public class EditQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // check if user has login to system
        if (user == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            String quizid = request.getParameter("quizid");
            QuizDAO dao = new QuizDAO();
            Quiz quiz = null;
            List<Category> listCategory = null;
            try {
                // get detail of the quiz by quizid
                quiz = dao.getQuizDetails(quizid);
                // get list category of quiz by quizid 
                listCategory = dao.getCategoryOfQuiz(quizid);
            } catch (SQLException ex) {
                Logger.getLogger(EditQuizController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("quizid", quizid);
            request.setAttribute("quiz", quiz);
            request.getRequestDispatcher("editQuiz.jsp").forward(request, response);
        }
    }

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String category[] = request.getParameterValues("category");
            String description = request.getParameter("description");
            String titleQuiz = request.getParameter("titleQuiz");
            String listQuestion = request.getParameter("ListQuestion");
            String listOption = request.getParameter("ListOption");
            String quizid = request.getParameter("quizid");
            
            String q_questions[] = listQuestion.split("@@@##@@@");
            String questions[][] = new String[(q_questions.length - 1) / 10][4];
//            out.println(q_questions.length);
            int count = 3;
            for (int i = 0; i < (q_questions.length - 1) / 10; i++) {
                // question number
                questions[i][0] = q_questions[count].substring(14, q_questions[count].length() - 3).trim();
                count += 2;
                // question title
                questions[i][1] = q_questions[count].substring(18, q_questions[count].length() - 4).trim();
                count += 2;
                //question instruction
                questions[i][2] = q_questions[count].substring(24, q_questions[count].length() - 4).trim();
                count += 2;
                //question random
                questions[i][3] = q_questions[count].substring(17, q_questions[count].length() - 2).trim();
                count += 4;
                out.println(questions[i][3]);
            }

            count = 3;
            String q_options[] = listOption.split("@@@##@@@");
//            out.println(q_options.length);
            String options[][] = new String[(q_options.length - 1) / 10][4];
            for (int i = 0; i < (q_options.length - 1) / 10; i++) {
                // question of option correspond with questions
                options[i][0] = q_options[count].substring(14, q_options[count].length() - 3).trim();
                count += 2;
                // option number
                options[i][1] = q_options[count].substring(12, q_options[count].length() - 3).trim();
                count += 2;
                // string true/false(right option or not)
                options[i][2] = q_options[count].substring(12, q_options[count].length() - 3).trim();
                count += 2;
                // string description of option[i]
                options[i][3] = q_options[count].substring(22, q_options[count].length() - 3).trim();
                count += 4;
//                out.println(options[i][2]);
            }
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                int quiz;
                int option = 0;
                QuizDAO dao = new QuizDAO();
                QuestionDAO qdao = new QuestionDAO();
                OptionDAO odao = new OptionDAO();
                boolean check = dao.checkQuizExist(quizid);

                if (check) {
                    // update quiz in quiz table
                    dao.updateQuizInQuizTable(quizid, titleQuiz, description);
                    // delete old detail of quiz
                    dao.deleteQuizDetailForEditQuiz(quizid);
                    quiz = Integer.parseInt(quizid);
                    System.out.println(quiz);
                    
                    for (int i = 0; i < questions.length && option <= options.length; i++) {
                        // insert question
                        if(questions[i][3].contains("true")){
                            qdao.insertNewQuestion(quiz,questions[i][0], questions[i][1], questions[i][2],true);
                        }
                        else{
                            qdao.insertNewQuestion(quiz,questions[i][0], questions[i][1], questions[i][2],false);
                        }
                        for (int j = option; j < options.length; j++) {
                            // insert option
                            if (options[option][0].equals(questions[i][0])) {
                                if (options[option][2].contains("true")) {
                                    odao.insertOption(quiz, questions[i][0], options[option][1], options[option][3], true);
                                } else {
                                    odao.insertOption(quiz, questions[i][0], options[option][1], options[option][3], false);
                                }
                                option++;
                            } else {
                                break;
                            }
                        }

                    }
                    // add category for quiz in category_quiz table
                    if (category != null) {
                        // insert category
                        for (String category1 : category) {
                            dao.addQuiz_Category(category1, quiz);
                        }
                    }
                } else {
                    request.setAttribute("message", "Can not find your Quiz.");
                }
                request.setAttribute("message", "Edit Quiz Successfully.");
                request.getRequestDispatcher("ViewOwnQuizController").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
