package com.library.dao;
import java.sql.CallableStatement;
import java.sql.Connection;

public class BookDAO {
    public static void issueBook(int userId, int bookId) {
        try {
            Connection conn = DBConnection.getConnection();
            CallableStatement cs = conn.prepareCall("{CALL issue_book(?, ?)}");
            cs.setInt(1, userId);
            cs.setInt(2, bookId);
            cs.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}