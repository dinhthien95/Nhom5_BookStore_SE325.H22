package DAO;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    public static Connection getConection() {
        Connection cons = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cons;
    }
}
