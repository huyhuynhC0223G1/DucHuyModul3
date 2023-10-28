package com.example.case_study_2.service;

import com.example.case_study_2.model.ProductType;
import com.example.case_study_2.repository.IProductTypeRepository;
import com.example.case_study_2.repository.ProductTypeRepository;
import com.example.case_study_2.service.IProductTypeService;

import java.util.List;

public class ProductTypeService implements IProductTypeService {
    private IProductTypeRepository productTypeRepository = new ProductTypeRepository();
    @Override
    public List<ProductType> getAll() {
        return productTypeRepository.getAll();
    }
}
