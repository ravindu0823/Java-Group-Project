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
import java.util.UUID;

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

        /*Booking booking = new Booking(seatArray, fullName, email, totalInt, phoneInt, movieIdInt, dateIdInt, seatCountInt);

        BookingInsert bookingInsert = new BookingInsert();*/
        String transactionId = UUID.randomUUID().toString();
        httpSession.setAttribute("transaction_id", transactionId);

        /*if (bookingInsert.ticketInsert(booking) == 0) {
            transactionId = booking.getTransactionId();
        }*/

        try {
            GMailer gMailer = new GMailer();
            String message = "Dear " + fullName + ",\nWe are writing to confirm that we have received your payment of $" + total + " for Online Movie Ticket Booking. We appreciate your prompt attention to this matter.\nYour transaction details are as follows:\n\n-- Transaction ID: " + transactionId + "\n--Phone number: " + phone + "\n--Tickets: " + seatCount + "\n--Payment method: PayPal\n--Date of payment: " + java.time.LocalDate.now() + "\n\nPlease keep a copy of this email for your records. If you have any questions or concerns, please do not hesitate to contact us.\nThank you for doing business with us.\n\nSincerely,\nABC CINEMAS PVT LTD";
            gMailer.sendMail("ABC CINEMAS - Payment Received", message, email);
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
