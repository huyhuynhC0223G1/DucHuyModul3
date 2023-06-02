package com.example.case_study_2.repository.impl;

import com.example.case_study_2.model.Product;
import com.example.case_study_2.repository.BaseRepository;
import com.example.case_study_2.repository.IProductRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String INSERT = "insert into student(`name`,gender,point,class_id)" + " values(?,?,?,?) ";
    private static final String SELECT = "select * from products";
    private static final String DELETE = "delete from student where id = ?";

    @Override
    public List<Product> showAll() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String productName= resultSet.getString("product_name");
                String productDescription= resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image =resultSet.getString("image");
                int productTypeId= resultSet.getInt("product_type_id");
                productList.add(new Product(id, productName, productDescription, price, image, productTypeId));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
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

    }

    @Override
    public void updateProduct(int id) {

    }

    @Override
    public void deleteProduct(int id) {

    }
}
