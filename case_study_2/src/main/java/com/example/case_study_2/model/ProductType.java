package com.example.case_study_2.model;

public class ProductType {
    private int productTypeId;
    private String  productTypeName;

    public ProductType() {
    }

    public ProductType(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    public ProductType(int productTypeId, String productTypeName) {
        this.productTypeId = productTypeId;
        this.productTypeName = productTypeName;
    }

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }
}
