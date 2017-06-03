<%@page import="MODEL.Sach"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel ="stylesheet" href ="css/product.css" type="text/css">

<%

    SachDAOImpl productDAOImpl = new SachDAOImpl();
    List<Sach> list = new ArrayList<Sach>();
    list = productDAOImpl.getListByCategory(Integer.parseInt(request.getParameter("id")));

    double giaban;

%>
<div class="row">
    <div id="left1" >
        <ul>

            <%            int i = 0;
                for (Sach p : list) {
                    if (i++ == 5) {
                        break;
                    }
                    giaban = p.getGia_ban() / 1000;
            %>
            <li>

                <div class="img"><a href="detail.jsp?id=<%=p.getMa_sach()%>"><img alt="" src="images/product/<%=p.getHinh_anh()%>.jpg"></a></div>
                <div class="info">
                    <a class="title" href="detail.jsp?id=<%=p.getMa_sach()%>"> <%=p.getTen_sach()%></a>
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
</div>

