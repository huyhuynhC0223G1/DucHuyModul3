package com.example.repository;


import com.example.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://antimatter.vn/wp-content/uploads/2022/07/hinh-anh-hoat-hinh-3d-de-thuong.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://antimatter.vn/wp-content/uploads/2022/07/hinh-anh-hoat-hinh-3d-de-thuong.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://antimatter.vn/wp-content/uploads/2022/07/hinh-anh-hoat-hinh-3d-de-thuong.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://antimatter.vn/wp-content/uploads/2022/07/hinh-anh-hoat-hinh-3d-de-thuong.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://antimatter.vn/wp-content/uploads/2022/07/hinh-anh-hoat-hinh-3d-de-thuong.jpg"));
    }

    @Override
    public List<Customer> getAll() {
        return customerList;
    }
}
