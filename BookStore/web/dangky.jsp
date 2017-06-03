<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

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
                    <%
                        String error = "";
                        if (request.getAttribute("error") != null) {
                            error = (String) request.getAttribute("error");
                        }
                    %>
                    <div class="col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Đăng ký</h3>
                            </div>
                            <form action="RegisterServlet" method="post">
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Tài khoản</label>

                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" placeholder="Tài khoản" name="tai_khoan" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Mật khẩu</label>

                                            <div class="col-sm-7">
                                                <input type="password" class="form-control" placeholder="Mật khẩu" name="mat_khau" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Email</label>

                                            <div class="col-sm-7">
                                                <input type="email" class="form-control" placeholder="Email" name="email" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Số điện thoại</label>

                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" placeholder="Số điện thoại" name="dien_thoai" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Họ tên</label>

                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" placeholder="Họ tên" name="ho_ten" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Giới tính</label>

                                            <div class="col-sm-7">
                                                <input class="rad" type="radio"  name="gioi_tinh" checked>Nam 
                                                <input class="rad" type="radio" name="gioi_tinh">Nữ
                                                <input class="rad" type="radio" name="gioi_tinh">Khác
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Địa chỉ</label>
                                            <div class="col-sm-7">
                                                <select class="form-control" name="dia_chi"> 
                                                    <option value="An Giang">An Giang</option>
                                                    <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                                    <option value="Bạc Liêu">Bạc Liêu</option>
                                                    <option value="Bắc Giang">Bắc Giang</option>
                                                    <option value="Bắc Kạn">Bắc Kạn</option>
                                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                                    <option value="Bến Tre">Bến Tre</option>
                                                    <option value="Bình Dương">Bình Dương</option>
                                                    <option value="Bình Định">Bình Định</option>
                                                    <option value="Bình Phước">Bình Phước</option>
                                                    <option value="Bình Thuận">Bình Thuận</option>
                                                    <option value="Cà Mau">Cà Mau</option>
                                                    <option value="Cao Bằng">Cao Bằng</option>
                                                    <option value="Cần Thơ">Cần Thơ</option>
                                                    <option value="Đà Nẵng">Đà Nẵng</option>
                                                    <option value="Đắk Lắk">Đắk Lắk</option>
                                                    <option value="Đắk Nông">Đắk Nông</option>
                                                    <option value="Điện Biên">Điện Biên</option>
                                                    <option value="Đồng Nai">Đồng Nai</option>
                                                    <option value="Đồng Tháp">Đồng Tháp</option>
                                                    <option value="Gia Lai">Gia Lai</option>
                                                    <option value="Hà Giang">Hà Giang</option>
                                                    <option value="Hà Nam">Hà Nam</option>
                                                    <option value="Hà Nội">Hà Nội</option>
                                                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                                                    <option value="Hải Dương">Hải Dương</option>
                                                    <option value="Hải Phòng">Hải Phòng</option>
                                                    <option value="Hậu Giang">Hậu Giang</option>
                                                    <option value="Hòa Bình">Hòa Bình</option>
                                                    <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                                                    <option value="Hưng Yên">Hưng Yên</option>
                                                    <option value="Khánh Hòa">Khánh Hòa</option>
                                                    <option value="Kiên Giang">Kiên Giang</option>
                                                    <option value="Kon Tum">Kon Tum</option>
                                                    <option value="Lai Châu">Lai Châu</option>
                                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                                    <option value="Lào Cai">Lào Cai</option>
                                                    <option value="Lâm Đồng">Lâm Đồng</option>
                                                    <option value="Long An">Long An</option>
                                                    <option value="Nam Định">Nam Định</option>
                                                    <option value="Nghệ An">Nghệ An</option>
                                                    <option value="Ninh Bình">Ninh Bình</option>
                                                    <option value="Ninh Thuận">Ninh Thuận</option>
                                                    <option value="Phú Thọ">Phú Thọ</option>
                                                    <option value="Phú Yên">Phú Yên</option>
                                                    <option value="Quảng Bình">Quảng Bình</option>
                                                    <option value="Quảng Nam">Quảng Nam</option>
                                                    <option value="Quảng Ngãi">Quảng Ngãi</option>
                                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                                    <option value="Quảng Trị">Quảng Trị</option>
                                                    <option value="Sóc Trăng">Sóc Trăng</option>
                                                    <option value="Sơn La">Sơn La</option>
                                                    <option value="Tây Ninh">Tây Ninh</option>
                                                    <option value="Thái Bình">Thái Bình</option>
                                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                                    <option value="Thanh Hóa">Thanh Hóa</option>
                                                    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                                    <option value="Tiền Giang">Tiền Giang</option>
                                                    <option value="Trà Vinh">Trà Vinh</option>
                                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                                    <option value="Vĩnh Long">Vĩnh Long</option>
                                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                                    <option value="Yên Bái">Yên Bái</option>
                                                </select>
                                            </div>
                                        </div>
                                        <h3 style="color: red;margin-left: 150px;margin-top: 20px"><%=error%></h3>
                                        <div class="col-xs-8 col-xs-offset-4">
                                            <input class="btn btn-success" type="submit" value="Đăng ký"> 
                                            <input class="btn btn-success" type="reset" value="Nhập lại">
                                        </div>
                                    </div>
                                </div>
                            </form>
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
    </body>
</html>
