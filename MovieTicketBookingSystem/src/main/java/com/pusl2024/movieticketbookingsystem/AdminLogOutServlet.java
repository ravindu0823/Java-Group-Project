package com.pusl2024.movieticketbookingsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminLogOutServlet", value = "/AdminLogOutServlet")
public class AdminLogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookies[] = request.getCookies();

        for (Cookie c : cookies) {
            if (c.getName().equals("admin_id")) {
                c.setValue(0 + "");
                c.setMaxAge(60 * 60);
                response.addCookie(c);
            }
        }
        response.sendRedirect("admin/AdminLogIn.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
