package com.example.bai_tap.repository;

import com.example.bai_tap.model.User;

import java.util.List;

public interface IUserRepository {
//    List<User> showAll();
    List<User> showAll();

    void addNewUser(User user);
    void deleteUser(int id);

    void editUser(User user);
    User selectUserId(int id);
    List<User> searchUserByCountry(String country);
    List<User> sortUserByName();
}
