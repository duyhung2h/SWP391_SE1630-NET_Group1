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

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        /*---------Test Case for getRelatedProduct() method---------*/
//        List<Product> list = dao.getAllProduct();
//        for (Product o : list) {
//            System.out.println(o.getName());
//        }
//    }
        /*---------Test Case for getHotProduct() method---------*/
//        System.out.println(dao.getHotProduct());
//      }

        /*---------Test Case for getFavoriteProduct() method---------*/
//        System.out.println(dao.getFavoriteProduct());
//      }

        /*---------Test Case for countProductByCategory() method---------*/
//        System.out.println(dao.countProductByCategory(1));

        /*---------Test Case for getProductBySellID() method---------*/
//        List<Product> list = dao.getProductsByCateId(2);
//        for (Product product : list) {
//            System.out.println(product);
//        }

        /*---------Test Case for getProductDetailByID() method---------*/
      System.out.println(dao.getProductDetailByID("1"));

    }
}
