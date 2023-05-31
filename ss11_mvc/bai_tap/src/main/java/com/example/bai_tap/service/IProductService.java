package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showAll();
    void addNewProduct(Product product);
    void deleteProduct(int id);
    void editProduct(int id, Product product);
    Product productById(int id);
}
