/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Information;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.BaseDAO;

/**
 *
 * @author dell
 */
public class InforDAO extends BaseDAO<Information>{
            
    PreparedStatement ps = null; 
    ResultSet rs = null; 
   
    /**
     * 
     * @return information of the administrator's place (There's only one)
     */
    public Information getInfor() throws SQLException {
        String query = "SELECT * FROM Information";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Information(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connection.close();
            return null;
        }
    }
    
    public static void main(String[] args) throws SQLException {
        InforDAO dao = new InforDAO();
        
        /*---------Test Case for getInfor() method---------*/
        System.out.println(dao.getInfor());
    }


}
