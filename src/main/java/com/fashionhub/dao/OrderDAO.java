package com.fashionhub.dao;

import com.fashionhub.model.Order;
import java.util.List;

public interface OrderDAO {

    // Create
    boolean placeOrder(Order order);

    // Read
    Order getOrderById(int orderId);
    List<Order> getOrdersByUserId(int userId);
    List<Order> getAllOrders();

    // Update
    boolean updateOrderStatus(int orderId, String status);

    // Delete (optional)
    boolean deleteOrder(int orderId);
}