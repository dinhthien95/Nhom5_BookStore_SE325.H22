<%@page import="DAO.SachDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="MODEL.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page import="MODEL.Sach"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ Hàng</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
        <link rel ="stylesheet" href ="css/cart_style.css" type="text/css">
    </head>
    <body>
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

                        <div id="cart">
                            <div class="col-xs-6">
                                <div id="th_1">Giỏ hàng của bạn</div>
                            </div>
                            <div class="col-xs-2">
                                <div id="th_2">Giá bán</div>
                            </div>
                            <div class="col-xs-2">
                                <div id="th_3">Số lượng</div>
                            </div>
                            <div class="col-xs-2">
                                <div id="th_4">Tổng tiền</div>
                            </div>		
                        </div>
                    <%
                        SachDAOImpl sachDAO = new SachDAOImpl();
                        NumberFormat format_num = NumberFormat.getInstance();
                        format_num.setMinimumIntegerDigits(0);
                        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
                        double total = 0;
                    %>
                    <%
                        if (cart != null) {
                            for (Cart c : cart) {
                                if (c.getSoluong() == 0) {
                                    continue;
                                }

                                total += c.getSoluong() * sachDAO.getSach(c.getP().getMa_sach()).getGia_ban();
                    %>
                    <div class="product">
                        <div class="col-xs-1">
                            <div class="pr_remove"><a href="GioHangServlet?command=removeCart&ma_sach=<%=c.getP().getMa_sach()%>"><span style="color: red;" class="glyphicon glyphicon-remove"></span></a></div>
                        </div>
                        <div class="col-xs-2">
                            <div class="pr_image">
                                <img height="100px" width="70px" alt="" src="images/product/<%=sachDAO.getSach(c.getP().getMa_sach()).getHinh_anh()%>.jpg">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="pr_name">
                                <%=sachDAO.getSach(c.getP().getMa_sach()).getTen_sach()%>
                            </div> 
                        </div>
                        <div class="col-xs-2">
                            <div class="pr_price" ><%=format_num.format(sachDAO.getSach(c.getP().getMa_sach()).getGia_ban())%> VNĐ</div>
                        </div>
                        <div class="col-xs-2">
                            <div class="pr_quantity">
                                <input type="number" value="<%=c.getSoluong()%>" disabled="disabled">
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="pr_pay"><%=format_num.format(sachDAO.getSach(c.getP().getMa_sach()).getGia_ban() * c.getSoluong())%> VNĐ</div> 
                        </div>





                    </div>
                    <%
                            }
                        }
                    %>
                    <div id="total">
                        <div id="total_item">Tổng hóa đơn</div>
                        <div id="total_value"><%=format_num.format(total)%> VNĐ</div>
                    </div>
                    <a id="pay" href="pay.jsp" >Thanh Toán</a>
                </div>
            </div>
            <div class="row">
                <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
            </div>
        </div>

        <script src="javascript/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
