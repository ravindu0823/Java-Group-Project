package com.pusl2024.movieticketbookingsystem;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.pusl2024.Model.Booking;
import com.pusl2024.Services.BookingInsert;
import com.pusl2024.Services.GMailer;
import com.pusl2024.Services.PaymentServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ExecutePaymentServlet", value = "/ExecutePaymentServlet")
public class ExecutePaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

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

        Booking booking = new Booking(seatArray, fullName, email, totalInt, phoneInt, movieIdInt, dateIdInt, seatCountInt);

        BookingInsert bookingInsert = new BookingInsert();

        if (bookingInsert.ticketInsert(booking) == 0) {

        }

        try {
            GMailer gMailer = new GMailer();
            gMailer.sendMail("Movie Ticket Booking (ABC CINEMAS)", "Adoooo gammata mail eka send unaa", email);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);

            request.getRequestDispatcher("receipt.jsp").forward(request, response);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Cannot Execute the payment");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
