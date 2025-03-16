package com.banking.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAO {
    public static boolean createAccount(String name, String email, double balance) {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO accounts (name, email, balance) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setDouble(3, balance);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static double getBalance(int accountId) {
        double balance = 0;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT balance FROM accounts WHERE account_id = ?");
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                balance = rs.getDouble("balance");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return balance;
    }
}