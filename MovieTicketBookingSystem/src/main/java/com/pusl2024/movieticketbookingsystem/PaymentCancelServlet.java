package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Services.BookingCancel;
import com.pusl2024.Services.GMailer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PaymentCancelServlet", value = "/PaymentCancelServlet")
public class PaymentCancelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        String email = (String) httpSession.getAttribute("email");
        String fullName = (String) httpSession.getAttribute("full_name");


        try {
            GMailer gMailer = new GMailer();
            String message = "Dear " + fullName + ",\nWe regret to inform you that your recent payment for Online Movie Ticket Booking has been cancelled.\nPlease note that any funds that have been deducted from your account will be refunded within 24 hours. If you have any questions or concerns, please do not hesitate to contact us at.\nThank you for your understanding.\n\nSincerely,\nABC CINEMAS PVT LTD";
            gMailer.sendMail("ABC CINEMAS - Payment Cancellation Notice", message, email);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("cancel.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
