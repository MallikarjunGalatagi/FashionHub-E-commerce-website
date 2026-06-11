package com.fashionhub.dao.impl;

import com.fashionhub.dao.CartItemDAO;
import com.fashionhub.model.CartItem;
import com.fashionhub.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartItemDAOImpl implements CartItemDAO {

    private Connection connection;

    public CartItemDAOImpl() {
        connection = DBConnection.getConnection();
    }

    // Add to Cart
    @Override
    public boolean addToCart(CartItem item) {

        // Check if item already exists
        CartItem existing = getCartItem(item.getCartId(), item.getProductId(), item.getSizeLabel());

        if (existing != null) {
            // Update quantity instead of inserting new
            int newQty = existing.getQuantity() + item.getQuantity();
            return updateQuantity(existing.getCartItemId(), newQty);
        }

        String sql = "INSERT INTO cart_items (cart_id, product_id, size_label, quantity, unit_price) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, item.getCartId());
            ps.setInt(2, item.getProductId());
            ps.setString(3, item.getSizeLabel());
            ps.setInt(4, item.getQuantity());
            ps.setDouble(5, item.getUnitPrice());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get all items in a cart
    @Override
    public List<CartItem> getCartItemsByCartId(int cartId) {

        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM cart_items WHERE cart_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapCartItem(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get specific cart item (for duplicate check)
    @Override
    public CartItem getCartItem(int cartId, int productId, String sizeLabel) {

        String sql = "SELECT * FROM cart_items WHERE cart_id=? AND product_id=? AND size_label=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            ps.setString(3, sizeLabel);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapCartItem(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update Quantity
    @Override
    public boolean updateQuantity(int cartItemId, int quantity) {

        String sql = "UPDATE cart_items SET quantity=? WHERE cart_item_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, quantity);
            ps.setInt(2, cartItemId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Remove item by ID
    @Override
    public boolean removeCartItem(int cartItemId) {

        String sql = "DELETE FROM cart_items WHERE cart_item_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartItemId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Remove specific product (cart + product + size)
    @Override
    public boolean removeByProduct(int cartId, int productId, String sizeLabel) {

        String sql = "DELETE FROM cart_items WHERE cart_id=? AND product_id=? AND size_label=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            ps.setString(3, sizeLabel);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Clear entire cart
    @Override
    public boolean clearCart(int cartId) {

        String sql = "DELETE FROM cart_items WHERE cart_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Helper Method
    private CartItem mapCartItem(ResultSet rs) throws SQLException {

        CartItem item = new CartItem();

        item.setCartItemId(rs.getInt("cart_item_id"));
        item.setCartId(rs.getInt("cart_id"));
        item.setProductId(rs.getInt("product_id"));
        item.setSizeLabel(rs.getString("size_label"));
        item.setQuantity(rs.getInt("quantity"));
        item.setUnitPrice(rs.getDouble("unit_price"));

        return item;
    }
}