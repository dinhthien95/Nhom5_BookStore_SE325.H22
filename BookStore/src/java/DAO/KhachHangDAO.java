
package DAO;
import MODEL.KhachHang;

public interface KhachHangDAO {   
    public void themKhachHang(KhachHang k);
    public boolean kiemtraKhachHang(String taikhoan);
    public boolean  dangnhap(String tai_khoan, String mat_khau);
}
