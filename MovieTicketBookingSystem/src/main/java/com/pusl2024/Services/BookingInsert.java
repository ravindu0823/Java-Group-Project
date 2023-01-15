package com.pusl2024.Services;

import com.pusl2024.Model.Booking;
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

public class BookingInsert {
    Connection connection;
    Statement statement;
    PreparedStatement preparedStatement;

    public int ticketInsert(Booking booking) {
        String seatArray = booking.getSeatArray();
        String customerName = booking.getCustomerName();
        String email = booking.getEmail();
        int totalPrice = booking.getTotalPrice();
        int phone = booking.getPhone();
        int movieId = booking.getMovieId();
        int dateId = booking.getDateId();
        int seatCount = booking.getSeatCount();

        String transactionId = UUID.randomUUID().toString();

        String[] seats = seatArray.split(",");
        int[] seatsInt = new int[seats.length];
        for (int i = 0; i < seatsInt.length; i++) {
            seatsInt[i] = Integer.parseInt(seats[i]);
        }

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL INSERT_Customer_payment (?, ?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setString(1, customerName);
            stmt.setString(2, email);
            stmt.setInt(3, phone);
            stmt.setInt(4, totalPrice);
            stmt.setString(5, transactionId);


            ResultSet rs = stmt.executeQuery();
            rs.next();
            int customerId = rs.getInt(1);

            query = "{CALL SP_INSERT_BOOKING (?, ?, ?, ?)}";
            stmt = connection.prepareCall(query);

            stmt.setInt(1, movieId);
            stmt.setInt(2, dateId);
            stmt.setInt(3, customerId);
            stmt.setInt(4, seatCount);

            rs = stmt.executeQuery();
            rs.next();
            int bookingId = rs.getInt(1);

            for (int i = 0; i < seatsInt.length; i++) {
                query = "{CALL SP_BOOKINGSEAT_BOOKING (?, ?)}";
                stmt = connection.prepareCall(query);

                stmt.setInt(1, bookingId);
                stmt.setInt(2, seatsInt[i]);

                rs = stmt.executeQuery();
            }

            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(MovieInsert.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }



    }


}
