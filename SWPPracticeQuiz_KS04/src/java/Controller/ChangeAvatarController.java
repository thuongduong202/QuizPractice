/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ChangeAvatarController", urlPatterns = {"/ChangeAvatarController"})
public class ChangeAvatarController extends HttpServlet {

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
        String filename = null;
        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
        String id = request.getParameter("id");
//        response.getWriter().print("day la id = "+id);
        try {
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Configure a repository (to ensure a secure temp location is used)
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
//            if (items != null) {
////                System.out.println("nottttttttttttttttttttttttttttttt");
//            }
//            if (items != null) {
                // Process the uploaded items
                Iterator<FileItem> iter = items.iterator();
//                if (null == iter) {
//                    System.out.println("nottttttttttttttttttttttttttttttt");
//                }else{
//                    System.out.println("yessssssssssssssssssss");
//                }
//                HashMap<String, String> fields = new HashMap<>();
                while (iter.hasNext()) {
                //System.out.println("nottttttttttttttttttttttttttttttt");
                    FileItem item = iter.next();
//                    if (item.isFormField()) {
                        
//                        fields.put(item.getFieldName(), item.getString());
//                        String name = item.getFieldName();
//                        String value = item.getString();
//                        System.out.println("name: " + name);
//                        System.out.println("value: " + value);

//                    } else {
                        filename = item.getName();
                        if (filename == null || filename.equals("")) {
                            request.getRequestDispatcher("manageProfile.jsp").forward(request, response);
                            break;
                        } else {
                            filename = id + date + ".jpg";
                            System.out.println("filename: " + filename);
                            Path path = Paths.get(filename);
                            String storePath = servletContext.getRealPath("/ImageUpload");
                            File uploadFile = new File(storePath + "/" + path.getFileName());
                            item.write(uploadFile);
                            System.out.println(storePath + "/" + path.getFileName());
                        }
//                    }
//                };

            UserDAO dao = new UserDAO();
            boolean checkUpdate = false;
            checkUpdate = dao.updateAvatar(id, filename);
            if(checkUpdate == true){
                User user = dao.getUserById(id);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                request.setAttribute("messageAvatar", "Change avatar successfully!");
                request.getRequestDispatcher("manageProfile.jsp").forward(request, response);
            }else{
                request.setAttribute("messageAvatar", "Change avatar false!");
                request.getRequestDispatcher("manageProfile.jsp").forward(request, response);
            }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
        processRequest(request, response);
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
