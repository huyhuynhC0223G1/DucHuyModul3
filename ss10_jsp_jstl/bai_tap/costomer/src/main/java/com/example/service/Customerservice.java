package com.example.service;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;

import java.util.List;

public class Customerservice implements ICustomerservice {
    private CustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> getAll() {
        List<Customer> customerList = customerRepository.getAll();
        return customerList;
    }
}
