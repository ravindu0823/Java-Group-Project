package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Admin;
import com.pusl2024.Services.AdminLogin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession httpSession = request.getSession();


        if (username.equals("") || password.equals("")) {
            response.sendRedirect("admin/AdminLogIn.jsp");
        } else {
            Admin admin = new Admin(username, password);

            AdminLogin adminLogin = new AdminLogin();
            switch (adminLogin.loginValidate(admin)) {
                case 0:
                    int adminId = admin.getAdminId();
                    Cookie cookies[] = request.getCookies();

                    for (Cookie c : cookies) {
                        if (c.getName().equals("admin_id")) {
                            c.setValue(adminId + "");
                            c.setMaxAge(60 * 60);
                            response.addCookie(c);
                        } else {
                            Cookie adId = new Cookie("admin_id", adminId + "");
                            adId.setMaxAge(60 * 60);
                            response.addCookie(adId);
                        }
                    }
                    response.sendRedirect("admin/Adminpan.jsp");
                    break;
                case 1:
                    // Username and password are incorrect
                    httpSession.setAttribute("error_code", "1");
                    response.sendRedirect("admin/AdminLogIn.jsp");
                    break;
                case 2:
                    // user.setError(2);
                    httpSession.setAttribute("error_code", "2");
                    response.sendRedirect("admin/AdminLogIn.jsp");
                    break;
                default:
                    break;
            }
        }


    }
}
