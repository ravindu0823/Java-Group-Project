package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.User;
import com.pusl2024.Services.ManageUsers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDeleteServlet", value = "/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id"));

        User user = new User(userId);
        ManageUsers manageUsers = new ManageUsers();

        if (manageUsers.userDelete(user) == 0) {
            response.sendRedirect("admin/user.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
