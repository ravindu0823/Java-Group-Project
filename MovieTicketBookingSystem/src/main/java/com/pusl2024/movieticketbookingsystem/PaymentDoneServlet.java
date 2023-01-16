package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Booking;
import com.pusl2024.Services.BookingCancel;
import com.pusl2024.Services.BookingInsert;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PaymentDoneServlet", value = "/PaymentDoneServlet")
public class PaymentDoneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        String seatArray = (String) httpSession.getAttribute("seat_array");
        String fullName = (String) httpSession.getAttribute("full_name");
        String email = (String) httpSession.getAttribute("email");
        String total = (String) httpSession.getAttribute("final_price");
        int totalInt = Integer.parseInt(total);
        String phone = (String) httpSession.getAttribute("phone_number");
        int phoneInt = Integer.parseInt(phone);
        String movieId = (String) httpSession.getAttribute("movie_id");
        int movieIdInt = Integer.parseInt(movieId);
        String dateId = (String) httpSession.getAttribute("date_id");
        int dateIdInt = Integer.parseInt(dateId);
        String seatCount = (String) httpSession.getAttribute("seat_count");
        int seatCountInt = Integer.parseInt(seatCount);

        String transactionId = (String) httpSession.getAttribute("transaction_id");

        Booking booking = new Booking(seatArray, fullName, email, totalInt, phoneInt, movieIdInt, dateIdInt, seatCountInt, transactionId);

        BookingInsert bookingInsert = new BookingInsert();

        if (bookingInsert.ticketInsert(booking) == 0) {
            response.sendRedirect("index.jsp");
        }



        /*BookingCancel bookingCancel = new BookingCancel();

        if (bookingCancel.bookingDone() == 0) {
            response.sendRedirect("index.jsp");
        }*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
