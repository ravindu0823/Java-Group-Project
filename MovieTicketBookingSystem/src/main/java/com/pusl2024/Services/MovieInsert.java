package com.pusl2024.Services;

import com.pusl2024.Model.Movie;
import com.pusl2024.movieticketbookingsystem.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MovieInsert {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int movieInsert(Movie movie) {
        String movieName = movie.getMovieName();
        String description = movie.getDescription();
        String trailer = movie.getTrailer();
        String filePath = movie.getImagePath();
        int adminId = movie.getAdminId();
        int timeSlotId = movie.getTimeSlotId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_insertMovie (?, ?, ?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setString(1, movieName);
            stmt.setInt(2, timeSlotId);
            stmt.setInt(3, adminId);
            stmt.setString(4, description);
            stmt.setString(5, trailer);
            stmt.setString(6, filePath);


            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(MovieInsert.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
        
    }
}
