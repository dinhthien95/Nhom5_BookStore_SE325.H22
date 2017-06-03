package DAO;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import MODEL.Category;

public class CategoryDAOImpl implements CategoryDAO {

    @Override
    public void addCategory(Category c) {
        Connection con = DBConnect.getConection();
        String sql = "insert into category value (?,?,?)";
        PreparedStatement ps;

        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setInt(1, c.getMa_the_loai());
            ps.setString(2, c.getTen_the_loai());
            ps.setString(3, c.getMo_ta());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Category> getList() {
        Connection con = DBConnect.getConection();
        String sql = "select  * from category";
        List<Category> list = new ArrayList<Category>();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_the_loai = rs.getString("ten_the_loai");
                String mo_ta = rs.getString("mo_ta");

                list.add(new Category(ma_the_loai, ten_the_loai, mo_ta));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void deleteCategory(int ma_the_loai) {
        Connection con = DBConnect.getConection();
        String sql = "delete  from category where ma_the_loai ='" + ma_the_loai + "'";
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Category getCategory(int id) {
        Connection con = DBConnect.getConection();
        String sql = "select  * from category where  ma_the_loai ='" + id + "'";
        Category c = new Category();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_the_loai = rs.getString("ten_the_loai");
                String mo_ta = rs.getString("mo_ta");
                c = new Category(ma_the_loai, ten_the_loai, mo_ta);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public void updateCategory(Category c) {
        Connection con = DBConnect.getConection();
        String sql = "update category set ten_the_loai =?,mo_ta=? where  ma_the_loai =?";
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);

            ps.setString(1, c.getTen_the_loai());
            ps.setString(2, c.getMo_ta());
            ps.setInt(3, c.getMa_the_loai());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getCategoryByID(int ma_the_loai) {
       Connection con = DBConnect.getConection();
        String sql = "select ten_the_loai from category where ma_the_loai="+ma_the_loai;
        String tenTheLoai="";
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tenTheLoai=rs.getString("ten_the_loai");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tenTheLoai;
    }
    public static void main(String[] args) {
        CategoryDAOImpl object = new CategoryDAOImpl();
        //System.out.println(object.getCategoryByID(1)); 
    }
}
