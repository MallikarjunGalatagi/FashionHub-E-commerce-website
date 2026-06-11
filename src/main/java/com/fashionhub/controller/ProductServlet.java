package com.fashionhub.controller;

import java.io.IOException;
import java.util.List;

import com.fashionhub.dao.CategoryDAO;
import com.fashionhub.dao.ProductDAO;
import com.fashionhub.dao.impl.CategoryDAOImpl;
import com.fashionhub.dao.impl.ProductDAOImpl;
import com.fashionhub.model.Category;
import com.fashionhub.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CategoryDAO categoryDAO = new CategoryDAOImpl();
    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Category> categories = categoryDAO.getAllCategories();

        String categoryId = request.getParameter("categoryId");
        String search = request.getParameter("search");

        List<Product> products;

        if (search != null && !search.trim().isEmpty()) {
            products = productDAO.searchProducts(search);
        } 
        else if (categoryId != null && !categoryId.trim().isEmpty()) {
            int cid = Integer.parseInt(categoryId);
            products = productDAO.getProductsByCategory(cid);
        } 
        else {
            products = productDAO.getAllProducts();
        }

        // 🔥 DEBUG (VERY IMPORTANT)
        System.out.println("Products fetched in servlet: " + products.size());

        request.setAttribute("categories", categories);
        request.setAttribute("products", products);

        // ✅ FIXED PATH
        request.getRequestDispatcher("/WEB-INF/views/products.jsp")
               .forward(request, response);
    }
}