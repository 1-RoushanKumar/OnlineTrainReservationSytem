package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.User;

public class UserDao {
    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    // Existing method to add a user
    public boolean addUser(User user) {
        boolean isAdded = false;
        String sql = "INSERT INTO users(User_name, Password) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1) {
                isAdded = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logger in production
        }
        return isAdded;
    }

    // New method to validate user login
    public boolean validateUser(String username, String password) {
        boolean isValid = false;
        String sql = "SELECT * FROM users WHERE User_name = ? AND Password = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    isValid = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with logger in production
        }
        return isValid;
    }
}
