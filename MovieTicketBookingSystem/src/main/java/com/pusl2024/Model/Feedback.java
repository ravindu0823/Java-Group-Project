package com.pusl2024.Model;

public class Feedback {
    private String feedback;
    private int feedbackId;

    public Feedback(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Feedback(String feedback) {
        this.feedback = feedback;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
