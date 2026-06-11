package com.fashionhub.dao;

import com.fashionhub.model.ProductVariant;
import java.util.List;

public interface ProductVariantDAO {

    // Create
    boolean addVariant(ProductVariant variant);

    // Read
    ProductVariant getVariantById(int variantId);
    List<ProductVariant> getVariantsByProductId(int productId);

    // Filters (VERY IMPORTANT 🔥)
    List<ProductVariant> getVariantsBySize(String sizeLabel);
    List<ProductVariant> getAvailableVariants(); // stock > 0

    // Update
    boolean updateVariant(ProductVariant variant);
    boolean updateStock(int variantId, int quantity);

    // Delete
    boolean deleteVariant(int variantId);
}