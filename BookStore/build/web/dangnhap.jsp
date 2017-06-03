<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/dangnhap.css" type="text/css">
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
                    <%
                        String loi = "";
                        if (request.getAttribute("loi") != null) {
                            loi = (String) request.getAttribute("loi");
                        }
                    %>
                    <div class="col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Đăng nhập</h3>
                            </div>

                            <form action="DangNhapServlet" method="post">
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
                                        <h3 style="color: red;margin-left: 150px;margin-top: 20px"><%=loi%></h3>
                                        <div class="col-xs-2 col-xs-offset-8"> 
                                            <input class="btn btn-success" type="submit" value="Đăng Nhập">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <p style="font-size: 15px;">Chưa có tài khoản vui lòng 
                                        <a id="dk" style="text-decoration:none;color: red" href="dangky.jsp">Đăng ký</a></p>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
        <script src="javascript/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
