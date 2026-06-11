package com.fashionhub.controller;

import java.io.IOException;

import com.fashionhub.dao.ProductDAO;
import com.fashionhub.dao.impl.ProductDAOImpl;
import com.fashionhub.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product")
public class ProductDetailsServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        // 🔹 If no ID, redirect
        if (id == null || id.isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        int productId = Integer.parseInt(id);

        // 🔹 Fetch product
        Product product = productDAO.getProductById(productId);

        // 🔹 Send to JSP
        request.setAttribute("product", product);

        request.getRequestDispatcher("WEB-INF/views/product-details.jsp")
               .forward(request, response);
    }
}