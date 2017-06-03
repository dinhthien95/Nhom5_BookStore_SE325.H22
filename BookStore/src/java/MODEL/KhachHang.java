package MODEL;
import DAO.DBConnect;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KhachHang {
    private int ma_khach_hang;
    private String tai_khoan;
    private String mat_khau;
    private String email;
    private String ho_ten;
    private String dia_chi;
    private String dien_thoai;
    private String gioi_tinh;
    private int admin;
    private ArrayList<KhachHang> listKhachHang;

    public KhachHang() {
        Connection con = DBConnect.getConection();
        String sql = "select  * from khachhang";
        listKhachHang = new ArrayList<KhachHang>();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_khach_hang = rs.getInt("ma_khach_hang");
                String tai_khoan = rs.getString("tai_khoan");
                String mat_khau = rs.getString("mat_khau");
                String email = rs.getString("email");
                String ho_ten = rs.getString("ho_ten");
                String dia_chi = rs.getString("dia_chi");
                String dien_thoai = rs.getString("dien_thoai");
                String gioi_tinh = rs.getString("gioi_tinh");
                int admin = rs.getInt("admin");
                listKhachHang.add(new KhachHang(ma_khach_hang, tai_khoan, mat_khau, email,ho_ten, dia_chi, dien_thoai, gioi_tinh,admin));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public KhachHang(int ma_khach_hang, String tai_khoan, String mat_khau, String email, String ho_ten,String dia_chi, String dien_thoai, String gioi_tinh, int admin) {
        this.ma_khach_hang = ma_khach_hang;
        this.tai_khoan = tai_khoan;
        this.mat_khau = mat_khau;
        this.email = email;
        this.ho_ten = ho_ten;
        this.dia_chi = dia_chi;
        this.dien_thoai = dien_thoai;
        this.gioi_tinh = gioi_tinh;
        this.admin = admin;
    }

    public int getMa_khach_hang() {
        return ma_khach_hang;
    }

    public void setMa_khach_hang(int ma_khach_hang) {
        this.ma_khach_hang = ma_khach_hang;
    }

    public String getTai_khoan() {
        return tai_khoan;
    }

    public void setTai_khoan(String tai_khoan) {
        this.tai_khoan = tai_khoan;
    }

    public String getMat_khau() {
        return mat_khau;
    }

    public void setMat_khau(String mat_khau) {
        this.mat_khau = mat_khau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHo_ten() {
        return ho_ten;
    }

    public void setHo_ten(String ho_ten) {
        this.ho_ten = ho_ten;
    }

    public String getDia_chi() {
        return dia_chi;
    }

    public void setDia_chi(String dia_chi) {
        this.dia_chi = dia_chi;
    }

    public String getDien_thoai() {
        return dien_thoai;
    }

    public void setDien_thoai(String dien_thoai) {
        this.dien_thoai = dien_thoai;
    }

    public String getGioi_tinh() {
        return gioi_tinh;
    }

    public void setGioi_tinh(String gioi_tinh) {
        this.gioi_tinh = gioi_tinh;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }
}
