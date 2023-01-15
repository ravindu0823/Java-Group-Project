package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Movie;
import com.pusl2024.Services.MovieUpdate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MovieUpdateServlet", value = "/MovieUpdateServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class MovieUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookies[] = request.getCookies();
        int adminId1 = 0;

        for (Cookie c : cookies) {
            if (c.getName().equals("admin_id")) {
                adminId1 = Integer.parseInt(c.getValue());
            }
        }

        int movieId = Integer.parseInt(request.getParameter("movie_id1"));
        String movieName = request.getParameter("name1");
        String description = request.getParameter("description1");
        String trailer = request.getParameter("trailer1");
        int timeSlot = Integer.parseInt(request.getParameter("time_slot1"));

        Part part = request.getPart("image1");
        String fileName = extractFileName(part);
        String savePath = "E:\\Java Group Project\\Intellij\\MovieTicketBookingSystem\\src\\main\\webapp\\img\\" + File.separator + fileName;
        File file = new File(savePath);

        part.write(savePath + File.separator);

        Movie movie = new Movie(movieId, movieName, description, trailer, fileName, timeSlot, adminId1);

        MovieUpdate movieUpdate = new MovieUpdate();

        if (movieUpdate.movieUpdate(movie) == 0) {
            response.sendRedirect("admin/movies.jsp");
        }
    }

    private String extractFileName(Part part) {
        String contentDesc = part.getHeader("content-disposition");
        String[] items = contentDesc.split(";");

        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }

        return "";
    }
}
