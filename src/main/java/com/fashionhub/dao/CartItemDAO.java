package com.fashionhub.dao;

import com.fashionhub.model.CartItem;
import java.util.List;

public interface CartItemDAO {

    // Create
    boolean addToCart(CartItem item);

    // Read
    List<CartItem> getCartItemsByCartId(int cartId);

    CartItem getCartItem(int cartId, int productId, String sizeLabel);

    // Update
    boolean updateQuantity(int cartItemId, int quantity);

    // Delete
    boolean removeCartItem(int cartItemId);
    boolean removeByProduct(int cartId, int productId, String sizeLabel);

    // Utility
    boolean clearCart(int cartId);
}