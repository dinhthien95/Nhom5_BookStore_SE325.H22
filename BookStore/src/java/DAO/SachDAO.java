package DAO;
import java.util.List;
import MODEL.Sach;

public interface SachDAO {

    //Thêm sản phẩm  mới

    public void addProduct(Sach p);

    //Hiển thị danh sách sản phẩm
    public List<Sach> getList();

    public List<Sach> timSach(String ten_sach);

    //Lấy danh sách sản phẩm theo loại

    public List<Sach> getListByCategory(int ma_the_loai);


    public void deleteProduct(int ma_the_loai);
    
    public void updateProduct(Sach c);
    
         //Phân trang
    public List<Sach> getSub(int ma_the_loai, List<Sach> list, int start, int end);
    public int countSachByID(int ma_the_loai);
}
