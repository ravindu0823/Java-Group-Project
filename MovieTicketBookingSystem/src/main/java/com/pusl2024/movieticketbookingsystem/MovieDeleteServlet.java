package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Movie;
import com.pusl2024.Services.DeleteMovie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MovieDeleteServlet", value = "/MovieDeleteServlet")
public class MovieDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = 0;

        Cookie[] cookies = request.getCookies();

        for (Cookie c : cookies) {
            if (c.getName().equals("admin_id")) {
                adminId = Integer.parseInt(c.getValue());
            }
        }

        int movieId = Integer.parseInt(request.getParameter("movie_id"));

        Movie movie = new Movie(movieId, adminId);
        DeleteMovie deleteMovie = new DeleteMovie();

        if (deleteMovie.movieDelete(movie) == 0) {
            response.sendRedirect("admin/movies.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
