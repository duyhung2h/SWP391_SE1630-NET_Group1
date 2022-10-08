/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Constants;

/**
 *
 * @author fsoft
 */
//Ket Noi Database
public abstract class BaseDAO<T> {
    protected Connection connection;
    public BaseDAO()
    {
        try {
            Constants constant = new Constants();
            String url = "jdbc:sqlserver://localhost:1433;databaseName=GlassShop";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, constant.getUSER(), constant.getPASS());
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
}
