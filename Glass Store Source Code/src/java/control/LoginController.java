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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDAO;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

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
        request.setAttribute("screen", "login");

        //Phần doGet của Servlet Login sẽ có nhiệm vụ lấy thông tin của User và Pass từ Cookie và đẩy lên trang Login.jsp để hiển thị
        try {
            //Bước 1: get user, pass from cookie
            //Cookie là 1 Mảng, gồm nhiều thành phần, bao gồm cả thông tin của Browser để cho mình biết là đang Login ở đâu
            Cookie arr[] = request.getCookies();
            if (arr != null) {
                //Xử lý trg hợp: Khi mình đóng trình duyệt mà vào Login từ đường Link -> Cookie rỗng -> Vòng for bên dưới bị lỗi
                //Còn nếu vào từ /home thì dù vẫn chưa có userC và passC nhưng Cookie vẫn ko rỗng (vì có Cookie của Browser) nên cx ko lỗi
                for (Cookie o : arr) {
                    if (o.getName().equals("userC")) { //Tìm đến thằng Cookie lưu về Username
                        request.setAttribute("username", o.getValue()); //Đẩy Value của nó lên ô Username ở trang Login.jsp
                    }
                    if (o.getName().equals("passC")) {
                        request.setAttribute("password", o.getValue());
                    }
                }
            }
        } catch (Exception e) {
            response.sendRedirect("Error.jsp");
            return;
        }

        // Kiểm tra xem nếu user đã đăng nhập thì redirect đến trang chủ
        try {
            Object accTest = request.getSession().getAttribute("acc");
            if (accTest != null) {
                response.sendRedirect("/homepage");
                return;
            }
        } catch (Exception e) {
            response.sendRedirect("Error.jsp");
            return;
        }

        //Bước 2: trong truong hop bam nut trong man login, xu ly tinh huong khac nhau
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            System.out.println("---type---");
            String buttonType = request.getParameter("buttonType");
            System.out.println(buttonType);
            System.out.println("---acc---");
            Object accTest = request.getSession().getAttribute("acc");
            System.out.println(accTest);

            try {
                switch (buttonType) {
                    case "signup": {
                        request.setAttribute("screen", "signup");
                        response.sendRedirect("/signup");
                        return;
                    }
                    case "login": {
                        HttpSession session = request.getSession();
                        UserDAO dao = new UserDAO();

                        String username = request.getParameter("user");
                        String password = request.getParameter("pass");

                        String remember = request.getParameter("remember");

                        Account userAccount = dao.login(username, password);
                        if (userAccount == null) {
                            request.setAttribute("mess", "Wrong username or password");
                            request.getRequestDispatcher("portal.jsp").forward(request, response);
                            return;
                        } else {

                            // not allow locked account to login
                            if (userAccount.getStatus() == 2) {
                                request.setAttribute("mess", "Your Account is locked!");
                                request.getRequestDispatcher("portal.jsp").forward(request, response);
                                return;
                            }

                            // login active account, unverified account
                            if (userAccount.getStatus() != 2) {
                                session.setAttribute("acc", userAccount);

                                //Save Account on Cookie
                                Cookie u = new Cookie("userC", username);
                                Cookie p = new Cookie("passC", password);

                                //Code Remember Me
                                u.setMaxAge(3600 * 60);
                                if (remember != null) {
                                    p.setMaxAge(3600 * 60); //If user Click Remember Me -> Save Password
                                } else {
                                    p.setMaxAge(0); //NO -> Just SAVE Username 
                                }
                                //Considering the lifetime for Cookie

                                //Store cookies on browser
                                response.addCookie(u);
                                response.addCookie(p);

                                if (userAccount.getIsAdmin() == 1 || userAccount.getIsSell() == 1) {
                                    //If Admin, go to the DashBoard page
                                    response.sendRedirect("/dashboard");
                                    return;
                                } else {
                                    System.out.println("chuyen trang homepage");
                                    response.sendRedirect("/homepage");
                                    return;
                                }
                            }
                        }
                        response.sendRedirect("/login");
                        return;
                    }
                }
            } catch (Exception e) {
            }

            request.getRequestDispatcher("portal.jsp").forward(request, response);
            return;
        } catch (Exception e) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
    }

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
