package com.example.case_study_2.service.impl;

import com.example.case_study_2.model.Product;
import com.example.case_study_2.repository.IProductRepository;
import com.example.case_study_2.repository.impl.ProductRepository;
import com.example.case_study_2.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> showAll() {
        return iProductRepository.showAll();
    }

    @Override
    public void createNewProduct(Product product) {
        iProductRepository.createNewProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        iProductRepository.updateProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepository.deleteProduct(id);
    }

    @Override
    public Product selectProductById(int id) {
        return iProductRepository.selectProductById(id);
    }
}
