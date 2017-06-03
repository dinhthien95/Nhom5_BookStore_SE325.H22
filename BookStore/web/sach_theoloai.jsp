<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.Sach"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>San pham</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/product.css" type="text/css">
        <link rel ="stylesheet" href ="css/style.css" type="text/css">

        <script>
            function setSelect(id)
            {
                //alert("asdasd");
                $("#trang" + id).css("background-color", "green");
                $("#trang" + id).css("color", "white");
            }
        </script>
    </head>
    <body>
        <%
            SachDAOImpl productDAO = new SachDAOImpl();
            List<Sach> listProduct = productDAO.getListByCategory(Integer.parseInt(request.getParameter("id")));

            //listSach = productDAO.getListByCategory(1);
            String page1 = "";
            String page2 = "";
            //start , end để phân bao nhiêu sp ở 1 trang
            int start = 0;
            int end;
            if (listProduct.size() < 20) {
                end = listProduct.size();
            } else {
                end = 10;
            }
            if (request.getParameter("start") != null) {
                page1 = request.getParameter("start");
                start = Integer.parseInt(page1);
            }
            if (request.getParameter("end") != null) {
                page2 = request.getParameter("end");
                end = Integer.parseInt(page2);
            }
            List<Sach> listSach = new ArrayList<Sach>();
            listSach = productDAO.getSub(Integer.parseInt(request.getParameter("id")), listProduct, start, end);

            double giaban;
        %>
        <div class="container-fluid">
            <div class="row">
                <div id="search"><jsp:include page="timkiem.jsp"></jsp:include></div>
                <div id ="menu"><jsp:include page="menu.jsp"></jsp:include></div>                
                </div>
                <div class="row">
                    <div class="col-xs-3" style="padding-left: 0px; padding-right: 0px; width: 18%;">
                        <div id="left"><jsp:include page="category.jsp"></jsp:include></div>
                    </div>
                    <div class="col-xs-9" style="width: 82%; padding: 0px;">
                        <div class="row">
                            <div id="left1">
                                <ul>
                                <%for (Sach p : listSach) {
                                        giaban = p.getGia_ban() / 1000;
                                %>
                                <li>
                                    <div class="img"><a href="detail.jsp?id=<%=p.getMa_sach()%>"><img alt="" src="images/product/<%=p.getHinh_anh()%>.jpg"></a></div>
                                    <div class="info">
                                        <a class="title" href="detail.jsp?id=<%=p.getMa_sach()%>"><%=p.getTen_sach()%> </a>
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
                    <div class="col-xs-6" style="padding: 10px 25px">
                        <div class="soTrang">
                            <%
                                int limit = listProduct.size() / 10;
                                if (limit * 10 < listProduct.size()) {
                                    limit += 1;
                                }
                                for (int i = 1; i <= limit; i++) {
                                    int a = (i - 1) * 10;
                                    int b = i * 10;
                                    if (b > listProduct.size()) {
                                        b = listProduct.size();
                                    }
                            %>

                            <a class="chiSoTrang" id="trang<%=i%>" href="?start=<%=a%>&end=<%=b%>&id=<%=Integer.parseInt(request.getParameter("id"))%>"><%=i%></a>
                            <%

                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
                </div>
            </div>





            <script type="text/javascript" src="javascript/jquery-2.1.4.min.js"></script>
            <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
            <script>setSelect('<%=end % 10 != 0 ? end / 10 + 1 : end / 10%>');</script>
    </body>
</html>
