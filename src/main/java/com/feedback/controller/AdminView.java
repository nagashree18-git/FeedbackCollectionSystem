package com.feedback.controller;

import com.feedback.dao.FeedbackDAO;
import com.feedback.model.Feedback;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminView extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            FeedbackDAO dao = new FeedbackDAO();
            List<Feedback> feedbacks = dao.getAll("all");  // Fetch all feedbacks
            request.setAttribute("feedbacks", feedbacks);

            // ✅ This is the important part: forward to JSP with the data
            request.getRequestDispatcher("adminView.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading feedbacks: " + e.getMessage());
        }
    }
}
