package com.example.case_study_2.model;

public class Product {
//    product_id int primary key auto_increment,
//product_name varchar(100) not null,
//product_description text not null,
//price double not null,
//image text not null,
//product_type_id int,
    private int productId;
    private String productName;
    private String productDescription;
    private double price;
    private String image;
    private ProductType productTypeId;

    public Product() {
    }

    public Product(String productName, String productDescription, double price, String image, ProductType productTypeId) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.price = price;
        this.image = image;
        this.productTypeId = productTypeId;
    }

    public Product(int productId, String productName, String productDescription, double price, String image,
                   ProductType productTypeId) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.price = price;
        this.image = image;
        this.productTypeId = productTypeId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ProductType getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(ProductType productTypeId) {
        this.productTypeId = productTypeId;
    }
}
