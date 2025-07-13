package com.feedback.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate session
        request.getSession().invalidate();
        // Redirect to index.jsp with logout flag
        response.sendRedirect("index.jsp?logout=success");
    }
}
