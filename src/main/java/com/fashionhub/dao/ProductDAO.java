package com.fashionhub.dao;

import java.util.List;
import com.fashionhub.model.Product;

public interface ProductDAO {

    // CREATE
    boolean addProduct(Product product);

    // READ
    List<Product> getAllProducts();

    Product getProductById(int productId);

    List<Product> getProductsByCategory(int categoryId);

    List<Product> searchProducts(String keyword);

    List<Product> getLatestProducts(int limit);

    // UPDATE
    boolean updateProduct(Product product);

    // DELETE
    boolean deleteProduct(int productId);
}