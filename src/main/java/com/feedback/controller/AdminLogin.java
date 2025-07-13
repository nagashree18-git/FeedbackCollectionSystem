package com.feedback.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/login")
public class AdminLogin extends HttpServlet {
	// Handles GET request (when user visits /login directly)
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Forward to login.jsp page
	    request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	// Handles POST request (form submission)
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    // Hardcoded credentials (you can externalize later)
	    if ("admin".equals(username) && "password".equals(password)) {
	        // Set session attribute to mark login
	        request.getSession().setAttribute("admin", true);
	        // Redirect to admin dashboard
	        response.sendRedirect("admin");
	    } else {
	        // Login failed — show error on login page
	        request.setAttribute("error", "Invalid credentials");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}
}