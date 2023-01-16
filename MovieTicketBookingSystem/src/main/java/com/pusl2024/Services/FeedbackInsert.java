package com.pusl2024.Services;

import com.pusl2024.Model.Feedback;
import com.pusl2024.movieticketbookingsystem.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackInsert {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int feedbackInsert(Feedback feedback) {
        String feedbackUser = feedback.getFeedback();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_INSERT_FEEDBACK (?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setString(1, feedbackUser);

            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackInsert.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }

    public int feedbackDelete(Feedback feedback) {
        int feedbackId = feedback.getFeedbackId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_DELETE_FEEDBACK (?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, feedbackId);

            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackInsert.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }

    }
}
