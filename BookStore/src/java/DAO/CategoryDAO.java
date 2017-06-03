package DAO;
import java.util.List;
import MODEL.Category;

public interface CategoryDAO {

    //Them danh muc moi
    public void addCategory(Category c);

    //Xóa
    public void deleteCategory(int ma_the_loai);

    //Danh sach
    public List<Category> getList();

    public Category getCategory(int ma_the_loai);

    public void updateCategory(Category c);
    public String getCategoryByID(int ma_the_loai);
}
