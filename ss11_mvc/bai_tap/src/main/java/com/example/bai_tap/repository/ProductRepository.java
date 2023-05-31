package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Dell", "20000000", "Laptop", "Dell"));
        productList.add(new Product(2, "PH", "21000000", "Laptop", "PH"));
        productList.add(new Product(3, "Mac", "25000000", "Laptop", "Apple"));
        productList.add(new Product(4, "Asus", "19000000", "Laptop", "Asus"));
    }

    @Override
    public List<Product> showAll() {
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void deleteProduct(int id) {
        for (Product p : productList) {
            if (p.getId() == id) {
                productList.remove(p);
                break;
            }
        }
    }

    @Override
    public void editProduct(int id, Product product) {
        productList.set(checkProductId(id), product);
    }

    @Override
    public int checkProductId(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
}
