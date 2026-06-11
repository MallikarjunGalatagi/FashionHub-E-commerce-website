package com.fashionhub.util;

import com.fashionhub.dao.CartDAO;
import com.fashionhub.dao.impl.CartDAOImpl;
import com.fashionhub.model.Cart;

public class CartTest {

    public static void main(String[] args) {

        CartDAO dao = new CartDAOImpl();

        // Create Cart
        boolean created = dao.createCart(1);
        System.out.println("Cart Created: " + created);

        // Get Cart
        Cart cart = dao.getCartByUserId(1);

        if (cart != null) {
            System.out.println("Cart ID: " + cart.getCartId());
            System.out.println("User ID: " + cart.getUserId());
        } else {
            System.out.println("Cart not found");
        }
    }
}