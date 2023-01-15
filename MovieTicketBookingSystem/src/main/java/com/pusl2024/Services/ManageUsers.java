package com.pusl2024.Services;

import com.pusl2024.Model.User;
import com.pusl2024.movieticketbookingsystem.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ManageUsers {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int userUpdate(User user) {
        String username = user.getUsername();
        String email = user.getEmail();
        int userId = user.getUserId();
        int phoneNumber = user.getPhoneNumber();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_UPDATE_CUSTOMER (?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, userId);
            stmt.setString(2, username);
            stmt.setInt(3, phoneNumber);
            stmt.setString(4, email);

            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }

    }

    public int userDelete(User user) {
        int userId = user.getUserId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_DELETE_CUSTOMER (?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(ManageUsers.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }

}
