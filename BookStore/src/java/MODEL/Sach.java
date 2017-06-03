package MODEL;

public class Sach {

    private int ma_sach;
    private int ma_the_loai;
    private String ten_sach;
    private String hinh_anh;
    private double gia_ban;
    private String nha_xuat_ban;
    private String mo_ta;
    private String tac_gia;

    public Sach(int ma_sach, int ma_the_loai, String ten_sach, String hinh_anh, double gia_ban, String nha_xuat_ban, String mo_ta, String tac_gia) {
        this.ma_sach = ma_sach;
        this.ma_the_loai = ma_the_loai;
        this.ten_sach = ten_sach;
        this.hinh_anh = hinh_anh;
        this.gia_ban = gia_ban;
        this.nha_xuat_ban = nha_xuat_ban;
        this.mo_ta = mo_ta;
        this.tac_gia = tac_gia;
    }

    public Sach() {

    }

    public Sach(int parseInt, int i, String string, String string0, double d, String string1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getMa_sach() {
        return ma_sach;
    }

    public int getMa_the_loai() {
        return ma_the_loai;
    }

    public String getTen_sach() {
        return ten_sach;
    }

    public String getHinh_anh() {
        return hinh_anh;
    }

    public double getGia_ban() {
        return gia_ban;
    }

    public String getNha_xuat_ban() {
        return nha_xuat_ban;
    }

    public String getMo_ta() {
        return mo_ta;
    }

    public String getTac_gia() {
        return tac_gia;
    }

    public void setMa_sach(int ma_sach) {
        this.ma_sach = ma_sach;
    }

    public void setMa_the_loai(int ma_the_loai) {
        this.ma_the_loai = ma_the_loai;
    }

    public void setTen_sach(String ten_sach) {
        this.ten_sach = ten_sach;
    }

    public void setHinh_anh(String hinh_anh) {
        this.hinh_anh = hinh_anh;
    }

    public void setGia_ban(double gia_ban) {
        this.gia_ban = gia_ban;
    }

    public void setNha_xuat_ban(String nha_xuat_ban) {
        this.nha_xuat_ban = nha_xuat_ban;
    }

    public void setMo_ta(String mo_ta) {
        this.mo_ta = mo_ta;
    }

    public void setTac_gia(String tac_gia) {
        this.tac_gia = tac_gia;
    }
}
