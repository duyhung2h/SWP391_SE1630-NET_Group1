/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 04-10-2022      1.0                 TuanNA           First Implement
 */
package control;

import entity.*;
import model.*;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * The class contains method which read the full user's database and display
 * informations. You can also check individual customer's orders from here, if
 * you are a seller.
 *
 * The method will throw an object of <code>java.lang.Exception</code> class if
 * there is any error occurring when finding, inserting, or updating data
 * <p>
 * Bugs:
 *
 * @author Hung
 */
public class AccountManagerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. 0
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            UserDAO userDAO = new UserDAO();
            List<Account> listAccount = new ArrayList<>();

            // kiem tra xem user dang nhap la admin hay seller
            Object accTest = request.getSession().getAttribute("acc");
            if (accTest == null) {
                response.sendRedirect("/homepage");
                return;
            } else {
                request.setAttribute("acc", accTest);

//                lay truong isSell va isAdmin (qua object nen phai nhu the nay)
                Field isSellField = accTest.getClass().getDeclaredField("isSell");
                isSellField.setAccessible(true);
                int isSell = (Integer) isSellField.get(accTest);
                System.out.println(isSell);
                
                Field isAdminField = accTest.getClass().getDeclaredField("isAdmin");
                isAdminField.setAccessible(true);
                int isAdmin = (Integer) isAdminField.get(accTest);
                System.out.println(isAdminField.get(accTest));
                
                
//                khi la seller thi chuyen sang trang quan ly customer (chi lay list cac nguoi dung user)
                if (isSell == 1) {
                    listAccount = userDAO.getAllCustomerAccounts();
//                    khi la admin thi xem dc het cac user va co quyen edit / xoa
                } else if (isAdmin == 1) {
                    listAccount = userDAO.getAllAccounts();
                }
                //Set data to JSP
                request.setAttribute("list", listAccount);
                request.getRequestDispatcher("accountManager.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //Get data from DAO
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
