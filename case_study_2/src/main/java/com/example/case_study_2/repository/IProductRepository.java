package com.example.case_study_2.repository;

import com.example.case_study_2.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showAll();
    void createNewProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
    Product selectProductById(int id);
}
