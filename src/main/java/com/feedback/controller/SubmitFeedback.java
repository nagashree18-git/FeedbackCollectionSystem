package com.feedback.controller;
import com.feedback.dao.FeedbackDAO;
import com.feedback.model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/submit")
public class SubmitFeedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Feedback feedback = new Feedback();
        feedback.setName(request.getParameter("name"));
        feedback.setRating(Integer.parseInt(request.getParameter("rating")));
        feedback.setComments(request.getParameter("comments"));

        try {
            // Create instance of DAO
            FeedbackDAO dao = new FeedbackDAO();
            dao.saveFeedback(feedback); // Correct non-static call
            response.sendRedirect("thankyou.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error saving feedback: " + e.getMessage());
        }
    }

    // Optional GET handler to redirect if accessed directly
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp"); // change if your form is on a different page
    }
}
