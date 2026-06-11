package com.fashionhub.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/fashion_hub";
    private static final String USER = "root";
    private static final String PASSWORD = "root"; // 🔥 CHANGE THIS

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("✅ DB Connected Successfully");

            return con;

        } catch (Exception e) {
            System.out.println("❌ DB Connection Failed");
            e.printStackTrace();
        }

        return null;
    }
}