<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.Sach"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top sell</title>
        <link rel ="stylesheet" href ="css/danhmuctopsell.css" type="text/css">
    </head>
    <body>
        <%
            SachDAOImpl productDAOImpl = new SachDAOImpl();
            List<Sach> list = new ArrayList<Sach>();
            list = productDAOImpl.getListByCategory(4);
                        double giamoi;
                        double giaban;
        %>
        <div class="container">
            <div id="main"><!-- Defining submain content section -->
                <section id="content"><!-- Defining the content section #2 -->
                    <div id="right">
                        <ul>
                            <%
                                int i = 0;
                                for (Sach p : list) {
                                    if(i++ > 5)
                                        break;
                                    giaban = p.getGia_ban()/1000;
                                    giamoi = giaban*80/100;
                            %>
                            <li>
                                <div class="img"><a href="detail.jsp?id=<%=p.getMa_sach()%>"><img alt="" src="images/product/<%=p.getHinh_anh()%>.jpg"></a></div>
                                <div class="info">
                                    <div class="price">
                                        <span class="special"><%=giaban%>00₫</span>&nbsp;
                                    </div>
                                    <a class="title" href="#"><%=p.getTen_sach()%></a>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </section>
            </div>
        </div>

    </body>
</html>
