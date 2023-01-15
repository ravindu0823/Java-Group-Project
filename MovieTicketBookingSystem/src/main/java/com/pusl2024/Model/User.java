package com.pusl2024.Model;

public class User {
    private String username;
    private String email;
    private int userId;
    private int phoneNumber;

    public User(int userId) {
        this.userId = userId;
    }

    public User(String username, String email, int userId, int phoneNumber) {
        this.username = username;
        this.email = email;
        this.userId = userId;
        this.phoneNumber = phoneNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
