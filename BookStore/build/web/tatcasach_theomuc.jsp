<%@page import="java.util.List"%>
<%@page import="MODEL.Sach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SachDAO"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tất cả sách theo danh mục</title>
        <link rel ="stylesheet" href ="css/product.css" type="text/css">
    </head>
    <body>
        <%
            //Phan detail  
            String ma_sach = "";
            if (request.getParameter("ma_sach") != null) {
                ma_sach = request.getParameter("ma_sach");
            }
            SachDAOImpl productDAOImpl = new SachDAOImpl();
            List<Sach> list = new ArrayList<Sach>();
            list = productDAOImpl.getListByCategory(Integer.parseInt(request.getParameter("id")));
            double giaban;
        %>

        <div id="left1" >
            <ul>
                <%
                    for (Sach p : list) {
                        giaban = p.getGia_ban() / 1000;
                %>
                <li>
                    <div class="img"><a href="#"><img alt="" src="images/product/<%=p.getHinh_anh()%>.jpg"></a></div>
                    <div class="info">
                        <a class="title" href="#"> <%=p.getTen_sach()%></a>
                        <div class="price">
                            <span class="st">Giá:</span><strong><%=giaban%>00₫</strong>
                        </div>
                        <div class="actions">
                            <a href="detail.jsp?id=<%=p.getMa_sach()%>">Chi tiết</a>
                            <a href="GioHangServlet?command=addCart&ma_sach=<%=p.getMa_sach()%>">Thêm vào giỏ</a>
                        </div>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
    </body>
</html>
