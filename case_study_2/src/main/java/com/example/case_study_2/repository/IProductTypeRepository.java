package com.example.case_study_2.repository;

import com.example.case_study_2.model.ProductType;

import java.util.List;

public interface IProductTypeRepository {
    List<ProductType> getAll();
}
