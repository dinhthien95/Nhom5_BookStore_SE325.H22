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
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
        <!--        <link rel ="stylesheet" href ="css/timkiem_ketqua.css" type="text/css">-->
        <link rel ="stylesheet" href ="css/product.css" type="text/css">
        <title>Tim kiem</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div id="search"><jsp:include page="timkiem.jsp"></jsp:include></div>
                <div id ="menu"><jsp:include page="menu.jsp"></jsp:include></div>                
                </div>
                <div class="row">
                    <div class="col-xs-3" style="padding-left: 0px; width: 19%;">
                        <div id="left"><jsp:include page="category.jsp"></jsp:include></div>
                    </div>
                    <div class="col-xs-9" style="width: 79%; padding: 0px;">
                        <div class="row">
                        <%
                            if (request.getParameter("key") != null) {
                                String key = request.getParameter("key");
                                SachDAOImpl productDAOImpl = new SachDAOImpl();
                                List<Sach> list = new ArrayList<Sach>();
                                list = productDAOImpl.timSach(key);
                        %>
                        <h1>Kết quả tìm kiểm cho từ khóa: <%=key%></h1>
                        <div id="left1">
                            <ul>
                                <%

                                    for (Sach p : list) {
                                        double giaban = p.getGia_ban() / 1000;
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
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
