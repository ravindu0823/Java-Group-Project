package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Feedback;
import com.pusl2024.Services.FeedbackInsert;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FeedbackDeleteServlet", value = "/FeedbackDeleteServlet")
public class FeedbackDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("feedback_id"));

        Feedback feedback = new Feedback(feedbackId);
        FeedbackInsert feedbackInsert = new FeedbackInsert();


        if (feedbackInsert.feedbackDelete(feedback) == 0) {
            response.sendRedirect("admin/feedback.jsp");
        }
    }
}
