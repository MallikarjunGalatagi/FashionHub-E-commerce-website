package com.fashionhub.util;

import com.fashionhub.dao.ProductDAO;
import com.fashionhub.dao.impl.ProductDAOImpl;
import com.fashionhub.model.Product;

import java.util.List;

public class ProductTest {

    public static void main(String[] args) {

        ProductDAO productDAO = new ProductDAOImpl();

        List<Product> products = productDAO.getAllProducts();

        System.out.println("---- PRODUCT LIST ----");

        for (Product p : products) {
            System.out.println(
                    p.getProductId() + " | " +
                    p.getProductName() + " | " +
                    p.getCategoryId()
            );
        }
    }
}