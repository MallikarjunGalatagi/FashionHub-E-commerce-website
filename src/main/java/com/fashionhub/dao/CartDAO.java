package com.fashionhub.dao;

import com.fashionhub.model.Cart;

public interface CartDAO {

    // Create
    boolean createCart(int userId);

    // Read
    Cart getCartById(int cartId);
    Cart getCartByUserId(int userId);

    // Validation
    boolean cartExists(int userId);

    // Delete
    boolean deleteCart(int cartId);
}