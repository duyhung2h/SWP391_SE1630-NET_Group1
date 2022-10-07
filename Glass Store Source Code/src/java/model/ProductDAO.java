/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Load du lieu tu SQL Server
 *
 * @author ADMIN
 */
public class ProductDAO extends BaseDAO<Product> {

    PreparedStatement ps = null; //...
    ResultSet rs = null; //Get the results returned

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product";
        try {
            ps = connection.prepareStatement(query);//Throw the query to the SQL server 
            rs = ps.executeQuery();//Run the query, get the results returned

            //Now the command has been run, rs is the Result table -> Now have to get the data from the rs table and put it in the List
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink")));
            }
        } catch (Exception e) {
        }

        return list;
    }

    /**
     *
     * @return Product with the highest sold amount
     */
    public Product getHotProduct() {
        //Product with most amount

        String query = "SELECT TOP 1 * FROM Product ORDER BY Amount DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    /**
     *
     * @return get the first and the second product with most sold amount
     */
    public Product getFavoriteProduct() {
        //Product with second most amount
        String query = "SELECT TOP 2 * FROM Product ORDER BY Amount DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                rs.next();
                return new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    /**
     * each seller will have a different ID, so they will have different
     * products
     *
     * @param id
     * @return the list of products of a particular seller
     */
    public List<Product> getProductBySellID(int id) { //Must be int type because when saving to Session, it is still int
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE SellerID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
        public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public List<Product> pagingByCategory(int index, int CategoryID) {
        List<Product> list = new ArrayList<>();
        if (CategoryID == 0) {
            list = pagingProduct(index);
        } else {
            String query = "SELECT * FROM Product WHERE CategoryID = ? ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            try {
                ps = connection.prepareStatement(query);
                ps.setInt(1, CategoryID);
                ps.setInt(2, (index - 1) * 6);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink")));
                }
            } catch (Exception e) {
            }
        }
        return list;
    }

    /**
     * Showing list of products with input category id
     *
     * @param id
     * @return list of products with category Id
     */
    public List<Product> getProductsByCateId(int id) { //Must be int type because when saving to Session, it is still int
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE CategoryId = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    /**
     * Edit the information of a particular product, select by product ID
     *
     * @param id
     * @param name
     * @param description
     * @param price
     * @param imageLink
     * @param CategoryID
     * @param SellerID
     * @param amount
     */


    /**
     *
     * @return the total number of products
     */
    public int countProduct() {
        String query = "SELECT COUNT(*) FROM Product";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }



//    public List<Product> searchProductInManager(int SellerID, String name) {
//        List<Product> list = new ArrayList<>();
//        String query = "select * from Product\n"
//                + "where SellerID = ? and ProductName like ?";
//        try {
//            ps = connection.prepareStatement(query);
//            ps.setInt(1, SellerID);
//            ps.setString(2, "%" + name + "%");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
    //count total product
    public int countProductByCategory(int CategoryID) {
        if (CategoryID == 0) {
            return countProduct();
        } else {
            String query = "SELECT COUNT(*) FROM Product WHERE CategoryID = ?";
            try {
                ps = connection.prepareStatement(query);
                ps.setInt(1, CategoryID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            } catch (Exception e) {
            }
        }
        return 0;
    }

    /**
     * count the products of a particular seller
     *
     * @param SellerID
     * @return the number of product
     */
    public int countProductBySeller(int SellerID) {
        if (SellerID == 0) {
            return countProduct();
        } else {
            String query = "SELECT COUNT(*) FROM Product WHERE SellerID = ?";
            try {
                ps = connection.prepareStatement(query);
                ps.setInt(1, SellerID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            } catch (Exception e) {
            }
        }
        return 0;
    }

    public Product getProductByID(String id) { //Must be int type because when saving to Session, it is still int
        String query = "SELECT * FROM Product WHERE ProductID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Product(rs.getInt("ProductID"),
                        rs.getString("ProductName"), rs.getString("Description"),
                        rs.getInt("SellPrice"), rs.getString("imageLink")));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        
        /*---------Test Case for getRelatedProduct() method---------*/
//        List<Product> list = dao.getRelatedProduct(1);
//        for (Product o : list) {
//            System.out.println(o);
//        }

        /*---------Test Case for getAllProduct() method---------*/
//        List<Product> list = dao.getAllProduct();
//        for (Product o : list) {
//            System.out.println(o);
//        }

        /*---------Test Case for getHotProduct() method---------*/
//        System.out.println(dao.getHotProduct());

        /*---------Test Case for getFavoriteProduct() method---------*/
//        System.out.println(dao.getFavoriteProduct());

        /*---------Test Case for getProductBySellID() method---------*/
//        List<Product> list = dao.getProductBySellID(1);
//        for (Product product : list) {
//            System.out.println(product);
//        }

        /*---------Test Case for edit() method---------*/
        //Waiting...
        /*---------Test Case for add() method---------*/
        //Waiting...
        /*---------Test Case for delete() method---------*/
        //Waiting...
//        dao.delete("1");
        /*---------Test Case for countProduct() method---------*/
//        System.out.println(dao.countProduct());

        /*---------Test Case for pagingProduct() method---------*/
//        List<Product> list = dao.pagingProduct(1);
//        for (Product o : list) {
//            System.out.println(o);
//        }

        /*---------Test Case for pagingByCategory() method---------*/
//        List<Product> list = dao.pagingByCategory(1, 1);
//        for (Product o : list) {
//            System.out.println(o);
//        }

        /*---------Test Case for pagingManagerProduct() method---------*/
//        List<Product> list = dao.pagingManagerProduct(1, 1);
//        for (Product o : list) {
//            System.out.println(o);
//        }

        /*---------Test Case for countProductByCategory() method---------*/
//        System.out.println(dao.countProductByCategory(1));

        /*---------Test Case for countProductBySeller() method---------*/
//        System.out.println(dao.countProductBySeller(1));
        /*---------Test Case for getProductDetailByID() method---------*/
//        System.out.println(dao.getProductByID("1"));   

        /*---------Test Case for getProductDetailByID() method---------*/
//        System.out.println(dao.getProductDetailByID("1"));
        /*---------Test Case for getProductForManager() method---------*/
//        ProductInManager p = dao.getProductForManager("1");
//        System.out.println(p);

        /*---------Test Case for searchProductByName() method---------*/
//        List<Product> list = dao.searchProductByName("msi");
//        for (Product o : list) {
//            System.out.println(o);
//        }
        /*---------Test Case for searchProductInManager() method---------*/
//        List<Product> list = dao.searchProductInManager("asus", 3);
//        for (Product product : list) {
//            System.out.println(product);
//        }
        /*---------Test Case for top3MostSell() method---------*/
//        List<ProductInManager> list = dao.top3MostSell();
//        for (ProductInManager productInManager : list) {
//            System.out.println(productInManager);
//        }

        /*---------Test Case for top3LeastSell() method---------*/
//        List<ProductInManager> list = dao.top3LeastSell();
//        for (ProductInManager productInManager : list) {
//            System.out.println(productInManager);
//        }


        /*---------Test Case for countProductByCategory() method---------*/
//        List<Product> list = dao.getTop4SalePercent();
//        for (Product product : list) {
//            System.out.println(product);
//        }
    }
    
}
