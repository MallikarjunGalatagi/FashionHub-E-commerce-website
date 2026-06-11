package com.fashionhub.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fashionhub.dao.ProductDAO;
import com.fashionhub.dao.impl.ProductDAOImpl;
import com.fashionhub.model.CartItem;
import com.fashionhub.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) cart = new ArrayList<>();

        if (action != null) {

            int productId = Integer.parseInt(request.getParameter("productId"));

            for (int i = 0; i < cart.size(); i++) {

                CartItem item = cart.get(i);

                if (item.getProductId() == productId) {

                    if ("increase".equals(action)) {
                        item.setQuantity(item.getQuantity() + 1);
                    }

                    else if ("decrease".equals(action)) {
                        item.setQuantity(item.getQuantity() - 1);

                        if (item.getQuantity() <= 0) {
                            cart.remove(i);
                        }
                    }

                    else if ("remove".equals(action)) {
                        cart.remove(i);
                    }

                    break;
                }
            }
        }

        session.setAttribute("cart", cart);

        request.getRequestDispatcher("/WEB-INF/views/cart.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        Product product = productDAO.getProductById(productId);

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) cart = new ArrayList<>();

        boolean found = false;

        for (CartItem item : cart) {
            if (item.getProductId() == productId) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            CartItem newItem = new CartItem();
            newItem.setProductId(productId);
            newItem.setQuantity(1);
            newItem.setUnitPrice(product.getPrice()); // ✅ IMPORTANT
            cart.add(newItem);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}