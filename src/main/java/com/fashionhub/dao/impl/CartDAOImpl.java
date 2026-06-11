package com.fashionhub.dao.impl;

import com.fashionhub.dao.CartDAO;
import com.fashionhub.model.Cart;
import com.fashionhub.util.DBConnection;

import java.sql.*;

public class CartDAOImpl implements CartDAO {

    private Connection connection;

    public CartDAOImpl() {
        connection = DBConnection.getConnection();
    }

    // Create Cart
    @Override
    public boolean createCart(int userId) {

        String sql = "INSERT INTO cart (user_id) VALUES (?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get Cart by ID
    @Override
    public Cart getCartById(int cartId) {

        String sql = "SELECT * FROM cart WHERE cart_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapCart(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Get Cart by User ID
    @Override
    public Cart getCartByUserId(int userId) {

        String sql = "SELECT * FROM cart WHERE user_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapCart(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Check Cart Exists
    @Override
    public boolean cartExists(int userId) {

        String sql = "SELECT COUNT(*) FROM cart WHERE user_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete Cart
    @Override
    public boolean deleteCart(int cartId) {

        String sql = "DELETE FROM cart WHERE cart_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Helper Method
    private Cart mapCart(ResultSet rs) throws SQLException {

        Cart cart = new Cart();

        cart.setCartId(rs.getInt("cart_id"));
        cart.setUserId(rs.getInt("user_id"));

        return cart;
    }
}