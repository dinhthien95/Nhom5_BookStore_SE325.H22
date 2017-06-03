<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.Category"%>
<%@page import="MODEL.Sach"%>
<%@page import="DAO.CategoryDAOImpl"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel ="stylesheet" href ="css/category.css" type="text/css">


<%
    CategoryDAOImpl categoryWBS = new CategoryDAOImpl();
    List<Category> list = new ArrayList<Category>();
    list = categoryWBS.getList();
%>
<div id="danhmuc">
    <h1 style="margin-top: 0px; margin-bottom: 0px;">Danh Mục Sách </h1>
    <ul>
        <%
            int a = 0;
            int b = 10;
            for (Category c : list) {
        %>
        <li><a href="sach_theoloai.jsp?start=<%=a%>&end=<%=b%>&id=<%=c.getMa_the_loai()%>"><%=c.getTen_the_loai()%></a></li>
            <%
                }
            %>
    </ul>
    <h1 style="margin-top: 0px; margin-bottom: 0px;">Bán chạy </h1>
    <%
        SachDAOImpl productDAOImpl = new SachDAOImpl();
        List<Sach> topSell = new ArrayList<Sach>();
        topSell = productDAOImpl.getListByCategory(4);
        double giamoi;
        double giaban;
    %>
    <section id="content"><!-- Defining the content section #2 -->
        <div id="leftSell">
            <ul id="topSell">
                <%
                    int i = 0;
                    for (Sach p : topSell) {
                        if (i++ > 4) {
                            break;
                        }
                        giaban = p.getGia_ban() / 1000;
                        giamoi = giaban * 80 / 100;
                %>
                <li>
                    <a href="detail.jsp?id=<%=p.getMa_sach()%>" style="text-decoration: none; display: block;width: 100%;height: 100%;">
                        <div class="img">
                            <img alt="" src="images/product/<%=p.getHinh_anh()%>.jpg">
                        </div>
                        <div class="info">
                            <div class="price">
                                <span class="special"><%=giaban%>00₫</span>&nbsp;
                            </div>
                            <div class="title"><%=p.getTen_sach()%></div>
                        </div>
                    </a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </section>
</div>
