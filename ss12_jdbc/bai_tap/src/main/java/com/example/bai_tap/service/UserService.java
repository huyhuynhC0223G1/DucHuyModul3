package com.example.bai_tap.service;

import com.example.bai_tap.model.User;
import com.example.bai_tap.repository.IUserRepository;
import com.example.bai_tap.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> showAll() {
        List<User> users = userRepository.showAll();
        return users;
    }

    @Override
    public void addNewUser(User user) {
        userRepository.addNewUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public void editUser(User user) {
        userRepository.editUser(user);
    }

    @Override
    public List<User> searchUserByCountry(String country) {
        return userRepository.searchUserByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortUserByName();
    }

    @Override
    public User selectUserId(int id) {
        return userRepository.selectUserId(id);
    }
}
