package com.fashionhub.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.fashionhub.dao.OrderDAO;
import com.fashionhub.dao.impl.OrderDAOImpl;
import com.fashionhub.model.CartItem;
import com.fashionhub.model.Order;
import com.fashionhub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAOImpl();

    // 🔹 SHOW CHECKOUT PAGE
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
               .forward(request, response);
    }

    // 🔹 HANDLE PLACE ORDER
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔹 Get logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // not logged in → redirect to login
            response.sendRedirect("login");
            return;
        }

        // 🔹 Get cart
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        // 🔹 Get form data
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");

        // 🔹 Basic validation
        if (address == null || address.trim().isEmpty()) {
            request.setAttribute("error", "Address is required");
            request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                   .forward(request, response);
            return;
        }

        // 🔹 Calculate total
        double total = 0;
        for (CartItem item : cart) {
            total += item.getUnitPrice() * item.getQuantity();
        }

        // 🔹 Create order object
        Order order = new Order();
        order.setUserId(user.getUserId()); // ✅ dynamic user
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setTotalAmount(total);
        order.setPaymentMethod(payment);
        order.setOrderStatus("PLACED");
        order.setDeliveryAddress(address);

        // 🔹 Save order
        boolean placed = orderDAO.placeOrder(order);

        if (placed) {

            // 🔥 clear cart
            session.removeAttribute("cart");

            // 🔥 success message
            request.setAttribute("message", "Order placed successfully!");

            request.getRequestDispatcher("/WEB-INF/views/order-success.jsp")
                   .forward(request, response);

        } else {

            request.setAttribute("error", "Order failed. Try again.");
            request.getRequestDispatcher("/WEB-INF/views/checkout.jsp")
                   .forward(request, response);
        }
    }
}