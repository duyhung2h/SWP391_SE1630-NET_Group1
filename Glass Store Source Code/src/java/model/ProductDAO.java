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

    /**
     * Every 6 products will be displayed in a single page
     *
     * @param index
     * @return list of 6 products
     */
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

    /**
     * categorizing products
     *
     * @param index
     * @param CategoryID
     * @return list of products with same category
     */
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

    public List<Product> countProductByCategory() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT COUNT(*) AS Amount, Category.CategoryName\n"
                + "FROM Product \n"
                + "INNER JOIN Category\n"
                + "ON Product.CategoryID = Category.CategoryID\n"
                + "GROUP BY Product.CategoryID, Category.CategoryName";
        try {
            ps = connection.prepareStatement(query);//Throw the query to the SQL server 
            rs = ps.executeQuery();//Run the query, get the results returned

            //Now, the command has been run, rs is the Result version -> Now have to get the data from the rs table and put it in the List
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("amount"));
                p.setName(rs.getString("CategoryName"));
                list.add(p);
            }
        } catch (Exception e) {
        }

        return list;
    }

    //Get Product for Detail
    public ProductDetail getProductDetailByID(String id) { //Must be int type because when saving to Session, it is still int
        String query = "SELECT * \n"
                + "FROM Product INNER JOIN Manufacturer\n"
                + "ON Product.ManufacturerID = Manufacturer.ManufacturerID\n"
                + "WHERE ProductID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new ProductDetail(rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getInt("SellPrice"),
                        rs.getString("imageLink"),
                        rs.getString("ManufacturerName")));
            }
        } catch (Exception e) {
        }
        return null;
    }

    /**
     * Select top 3 most sold products
     *
     * @return products
     */
    public List<ProductInManager> top3MostSell() {
        List<ProductInManager> list = new ArrayList<>();
        String query = "SELECT TOP 3 * FROM Product ORDER BY Amount ASC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductInManager(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink"), rs.getInt("CategoryID"), rs.getInt("SellerID"), rs.getInt("Amount")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    /**
     * select top 3 least sold products
     *
     * @return products
     */
    public List<ProductInManager> top3LeastSell() {
        List<ProductInManager> list = new ArrayList<>();
        String query = "SELECT TOP 3 * FROM Product ORDER BY Amount DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductInManager(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("SellPrice"), rs.getString("imageLink"), rs.getInt("CategoryID"), rs.getInt("SellerID"), rs.getInt("Amount")));
            }
        } catch (Exception e) {
        }
        return list;
    }


    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        /*---------Test Case for getRelatedProduct() method---------*/
//        List<Product> list = dao.getRelatedProduct(1);
//        for (Product o : list) {
//            System.out.println(o);
    }

}
