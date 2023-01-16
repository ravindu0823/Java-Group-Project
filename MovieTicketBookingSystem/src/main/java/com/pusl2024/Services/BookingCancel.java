package com.pusl2024.Services;

import com.pusl2024.movieticketbookingsystem.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookingCancel {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int bookingCancel() {
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            Statement statement = connection.createStatement();
            statement.execute("rollback; commit; set AUTOCOMMIT = on;");

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(BookingCancel.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }

    public int bookingDone() {
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            Statement statement = connection.createStatement();
            statement.execute("commit;");
            statement.execute("set AUTOCOMMIT = on;");

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(BookingCancel.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }
}
