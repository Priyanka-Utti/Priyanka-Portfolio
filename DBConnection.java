package com.banking.dao;
import java.sql.*;

public class DBConnection {
    private static Connection conn;
    
    public static Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver"); // Load Oracle Driver
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "your_username", "your_password");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}