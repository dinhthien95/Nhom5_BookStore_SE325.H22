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
        <title>Thanh Toán</title>
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
        <link rel ="stylesheet" href ="css/pay.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    alert($("div").scrollTop() + " px");
                });
            });
        </script>
    </head>
    <body>
        <div id="top"><img src="images/banner.jpg" width="1000px" height="100px"/> </div>
        <div id="search"><jsp:include page="timkiem.jsp"></jsp:include></div>
        <div id ="menu"><jsp:include page="menu.jsp"></jsp:include></div>
            <div id="Pay">
                <div id="pay_text">THANH TOÁN ĐƠN HÀNG</div>
                <div class ="info">
                    <div class="pay_title">THÔNG TIN GIAO HÀNG</div>
                    <div id="info_customer" style="width:300px;height:450px;overflow:auto">
                        <div id="part1">
                            <div>Tên: <label><%= request.getParameter("ten") %></label></div>
                            <div>Sđt: <label><%=request.getParameter("sdt")%></label></div>
                            <div>Địa chỉ: <label>Số <%=request.getParameter("so")%></label>
                                <label>Đường <%=request.getParameter("duong")%></label>
                                <label>Phường <%=request.getParameter("phuong_xa")%></label>
                                <label>Quận <%=request.getParameter("quan_huyen")%></label>
                                <label>Thành phố <%=request.getParameter("tinh_thanh")%></label>
                            </div>

                        </div>
                        <div id="back_pay">
                            <a href="pay.jsp">Thay đổi địa chỉ giao hàng</a>
                        </div>

                    </div>
                </div>
                <div class ="info">
                    <div class="pay_title">HÌNH THỨC THANH TOÁN</div>
                    <!--                <div class="btn_check">-->
                    <div class="btn_check">
                        <input type="radio" name="radio" id="radio1" class="radio_update" checked/>
                        <label class="lb" for="radio1">Thẻ ATM</label>
                    </div>

                    <div class="btn_check">
                        <input type="radio" name="radio" id="radio2" class="radio_update"/>
                        <label class="lb" for="radio2">Thẻ VISA/Master Card</label>
                    </div>

                    <div class="btn_check">	
                        <input type="radio" name="radio" id="radio3" class="radio_update"/>
                        <label class="lb" for="radio3">Thanh toán khi nhận hàng</label>
                    </div>

                    <div class="btn_check">	
                        <input type="radio" name="radio" id="radio4" class="radio_update"/>
                        <label class="lb" for="radio4">Thanh toán bằng ví điện tử</label>
                    </div>
                    <!--                </div>-->
                </div>
                <div class ="info">
                    <div class="pay_title">SẢN PHẨM</div>

                    <div class="product_pay" style="width:310px;height:450px;overflow:auto">
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
                    <div class="book">
                        <div class="book_image">
                            <img width="60px;" height="60px" alt="" src="images/product/<%=sachDAO.getSach(c.getP().getMa_sach()).getHinh_anh()%>.jpg">
                        </div> 
                        <div class="book_name">
                            <%=sachDAO.getSach(c.getP().getMa_sach()).getTen_sach()%>
                        </div> 
                        <div class="book_quantity">
                            <input type="number" value="<%=c.getSoluong()%>" disabled="disabled">
                        </div>
                        <div class="book_pay"><%=format_num.format(sachDAO.getSach(c.getP().getMa_sach()).getGia_ban() * c.getSoluong())%> VNĐ</div> 
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>

            <div id="row">
                <div id="tong">Tổng Cộng</div>
                <div id="money"><%=format_num.format(total)%> VNĐ</div>
            </div>
            <a id="btn_pay" href="#" >Thanh Toán</a>
        </div>
    </div>

    <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
