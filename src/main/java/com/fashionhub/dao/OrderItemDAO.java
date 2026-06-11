package com.fashionhub.dao;

import com.fashionhub.model.OrderItem;
import java.util.List;

public interface OrderItemDAO {

    // Insert order item (during checkout)
    boolean addOrderItem(OrderItem item);

    // Get all items of a specific order
    List<OrderItem> getItemsByOrderId(int orderId);
}