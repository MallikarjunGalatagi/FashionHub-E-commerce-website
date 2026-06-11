package com.fashionhub.dao;

import java.util.List;
import com.fashionhub.model.User;

public interface UserDAO {

    // 🔹 REGISTER USER
    boolean addUser(User user);

    // 🔹 LOGIN USER
    User login(String email, String password);

    // 🔹 GET USER BY ID
    User getUserById(int userId);

    // 🔹 GET ALL USERS (optional - admin use)
    List<User> getAllUsers();

    // 🔹 UPDATE USER
    boolean updateUser(User user);

    // 🔹 DELETE USER
    boolean deleteUser(int userId);
}