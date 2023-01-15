package com.pusl2024.movieticketbookingsystem;

import com.pusl2024.Model.Movie;
import com.pusl2024.Services.MovieInsert;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "MovieInsertServlet", value = "/MovieInsertServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class MovieInsertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookies[] = request.getCookies();
        int adminId = 0;

        for (Cookie c : cookies) {
            if (c.getName().equals("admin_id")) {
                adminId = Integer.parseInt(c.getValue());
            }
        }

        String movieName = request.getParameter("name");
        String description = request.getParameter("description");
        String trailer = request.getParameter("trailer");
        int timeSlot = Integer.parseInt(request.getParameter("time_slot"));

        Part part = request.getPart("image");
        String fileName = extractFileName(part);
        String savePath = "E:\\Java Group Project\\Intellij\\MovieTicketBookingSystem\\src\\main\\webapp\\img\\" + File.separator + fileName;
        File file = new File(savePath);

        part.write(savePath + File.separator);

        Movie movie = new Movie(movieName, description, trailer, fileName, timeSlot, adminId);

        MovieInsert movieInsert = new MovieInsert();

        if (movieInsert.movieInsert(movie) == 0) {
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
