package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.User;
import com.pusl2024.Services.ManageUsers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserUpdateServlet", value = "/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String userName = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        int phone = Integer.parseInt(request.getParameter("phone_number"));

        User user = new User(userName, email, userId, phone);
        ManageUsers manageUsers = new ManageUsers();

        if (manageUsers.userUpdate(user) == 0) {
            response.sendRedirect("admin/user.jsp");
        }
    }
}
