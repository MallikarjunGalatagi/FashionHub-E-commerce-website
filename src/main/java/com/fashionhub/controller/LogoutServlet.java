package com.fashionhub.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔥 DESTROY SESSION
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // 🔥 REDIRECT TO HOME PAGE
        response.sendRedirect(request.getContextPath() + "/");
    }
}