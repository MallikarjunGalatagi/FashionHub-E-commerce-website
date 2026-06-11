package com.fashionhub.dao.impl;

import com.fashionhub.dao.ProductVariantDAO;
import com.fashionhub.model.ProductVariant;
import com.fashionhub.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductVariantDAOImpl implements ProductVariantDAO {

    private Connection connection;

    public ProductVariantDAOImpl() {
        connection = DBConnection.getConnection();
    }

    // Add Variant
    @Override
    public boolean addVariant(ProductVariant variant) {

        String sql = "INSERT INTO product_variants (product_id, size_label, stock_quantity) VALUES (?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, variant.getProductId());
            ps.setString(2, variant.getSizeLabel());
            ps.setInt(3, variant.getStockQuantity());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get Variant by ID
    @Override
    public ProductVariant getVariantById(int variantId) {

        String sql = "SELECT * FROM product_variants WHERE variant_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapVariant(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Get Variants by Product ID
    @Override
    public List<ProductVariant> getVariantsByProductId(int productId) {

        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM product_variants WHERE product_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapVariant(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Variants by Size
    @Override
    public List<ProductVariant> getVariantsBySize(String sizeLabel) {

        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM product_variants WHERE size_label = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, sizeLabel);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapVariant(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Available Variants (stock > 0)
    @Override
    public List<ProductVariant> getAvailableVariants() {

        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM product_variants WHERE stock_quantity > 0";

        try (Statement stmt = connection.createStatement()) {

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                list.add(mapVariant(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Update Variant
    @Override
    public boolean updateVariant(ProductVariant variant) {

        String sql = "UPDATE product_variants SET product_id=?, size_label=?, stock_quantity=? WHERE variant_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, variant.getProductId());
            ps.setString(2, variant.getSizeLabel());
            ps.setInt(3, variant.getStockQuantity());
            ps.setInt(4, variant.getVariantId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update Stock
    @Override
    public boolean updateStock(int variantId, int quantity) {

        String sql = "UPDATE product_variants SET stock_quantity=? WHERE variant_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, quantity);
            ps.setInt(2, variantId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete Variant
    @Override
    public boolean deleteVariant(int variantId) {

        String sql = "DELETE FROM product_variants WHERE variant_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, variantId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Helper Method
    private ProductVariant mapVariant(ResultSet rs) throws SQLException {

        ProductVariant variant = new ProductVariant();

        variant.setVariantId(rs.getInt("variant_id"));
        variant.setProductId(rs.getInt("product_id"));
        variant.setSizeLabel(rs.getString("size_label"));
        variant.setStockQuantity(rs.getInt("stock_quantity"));

        return variant;
    }
}