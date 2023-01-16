package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Feedback;
import com.pusl2024.Services.FeedbackInsert;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FeedbackServlet", value = "/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedback = request.getParameter("feedback");

        Feedback feedback1 = new Feedback(feedback);
        FeedbackInsert feedbackInsert = new FeedbackInsert();

        if (feedbackInsert.feedbackInsert(feedback1) == 0) {
            response.sendRedirect("PaymentDoneServlet");
        }
    }
}
