package com.banking.dao;
import java.sql.CallableStatement;
import java.sql.Connection;

public class TransactionDAO {
    public static void transferFunds(int fromAccount, int toAccount, double amount) {
        try {
            Connection conn = DBConnection.getConnection();
            CallableStatement cs = conn.prepareCall("{CALL transfer_money(?, ?, ?)}");
            cs.setInt(1, fromAccount);
            cs.setInt(2, toAccount);
            cs.setDouble(3, amount);
            cs.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}