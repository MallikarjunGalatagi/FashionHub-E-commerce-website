package com.fashionhub.util;

import com.fashionhub.dao.ProductDAO;
import com.fashionhub.dao.impl.ProductDAOImpl;
import com.fashionhub.model.Product;

import java.util.List;

public class ProductSearchTest {

    public static void main(String[] args) {

        ProductDAO dao = new ProductDAOImpl();

        List<Product> list = dao.searchProducts("Shirt");

        System.out.println("---- SEARCH RESULTS ----");

        for (Product p : list) {
            System.out.println(p.getProductName());
        }
    }
}