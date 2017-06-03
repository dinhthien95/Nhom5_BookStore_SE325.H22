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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/pay.css" type="text/css">
        <link rel ="stylesheet" href ="css/style.css" type="text/css">

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
                        <div id="Pay">
                            <div class="col-xs-12">
                                <div id="pay_text">THANH TOÁN ĐƠN HÀNG
                                    <div id="note">
                                        *Lưu ý: trước khi thanh toán và chọn hình thức thanh toán. BẮT BUỘC điền đầy đủ thông tin giao hàng.
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4"  style="width: 36%;">
                                <div class ="infopay">
                                    <div class="pay_title">THÔNG TIN GIAO HÀNG</div>
                                    <form action="pay_update.jsp" method="post">
                                        <div id="info_customer" style="padding-bottom: 50px;overflow:auto">
                                            <div id="part1">
                                                <table>
                                                    <tr class="information">
                                                        <td class="txt"><p>Họ và tên </p></td>
                                                        <td class="inp"><p><input type="text" name="ten" required></p></td>
                                                    </tr>
                                                    <tr class="information">
                                                        <td class="txt"><p>Số điện thoại</p></td>
                                                        <td class="inp"><p><input type="number" name="sdt" required></p></td>
                                                    </tr>
                                                    <tr class="information">
                                                        <td class="txt"><p>Tỉnh thành</p></td>
                                                        <td class="inp"><p><input type="text" name="tinh_thanh" required></p></td>
                                                    </tr>
                                                    <tr class="information">
                                                        <td class="txt"><p>Quận/Huyện</p></td>
                                                        <td class="inp"><p><input type="text" name="quan_huyen" required></p></td>
                                                    </tr>
                                                    <tr class="information">
                                                        <td class="txt"><p>Phường/Xã </p></td>
                                                        <td class="inp"><p><input type="text" name="phuong_xa" required></p></td>
                                                    </tr>
                                                    <tr class="information">
                                                        <td class="txt"><p>Đường</p></td>
                                                        <td class="inp"><p><input type="text" name="duong" required></p></td>
                                                    </tr>
                                                    <tr class="information">
                                                        <td class="txt"><p>Số nhà</p></td>
                                                        <td class="inp"><p><input type="text" name="so" required></p></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col-xs-3 col-xs-offset-9">
                                                <input type="submit" value="Lưu" class="btn btn-success">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-xs-4" style="width: 28%;">
                                <div class ="infopay">
                                    <div class="pay_title">HÌNH THỨC THANH TOÁN</div>

                                    <div class="btn_check">
                                        <input type="radio" name="radio" id="radio1" class="radio" checked/>
                                        <label class="lb" for="radio1">Thẻ ATM</label>
                                    </div>

                                    <div class="btn_check">
                                        <input type="radio" name="radio" id="radio2" class="radio"/>
                                        <label class="lb" for="radio2">Thẻ VISA/Master Card</label>
                                    </div>

                                    <div class="btn_check">	
                                        <input type="radio" name="radio" id="radio3" class="radio"/>
                                        <label class="lb" for="radio3">Thanh toán khi nhận hàng</label>
                                    </div>

                                    <div class="btn_check">	
                                        <input type="radio" name="radio" id="radio4" class="radio"/>
                                        <label class="lb" for="radio4">Thanh toán bằng ví điện tử</label>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xs-4" style="width: 36%;">
                                <div class ="infopay">
                                    <div class="pay_title">SẢN PHẨM</div>

                                    <div class="product_pay" style="height:450px;overflow:auto">
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
                                        <div class="col-xs-3">
                                            <div class="book_image">
                                                <img width="60px;" height="60px" alt="" src="images/product/<%=sachDAO.getSach(c.getP().getMa_sach()).getHinh_anh()%>.jpg">
                                            </div> 
                                        </div>
                                            <div class="col-xs-4">
                                                <%=sachDAO.getSach(c.getP().getMa_sach()).getTen_sach()%>
                                            </div>
                                            <div class="col-xs-2">
                                                <input type="number" value="<%=c.getSoluong()%>" style="width: 100%;" disabled="disabled">
                                            </div>
                                            <div class="col-xs-3">
                                                <%=format_num.format(sachDAO.getSach(c.getP().getMa_sach()).getGia_ban() * c.getSoluong())%> VNĐ
                                            </div>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>





                    </div>
                    <div class="col-xs-12">
                        <div id="row">
                            <div id="tong">Tổng Cộng</div>
                            <div id="money"><%=format_num.format(total)%> VNĐ</div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
            </div>
        </div>
        <script src="javascript/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    //alert($("div").scrollTop() + " px");
                });
            });
        </script>
    </body>
</html>
