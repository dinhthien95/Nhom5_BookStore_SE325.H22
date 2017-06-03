package MODEL;

public class Cart {
    public Sach p;
    private int soluong;

    public Cart() {
    }

    public Cart(Sach p, int soluong) {
        this.p = p;
        this.soluong = soluong;
    }

    public Sach getP() {
        return p;
    }

    public void setP(Sach p) {
        this.p = p;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
}
