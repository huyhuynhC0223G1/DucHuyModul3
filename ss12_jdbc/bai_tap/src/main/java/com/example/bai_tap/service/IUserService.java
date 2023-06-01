package com.example.bai_tap.service;

import com.example.bai_tap.model.User;

import java.util.List;

public interface IUserService {
    List<User> showAll();

    void addNewUser(User user);
    void deleteUser(int id);

    void editUser(User user);

    List<User> selectUserByCountry(String country);
    User selectUserId(int id);
}
