
package DAO;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import MODEL.KhachHang;

public class KhachHangDAOImpl implements KhachHangDAO {

    private ArrayList<KhachHang> listAccount;

    @Override
    public void themKhachHang(KhachHang k) {
        Connection con = DBConnect.getConection();
        String sql = "insert into khachhang value (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setInt(1, k.getMa_khach_hang());
            ps.setString(2, k.getTai_khoan());
            ps.setString(3, k.getMat_khau());
            ps.setString(4, k.getEmail());
            ps.setString(5, k.getHo_ten());
            ps.setString(6, k.getDia_chi());
            ps.setString(7, k.getDien_thoai());
            ps.setString(8, k.getGioi_tinh());
            ps.setInt(9, k.getAdmin());

            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean kiemtraKhachHang(String tai_khoan) {
        Connection con = DBConnect.getConection();
        String sql = "select * from khachhang where tai_khoan ='" + tai_khoan + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                con.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean dangnhap(String tai_khoan, String mat_khau) {
        Connection con = DBConnect.getConection();
        String sql = "select * from khachhang where tai_khoan ='" + tai_khoan + "' and mat_khau = '" + mat_khau + "' ";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                con.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean checkAdmin(String tendangnhap)
    {
        Connection con = DBConnect.getConection();
        String sql = "select * from khachhang where tai_khoan ='" + tendangnhap + "' and admin = 1 ";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                con.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        KhachHangDAOImpl dao = new KhachHangDAOImpl();
//        System.out.println(dao.kiemtraKhachHang("A"));
        System.out.println(dao.dangnhap("thang", "thang"));
        dao.themKhachHang(new KhachHang(0, "thang", "thang", "thang@gmail.com", "THẮNG", "TPHCM", "123456789", "Nam",1));
        dao.themKhachHang(new KhachHang(0, "thinh", "thinh", "thinh@gmail.com", "THỊNH", "TPHCM", "123456789", "Nam",1));
        dao.themKhachHang(new KhachHang(0, "thien", "thien", "thinh@gmail.com", "THIỆN", "TPHCM", "123456789", "Nam",1));
    }

}
