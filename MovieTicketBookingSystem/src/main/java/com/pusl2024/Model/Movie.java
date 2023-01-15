package com.pusl2024.Model;

public class Movie {
    private int movieId;
    private String movieName;
    private String description;

    private String trailer;

    private String imagePath;
    private int timeSlotId;
    private int adminId;

    public Movie(int movieId, int adminId) {
        this.movieId = movieId;
        this.adminId = adminId;
    }

    public Movie(String movieName, String description, String trailer, String imagePath, int timeSlotId, int adminId) {
        this.movieName = movieName;
        this.description = description;
        this.trailer = trailer;
        this.imagePath = imagePath;
        this.timeSlotId = timeSlotId;
        this.adminId = adminId;
    }

    public Movie(int movieId, String movieName, String description, String trailer, String imagePath, int timeSlotId, int adminId) {
        this.movieId = movieId;
        this.movieName = movieName;
        this.description = description;
        this.trailer = trailer;
        this.imagePath = imagePath;
        this.timeSlotId = timeSlotId;
        this.adminId = adminId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getTimeSlotId() {
        return timeSlotId;
    }

    public void setTimeSlotId(int timeSlotId) {
        this.timeSlotId = timeSlotId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
}
