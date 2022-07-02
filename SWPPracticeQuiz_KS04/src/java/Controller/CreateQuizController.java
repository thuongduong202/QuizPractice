package Controller;

import DAO.CategoryDAO;
import DAO.OptionDAO;
import DAO.QuestionDAO;
import DAO.QuizDAO;
import Model.Category;
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

@WebServlet(name = "CreateQuizController", urlPatterns = {"/CreateQuizController"})
public class CreateQuizController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            CategoryDAO dao = new CategoryDAO();
            List<Category> listCategory = dao.getAllCategory();
            request.setAttribute("listCategory", listCategory);
            request.getRequestDispatcher("createQuiz.jsp").forward(request, response);
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
            Logger.getLogger(CreateQuizController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String category[] = request.getParameterValues("category");
            String description = request.getParameter("description");
            String titleQuiz = request.getParameter("titleQuiz");
            String listQuestion = request.getParameter("ListQuestion");
            String listOption = request.getParameter("ListOption");
//            out.print(category.length);
//            out.println(titleQuiz);
//            out.println(description);
            out.println(listQuestion);
            out.println(listOption);
            String q_questions[] = listQuestion.split("@@@##@@@");
            String questions[][] = new String[(q_questions.length - 1) / 10][4];
//            out.println(q_questions.length);
            int count = 3;
            for (int i = 0; i < (q_questions.length - 1) / 10; i++) {
//            out.println(q_questions[i]);
                // question number
                questions[i][0] = q_questions[count].substring(14, q_questions[count].length() - 3).trim();
                count += 2;
                // question title
                questions[i][1] = q_questions[count].substring(18, q_questions[count].length() - 4).trim();
                count += 2;
                //question description
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
                options[i][2] = q_options[count].substring(12, q_options[count].length() - 2).trim();
                count += 2;
                // string description of option[i]
                options[i][3] = q_options[count].substring(22, q_options[count].length() - 3).trim();
                count += 4;
//                out.println(options[i][2]);
            }
//            out.print(options[0][0]);
//            out.print(questions[0][0]);
//            if(options[0][0].equals(questions[0][0])){
//                out.print("yes");
//            }
//            for (int i = 0; i < options.length; i++) {
//                out.println(options[i][2]);
//                if(options[i][2].equals("true")){
//                    out.println("yesssssssssss");
//                }
//            }
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            // check if user has login to system
            if (user == null) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                int userid = user.getId();
                int quiz;
                int option = 0;
                QuizDAO dao = new QuizDAO();
                QuestionDAO qdao = new QuestionDAO();
                OptionDAO odao = new OptionDAO();
                // insert new quiz to quiz table by userid
                boolean check = dao.insertNewQuizByUserid(userid, titleQuiz, description);
                // check if quiz created
                if (check) {
                    // get id of quiz has inserted
                    quiz = dao.getLassQuizByUser(userid);
                    // insert category of quiz to database
                    if (category != null && category.length>0) {
                        for (String category1 : category) {
                            dao.addQuiz_Category(category1, quiz);
                        }
                    }
                    // travel the list of question
                    for (int i = 0; i < questions.length && option < options.length; i++) {
                        // insert new question by quizid
                        if(questions[i][3].contains("true")){
                            qdao.insertNewQuestion(quiz,questions[i][0], questions[i][1], questions[i][2],true);
                        }
                        else{
                            qdao.insertNewQuestion(quiz,questions[i][0], questions[i][1], questions[i][2],false);
                        }
                        // travel the rest of list option that not been added to database
                        for (int j = option; j < options.length; j++) {
                            // check if question of option is option of current question 
                            if (options[option][0].equals(questions[i][0])) {
                                // check if option is right option
                                if (options[option][2].contains("true")) {
                                    odao.insertOption(quiz, questions[i][0],options[option][1],options[option][3], true);
                                } else {
                                    odao.insertOption(quiz, questions[i][0],options[option][1],options[option][3], false);
                                }
                                option++;
                            } else {
                                break;
                            }
                        }

                    }
                }
                request.setAttribute("message", "Create Quiz Successfully.");
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


