/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 01-10-2022      1.0                 MinhVH           First Implement
 */

package control;

import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryDAO;
import model.ProductDAO;

/**
 *
 * @author dell
 */
public class ProductListController extends HttpServlet {

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

         ProductDAO ProductDAO = new ProductDAO();
                ;
                CategoryDAO CategoryDAO = new CategoryDAO();

                List<Category> listC = CategoryDAO.getAllCategory(); //Get List Category
                


                //Paging By CategoryID
                String CategoryID = request.getParameter("CategoryID");
                if (CategoryID == null) { //On Load: User hasn't choosen Category
                    CategoryID = "0";
                }
                //Set Category ID back on JSP
                request.setAttribute("CategoryID", CategoryID);

                int CID = Integer.parseInt(CategoryID);

                //Get Page number from JSP
                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    //On load: Page 1
                    indexPage = "1";
                }

                int index = Integer.parseInt(indexPage);

                //Count number of Product According to the Category -> Number of Pages
                int count = ProductDAO.countProductByCategory(CID);
                int endPage = count / 6;
                if (count % 6 != 0) {
                    //If the number of Product isn't divided by 3 -> Need 1 more Page
                    endPage++;
                }

                //List of Product to Display after Paging by Category ID
                List<Product> list = ProductDAO.pagingByCategory(index, CID);

                //Set Data to JSP
                request.setAttribute("allCategory", listC);
                System.out.println(list);
                request.setAttribute("listP", list); //List Product
                request.setAttribute("end", endPage);
                request.setAttribute("tag", index); //Page number
                request.setAttribute("count", count);
                request.setAttribute("CateID", CID);
                request.setAttribute("CateName", CategoryDAO.getCateNameByID(CID));

                
        request.getRequestDispatcher("productList.jsp").forward(request, response);

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
