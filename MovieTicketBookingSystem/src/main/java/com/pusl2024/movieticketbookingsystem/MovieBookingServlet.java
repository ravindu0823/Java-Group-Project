package com.pusl2024.movieticketbookingsystem;

import com.paypal.base.rest.PayPalRESTException;
import com.pusl2024.Model.Order;
import com.pusl2024.Services.PaymentServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MovieBookingServlet", value = "/MovieBookingServlet")
public class MovieBookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String seatArray = request.getParameter("seats");
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        int dateId = Integer.parseInt(request.getParameter("date_id"));
        int timeSlotId = Integer.parseInt(request.getParameter("time_slot_id"));
        int seatCount = Integer.parseInt(request.getParameter("seat_count"));
        int totalPrice = Integer.parseInt(request.getParameter("total_price"));

        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("seat_array", seatArray);
        httpSession.setAttribute("movie_id", movieId + "");
        httpSession.setAttribute("date_id", dateId + "");
        httpSession.setAttribute("time_slotId", timeSlotId + "");
        httpSession.setAttribute("seat_count", seatCount + "");
        httpSession.setAttribute("total_price", totalPrice + "");

        response.sendRedirect("checkout.jsp");

        /*String[] seatsArr = seatArray.split(",");
        int[] seats = new int[seatsArr.length];

        for (int i = 0; i < seats.length; i++) {
            seats[i] = Integer.parseInt(seatsArr[i]);
        }*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        String subTotal = request.getParameter("sub_total");
        String shipping = request.getParameter("shipping");
        String tax = request.getParameter("tax");
        String total = request.getParameter("total");

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String fullName = firstName + " " + lastName;

        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("email", email + "");
        httpSession.setAttribute("full_name", fullName + "");
        httpSession.setAttribute("phone_number", phone + "");
        httpSession.setAttribute("final_price", total + "");

        Order orderDetail = new Order(product, subTotal, shipping, tax, total);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = null;

            approvalLink = paymentServices.authorizePayment(orderDetail);
            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid Payment Details: Check your total");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }



    }
}
