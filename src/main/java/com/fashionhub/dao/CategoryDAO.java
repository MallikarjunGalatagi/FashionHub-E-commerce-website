package com.fashionhub.dao;

import java.util.List;
import com.fashionhub.model.Category;

public interface CategoryDAO {

    List<Category> getAllCategories();

    Category getCategoryById(int id);

    Category getCategoryByName(String name);

    boolean addCategory(Category category);

    boolean updateCategory(Category category);

    boolean deleteCategory(int id);
}