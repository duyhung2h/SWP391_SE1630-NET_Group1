/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 23-09-2022      1.0                 HungND           First Implement
 */
package control;

import entity.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDAO;
import util.GenerateRandomString;


/**
 * The class contains method which register a new account to the server once all relevant input fields are filled, and automatically log users in.
 * If there shall be any errors, or inputted users credentials already existed, it will return an error message.
 * 
 * The method will
 * throw an object of <code>java.lang.Exception</code> class if there is any
 * error occurring when finding, inserting, or updating data
 * <p>
 * Bugs: 
 *
 * @author Hung
 */
public class SignupController extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            System.out.println("---type---");
            String buttonType = request.getParameter("buttonType");
            System.out.println(buttonType);

            try {
                switch (buttonType) {
                    case "signup": {
                        request.setAttribute("screen", "signup");
                        response.sendRedirect("/signup");
                        return;
                    }
                    case "login": {
                        request.setAttribute("screen", "login");
                        response.sendRedirect("/login");
                        return;
                    }
                }
            } catch (Exception e) {
            }

            request.setAttribute("screen", "signup");
            request.getRequestDispatcher("portal.jsp").forward(request, response);
            return;
        } catch (Exception e) {
        } finally {
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
        
        // Kiem tra xem co dang thuc hien lenh dang ky hay khong
        try {
            request.setAttribute("screen", "signup");
            HttpSession session = request.getSession();
            UserDAO dao = new UserDAO();
            // Normal account signup
            // Get new user information
            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            String email = request.getParameter("email");
            String repass = request.getParameter("repass");

            //luu de dien lai khi chuyen ve signup.jsp
            request.setAttribute("user", username);
            request.setAttribute("pass", password);
            request.setAttribute("email", email);
            request.setAttribute("repass", repass);

            String activeCode = GenerateRandomString.generateString(10);

            // Check if password is confirmed
            if (password.equals(repass)) {

                // Check if email and username is not existed
                if (dao.getAccountByEmail(email) == null
                        && dao.getAccountByUsername(username) == null) {

                    // Sign up the account
                    dao.signUp(username, password, email, activeCode);
                    Account newAccount = dao.getAccountByEmail(email);
                    // Get the signed up account, put into session
                    session.setAttribute("newAccount", newAccount);
                    session.setAttribute("acc", newAccount);
                    // Redirect to confirm email page
                    response.sendRedirect("homepage");
                } else {
                    // Redirect to login page if email or user name exist
                    request.setAttribute("mess", "Your email or username is already exist");
                    request.getRequestDispatcher("portal.jsp").forward(request, response);
                }
            } else {
                // Redirect to login page if password is not confirmed 
                request.setAttribute("mess", "Password confirmation does not match your password");
                request.getRequestDispatcher("portal.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Redirect to error page if exception happend
            System.out.println(e);
//            throw e;
        } finally {
            processRequest(request, response);
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
