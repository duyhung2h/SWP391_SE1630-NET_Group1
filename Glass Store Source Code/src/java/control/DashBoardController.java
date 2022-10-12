/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 04-10-2022      1.0                 TuanNA           First Implement
 */
package control;
import model.ProductDAO;
import model.UserDAO;
import entity.Account;
import entity.DashBoardProduct;
import entity.Order;
import entity.Product;
import entity.ProductInManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.NotificationDAO;
import model.OrderDAO;

/**
 * The class contains method find update, delete, insert staff information from
 * Staff table in database. In the update or insert method, all data will be
 * normalized (trim space) before update/insert into database The method wil
 * throw an object of <code>java.lang.Exception</code> class if there is any
 * error occurring when finding, inserting, or updating data
 * <p>
 * Bugs: Still have some issues related to search staff by address
 *
 * @author Nguyen Van Hoang
 */
public class DashBoardController extends HttpServlet {

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
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        try {
            ProductDAO ProductDAO = new ProductDAO();
            UserDAO UserDAO = new UserDAO();
            OrderDAO orderDAO = new OrderDAO();
            NotificationDAO notiDAO = new NotificationDAO();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");

            int totalAccount = UserDAO.countAllAccount();
            int totalProduct = ProductDAO.countProduct();
            int totalCart = orderDAO.countOrders();
            int numberNoti = notiDAO.countUnreadNotifications(a.getId());

            List<ProductInManager> top3LeastSell = ProductDAO.top3LeastSell();
            List<DashBoardProduct> top3LeastSellD = amountToProportionLeast3(top3LeastSell);
            List<ProductInManager> top3MostSell = ProductDAO.top3MostSell();
            List<DashBoardProduct> top3MostSellD = amountToProportionMost3(top3MostSell);
            List<Order> recentOrder = orderDAO.getRecentOrder();
            List<Product> countProductByCategory = ProductDAO.countProductByCategory();
            
            request.setAttribute("totalProduct", totalProduct);
            request.setAttribute("totalAccount", totalAccount);
            request.setAttribute("totalCart", totalCart);
            request.setAttribute("numberNoti", numberNoti);

            request.setAttribute("top3MostSellD", top3MostSellD);
            request.setAttribute("top3LeastSellD", top3LeastSellD);
            
            request.setAttribute("recentOrder", recentOrder);
            request.setAttribute("countProductByCategory", countProductByCategory);

            request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("Error.jsp");
        }

    }
    int max=0;
    public List<DashBoardProduct> amountToProportionLeast3(List<ProductInManager> listP) {
        List<DashBoardProduct> listD = new ArrayList<>();

        //get max amount
        for (ProductInManager o : listP) {
            int amount = o.getAmount();
            if (max < amount) {
                max = amount;
            }
        }

        //calculate Proportion of each Product
        for (ProductInManager o : listP) {
            double proportion = 100 - ((double) o.getAmount() / max) * 100;
            listD.add(new DashBoardProduct(o.getName(), max - o.getAmount(), (int) proportion));
        }

        return listD;
    }

    public List<DashBoardProduct> amountToProportionMost3(List<ProductInManager> listP) {
        List<DashBoardProduct> listD = new ArrayList<>();

        //calculate Proportion of each Product
        for (ProductInManager o : listP) {
            double proportion = 100 - ((double) o.getAmount() / max) * 100;
            listD.add(new DashBoardProduct(o.getName(), max - o.getAmount(), (int) proportion));
        }

        return listD;
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
