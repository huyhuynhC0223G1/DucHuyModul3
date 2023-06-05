package com.example.case_study_2.repository.impl;

import com.example.case_study_2.model.Product;
import com.example.case_study_2.model.ProductType;
import com.example.case_study_2.repository.BaseRepository;
import com.example.case_study_2.repository.IProductRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String INSERT = "insert into products(product_name, product_description, price, image, product_type_id) values(?, ?, ?, ?, ?);";
    private static final String SELECT = "select p.*, pt.product_type_name from products p join product_type pt on pt.product_type_id = p.product_type_id;";
    private static final String DELETE = "delete from products where product_id = ?";
    private static final String UPDATE = "update products set product_name = ?, product_description = ?, price = ?, image = ?, product_type_id = ? where product_id = ?;";
    private static final String SELECT_PRODUCT_BY_ID = "select p.*, pt.product_type_name from products p join product_type pt on pt.product_type_id = p.product_type_id;";

    @Override
    public List<Product> showAll() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int productTypeId = resultSet.getInt("product_type_id");
                String productTypeName = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(productTypeId, productTypeName);
                productList.add(new Product(id, productName, productDescription, price, image, productType));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public void createNewProduct(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setString(2, product.getProductDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getProductTypeId().getProductTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    @Override
    public void updateProduct(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
    PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
    preparedStatement.setString(1, product.getProductName());
    preparedStatement.setString(2, product.getProductDescription());
    preparedStatement.setDouble(3, product.getPrice());
    preparedStatement.setString(4, product.getImage());
    preparedStatement.setInt(5, product.getProductTypeId().getProductTypeId());
    preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
Connection connection = BaseRepository.getConnection();
try{
    PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
    preparedStatement.setInt(1, id);
    preparedStatement.executeUpdate();
} catch (SQLException throwables) {
    throwables.printStackTrace();
}
    }

    @Override
    public Product selectProductById(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int productTypeId = resultSet.getInt("product_type_id");
                String productTypeName = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(productTypeId, productTypeName);
                product = new Product(id, productName, productDescription, price, image, productType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }
}
