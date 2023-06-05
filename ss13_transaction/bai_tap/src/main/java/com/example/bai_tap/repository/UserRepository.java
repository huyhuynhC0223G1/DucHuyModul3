package com.example.bai_tap.repository;

import com.example.bai_tap.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "call SELECT_ALL_USERS;";
    private static final String DELETE_USERS_SQL = "call DELETE_USERS_SQL(?)";
    private static final String UPDATE_USERS_SQL = "call UPDATE_USERS_SQL(?,?,?,?)";

    public UserRepository() {
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SQL)) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_SQL)) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());

            rowUpdated = callableStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void addUserTransaction() {
        Connection connection = BaseRepository.getConnection();
        Savepoint savepoint = null;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement1 = connection.prepareStatement("INSERT INTO users (name, email, country) VALUES ('Huy', 'huy@gmail.com', 'Viet Nam');");
            preparedStatement1.executeUpdate();
            savepoint = connection.setSavepoint();
            PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO users (name, email, country) VALUES ('Thanh', 'thanh@gmail.com', 'Viet Nam');");
            preparedStatement2.executeUpdate();
            PreparedStatement preparedStatement3 = connection.prepareStatement("INSERT INTO users (name, email, country) VALUES (Thien, 'thien@gmail.com', 'Viet Nam');");
            preparedStatement3.executeUpdate();
            connection.commit();

        } catch (SQLException throwables) {
            try {
                connection.rollback(savepoint);
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throwables.printStackTrace();
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

