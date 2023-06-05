package com.example.bai_tap.repository;

import com.example.bai_tap.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {

    User selectUser(int id);

    List<User> selectAllUsers();
    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;
    void insertUser(User user) throws SQLException;
    void addUserTransaction();
}
