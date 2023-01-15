package com.pusl2024.Model;

public class Booking {
    private String seatArray;
    private String customerName;
    private String email;
    private int totalPrice;
    private int phone;
    private int movieId;
    private int dateId;
    private int seatCount;

    public Booking(String seatArray, String customerName, String email, int totalPrice, int phone, int movieId, int dateId, int seatCount) {
        this.seatArray = seatArray;
        this.customerName = customerName;
        this.email = email;
        this.totalPrice = totalPrice;
        this.phone = phone;
        this.movieId = movieId;
        this.dateId = dateId;
        this.seatCount = seatCount;
    }

    public String getSeatArray() {
        return seatArray;
    }

    public void setSeatArray(String seatArray) {
        this.seatArray = seatArray;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getDateId() {
        return dateId;
    }

    public void setDateId(int dateId) {
        this.dateId = dateId;
    }

    public int getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(int seatCount) {
        this.seatCount = seatCount;
    }
}
