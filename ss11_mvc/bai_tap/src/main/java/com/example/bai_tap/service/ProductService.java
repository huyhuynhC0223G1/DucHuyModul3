package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private ProductRepository productRepository =new ProductRepository();
    @Override
    public List<Product> showAll() {
        List<Product> productList = productRepository.showAll();
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {
        productRepository.addNewProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public void editProduct(int id, Product product) {
        productRepository.editProduct(id, product);
    }
    @Override
    public Product productById(int id) {
        for (Product product : productRepository.showAll()) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}
