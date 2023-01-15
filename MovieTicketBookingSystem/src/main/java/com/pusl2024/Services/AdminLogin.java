package com.pusl2024.Services;

import com.pusl2024.Model.Admin;
import com.pusl2024.movieticketbookingsystem.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.Connection;

public class AdminLogin {
    Connection connection;
    Statement statement;

    public int loginValidate(Admin admin) {
        PreparedStatement preparedStatement;

        String userName = admin.getUsername();
        String password = admin.getPassword();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();


        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE UserName = ? AND Password = ?");
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                int adminId = resultSet.getInt(1);
                admin.setAdminId(adminId);

                // No error
                return 0;
            } else {

                // cannot find the admin
                return 1;
            }



        } catch (SQLException ex) {
            Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);

            // exception
            return 2;
        }
    }
}
