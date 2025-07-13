package com.feedback.controller;

import com.feedback.dao.FeedbackDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/markReviewed")
public class MarkReviewed extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            FeedbackDAO dao = new FeedbackDAO();
            dao.markReviewed(id);
            response.sendRedirect("admin");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error marking feedback as reviewed.");
        }
    }
}