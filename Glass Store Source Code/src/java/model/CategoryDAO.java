/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 01-10-2022      1.0                 MinhVH           First Implement
 */
package model;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class CategoryDAO extends BaseDAO<Category> {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Category> getAllCategory() throws SQLException {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("icon")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connection.close();
            return list;
        }

    }

    /**
     * Select a specified category by its ID, used for categorizing products in
     * homepage
     *
     * @param id
     * @return
     */
    public String getCateNameByID(int id) throws SQLException {
        String query = "SELECT CategoryName FROM Category\n"
                + "WHERE CategoryID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
        return null;
    }

    public static void main(String[] args) throws SQLException {
        CategoryDAO dao = new CategoryDAO();

        /*---------Test Case for getAllCategory() method---------*/
        // List<Category> list = dao.getAllCategory();
        // for (Category category : list) {
        // System.out.println(category);
        // }

        /*---------Test Case for getAllCategory() method---------*/
        System.out.println(dao.getCateNameByID(1));
    }
}
