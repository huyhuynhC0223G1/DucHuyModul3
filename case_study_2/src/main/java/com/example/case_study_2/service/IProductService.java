package com.example.case_study_2.service;

import com.example.case_study_2.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showAll();
    void createNewProduct(Product product);
    void updateProduct(int id);
    void deleteProduct(int id);
}
