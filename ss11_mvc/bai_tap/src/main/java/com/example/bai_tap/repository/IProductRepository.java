package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showAll();
    void addNewProduct(Product product);
    void deleteProduct(int id);
    void editProduct(int id, Product product);
    int checkProductId(int id);

}
