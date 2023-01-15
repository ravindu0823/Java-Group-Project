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

public class DeleteMovie {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int movieDelete(Movie movie) {
        int movieId = movie.getMovieId();
        int adminId = movie.getAdminId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL Delete_movie (?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, movieId);
            stmt.setInt(2, adminId);

            ResultSet rs = stmt.executeQuery();

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(DeleteMovie.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }
}
