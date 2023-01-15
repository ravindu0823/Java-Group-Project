package com.pusl2024.movieticketbookingsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
    public Connection getConnection() {

        Connection connection = null;

//        String path = "jdbc:mysql://localhost:3306/agri_project?zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&useSSL=false";
         // String path = "jdbc:mysql://localhost:3306/test?zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&useSSL=false";
        // String path = "jdbc:mysql://localhost:3306/newdb?zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&useSSL=false";
        String path = "jdbc:mysql://localhost:3306/movie?zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&useSSL=false";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(path, "dhanu", "dhanu751");

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return connection;
    }
}
