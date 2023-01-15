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

public class MovieUpdate {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int movieUpdate(Movie movie) {
        String movieName = movie.getMovieName();
        String description = movie.getDescription();
        String trailer = movie.getTrailer();
        String filePath = movie.getImagePath();
        int adminId = movie.getAdminId();
        int timeSlotId = movie.getTimeSlotId();
        int movieId = movie.getMovieId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_Updatemovie (?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, movieId);
            stmt.setString(2, movieName);
            stmt.setInt(3, timeSlotId);
            stmt.setInt(4, adminId);
            stmt.setString(5, description);
            stmt.setString(6, trailer);
            stmt.setString(7, filePath);

            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(MovieUpdate.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }
}
