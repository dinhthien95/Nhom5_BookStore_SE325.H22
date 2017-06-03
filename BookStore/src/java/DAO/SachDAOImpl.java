package DAO;

import java.sql.Connection;
import java.util.List;
import MODEL.Sach;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SachDAOImpl implements SachDAO {

    @Override
    public void addProduct(Sach p) {
        Connection con = DBConnect.getConection();
        String sql = "insert into sach value (?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setInt(1, p.getMa_sach());
            ps.setInt(2, p.getMa_the_loai());
            ps.setString(3, p.getTen_sach());
            ps.setString(4, p.getHinh_anh());
            ps.setDouble(5, p.getGia_ban());
            ps.setString(6, p.getNha_xuat_ban());
            ps.setString(7, p.getMo_ta());
            ps.setString(8, p.getTac_gia());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Sach> getList() {
        Connection con = DBConnect.getConection();
        String sql = "select  * from sach order by ma_sach desc";
        List<Sach> list = new ArrayList<Sach>();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_sach = rs.getInt("ma_sach");
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_sach = rs.getString("ten_sach");
                String hinh_anh = rs.getString("hinh_anh");
                Double gia_ban = rs.getDouble("gia_ban");
                String nha_xuat_ban = rs.getString("nha_xuat_ban");
                String mo_ta = rs.getString("mo_ta");
                String tac_gia = rs.getString("tac_gia");
                list.add(new Sach(ma_sach, ma_the_loai, ten_sach, hinh_anh, gia_ban, nha_xuat_ban, mo_ta, tac_gia));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Sach> getListByCategory(int id) {
        Connection con = DBConnect.getConection();
        String sql = "select  * from sach where ma_the_loai='" + id + "'";
        List<Sach> list = new ArrayList<Sach>();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_sach = rs.getInt("ma_sach");
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_sach = rs.getString("ten_sach");
                String hinh_anh = rs.getString("hinh_anh");
                Double gia_ban = rs.getDouble("gia_ban");
                String nha_xuat_ban = rs.getString("nha_xuat_ban");
                String mo_ta = rs.getString("mo_ta");
                String tac_gia = rs.getString("tac_gia");
                list.add(new Sach(ma_sach, ma_the_loai, ten_sach, hinh_anh, gia_ban, nha_xuat_ban, mo_ta, tac_gia));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Sach> getSach_ID(int id) {
        Connection con = DBConnect.getConection();
        String sql = "select  * from sach where ma_sach='" + id + "'";
        List<Sach> list = new ArrayList<Sach>();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_sach = rs.getInt("ma_sach");
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_sach = rs.getString("ten_sach");
                String hinh_anh = rs.getString("hinh_anh");
                Double gia_ban = rs.getDouble("gia_ban");
                String nha_xuat_ban = rs.getString("nha_xuat_ban");
                String mo_ta = rs.getString("mo_ta");
                String tac_gia = rs.getString("tac_gia");
                list.add(new Sach(ma_sach, ma_the_loai, ten_sach, hinh_anh, gia_ban, nha_xuat_ban, mo_ta, tac_gia));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Sach> timSach(String tensach) {
        Connection con = DBConnect.getConection();
        String sql = "select  * from sach where ten_sach like N\'%" + tensach + "%\'";
        List<Sach> list = new ArrayList<Sach>();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_sach = rs.getInt("ma_sach");
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_sach = rs.getString("ten_sach");
                String hinh_anh = rs.getString("hinh_anh");
                Double gia_ban = rs.getDouble("gia_ban");
                String nha_xuat_ban = rs.getString("nha_xuat_ban");
                String mo_ta = rs.getString("mo_ta");
                String tac_gia = rs.getString("tac_gia");
                list.add(new Sach(ma_sach, ma_the_loai, ten_sach, hinh_anh, gia_ban, nha_xuat_ban, mo_ta, tac_gia));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Sach getSach(int id) {
        Connection con = DBConnect.getConection();
        String sql = "select  * from sach where ma_sach='" + id + "'";
        Sach list = new Sach();
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_sach = rs.getInt("ma_sach");
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_sach = rs.getString("ten_sach");
                String hinh_anh = rs.getString("hinh_anh");
                double gia_ban = rs.getDouble("gia_ban");
                String nha_xuat_ban = rs.getString("nha_xuat_ban");
                String mo_ta = rs.getString("mo_ta");
                String tac_gia = rs.getString("tac_gia");
                list = new Sach(ma_sach, ma_the_loai, ten_sach, hinh_anh, gia_ban, nha_xuat_ban, mo_ta, tac_gia);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void deleteProduct(int ma_sach) {
        Connection con = DBConnect.getConection();
        String sql = "delete  from sach where ma_sach='" + ma_sach + "'";
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProduct(Sach s) {
        Connection con = DBConnect.getConection();
        String sql = "update sach set ten_sach=?,ma_the_loai=? ,hinh_anh=?,gia_ban=?,nha_xuat_ban =?,mo_ta=?,tac_gia=? where  ma_sach =?";
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);

            ps.setString(1, s.getTen_sach());
            ps.setInt(2, s.getMa_the_loai());
            ps.setString(3, s.getHinh_anh());
            ps.setDouble(4, s.getGia_ban());
            ps.setString(5, s.getNha_xuat_ban());
            ps.setString(6, s.getMo_ta());
            ps.setString(7, s.getTac_gia());
            ps.setInt(8, s.getMa_sach());
            ps.executeUpdate();

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Sach> getSub(int ma_the_loai, List<Sach> list, int start, int end) {
        List<Sach> ds = new ArrayList<Sach>();
        SachDAOImpl object = new SachDAOImpl();
        int count=object.countSachByID(ma_the_loai);
        if(count<end)
            end=count;
        for (int i = start; i < end; i++) {
            ds.add(list.get(i));
        }
        return ds;
    }

    @Override
    public int countSachByID(int ma_the_loai) {
        Connection con = DBConnect.getConection();
        String sql = "SELECT COUNT(*) FROM sach WHERE ma_the_loai=" + ma_the_loai;
        int count = 0;
        try {
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("COUNT(*)");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        SachDAOImpl object = new SachDAOImpl();
        //System.out.println(object.countSachByID(12)); 
    }
}
