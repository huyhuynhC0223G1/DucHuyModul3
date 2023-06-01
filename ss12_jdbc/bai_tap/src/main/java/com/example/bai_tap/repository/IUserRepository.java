package com.example.bai_tap.repository;

import com.example.bai_tap.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showAll();

    void addNewUser(User user);
    void deleteUser(int id);

    void editUser(User user);

    void searchUser(int id);
    User selectUserId(int id);
    List<User> selectUserByCountry(String country);
}
