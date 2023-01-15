package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Services.GMailer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EmailServlet", value = "/EmailServlet")
public class EmailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*PrintWriter printWriter = response.getWriter();

        String email = request.getParameter("email");

        GMailer javaMainUtil = new GMailer();

        try {
            if (javaMainUtil.sendMain(email)) {
                printWriter.println("Done");
            }
        } catch (Exception e) {
            printWriter.println(e.getMessage());
        }*/
    }
}
