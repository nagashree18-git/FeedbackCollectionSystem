package com.feedback.model;

import java.sql.Timestamp;

public class Feedback {
    private int id;
    private String name;
    private int rating;
    private String comments;
    private boolean reviewed;
    private Timestamp submittedAt;

    // Getter and Setter for id
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for rating
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }

    // Getter and Setter for comments
    public String getComments() {
        return comments;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }

    // Getter and Setter for reviewed
    public boolean isReviewed() {
        return reviewed;
    }
    public void setReviewed(boolean reviewed) {
        this.reviewed = reviewed;
    }

    // Getter and Setter for submittedAt
    public Timestamp getSubmittedAt() {
        return submittedAt;
    }
    public void setSubmittedAt(Timestamp submittedAt) {
        this.submittedAt = submittedAt;
    }
}
