package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "ManageProfileController", urlPatterns = {"/ManageProfileController"})
public class ManageProfileController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        // get user in session 
        User user = (User) session.getAttribute("user");
        if (user == null) {
            dispath(request, response, "Login.jsp");
        } else {

            String submit = request.getParameter("submit");
            if (submit == null) {
                dispath(request, response, "manageProfile.jsp");
            }else{
                String username = request.getParameter("username");
            String aboutme = request.getParameter("aboutme");
            String phone = request.getParameter("phone");
            UserDAO dao = new UserDAO();
            boolean updated = false;
            try {
                updated = dao.updateUserInformation(user.getId(), username, aboutme, phone);
            } catch (SQLException ex) {
                Logger.getLogger(ManageProfileController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (updated) {
                user = dao.getUserById(String.valueOf(user.getId()));
                session.setAttribute("user", user);
                request.setAttribute("message", "Updated your information successfully!.");
                dispath(request, response, "manageProfile.jsp");
            }else{
                request.setAttribute("message", "Updated your information false.");
                dispath(request, response, "manageProfile.jsp");
            }
                
            }
            
        }

    }

    public void dispath(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher dispath = request.getRequestDispatcher(page);
        dispath.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManageProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManageProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
