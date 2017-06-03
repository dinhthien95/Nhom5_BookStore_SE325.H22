<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.Sach"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/detail_style.css" type="text/css">
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
    </head>
    <body>


        <%
            //de lay ma sp truyen qua thanh dia chi
            String ma_sach = "";
            if (request.getParameter("ma_sach") != null) {
                ma_sach = request.getParameter("ma_sach");
            }
            SachDAOImpl productDAOImpl = new SachDAOImpl();
            List<Sach> list = new ArrayList<Sach>();

            list = productDAOImpl.getSach_ID(Integer.parseInt(request.getParameter("id")));
            double giamoi;
            double giaban;
            int tilegiam = 0;
            double tietkiem;
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
                    <%
                        for (Sach p : list) {
                            giaban = p.getGia_ban() / 1000;
                            giamoi = giaban * 100 / 100;
                            tietkiem = giaban * 0 / 100;

                    %>
                    <div class="col-xs-12">                        
                        <div id="image" >
                            <img  width="100%" height="100%" alt="" src="images/product/<%=p.getHinh_anh()%>.jpg">
                        </div>
                        <!--    Name's book-->
                        <div id="name_book">
                            <div id="name">
                                <p><%=p.getTen_sach()%><p>
                            </div>
                            <div id="info_book">
                                <p>Tác giả: <%=p.getTac_gia()%></p>
                                <p>Nhà xuất bản: <%=p.getNha_xuat_ban()%></p>
                                <p>Nhà phát hành: Tao Đàn</p>                
                            </div>
                        </div>
                        <!--    Buy book-->

                        <div id="buy_book">
                            <div id="p1">
                                <p>Thông tin thanh toán</p>
                            </div>
                            <div id="p2">
                                <p>Giá bìa: <%=giaban%>00₫</p>
                                <p>Giá bán: <%=giamoi%>00₫</p>
                                <p>Tiết kiệm :<%=tietkiem%>00₫(<%=tilegiam%>%)</p>
                            </div>
                            <div id="p3">
                                <p><a href="GioHangServlet?command=addCart&ma_sach=<%=p.getMa_sach()%>">MUA NGAY</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-11">
                        <!--    Info's book-->
                        <p id="tab_gioithieu">Giới thiệu sách</p>
                        <p id="gioithieu"><%=p.getMo_ta()%></p>
                    </div>

                </div>
            </div>
            <div class="row">
                <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
                </div>
            </div>
        <%}%>
        <script src="javascript/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
