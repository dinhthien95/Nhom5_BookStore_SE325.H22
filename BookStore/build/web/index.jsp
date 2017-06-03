<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
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
                        <div id="product">
                            <div id="phat_hanh">
                            <%
                                int a = 0;
                                int b = 10;
                            %>
                            <div class="row">
                                <a href="sach_theoloai.jsp?start=<%=a%>&end=<%=b%>&id=3" style="float: right; margin-top: 28px; text-decoration: none;">
                                    <label class="lab">»</label>
                                    Xem tất cả
                                </a>
                                <p class="phathanh1">Sách văn học mới phát hành</p>
                                <jsp:include page="product.jsp?id=3"></jsp:include>
                                </div>
                                <div class="row">
                                    <a href="sach_theoloai.jsp?start=<%=a%>&end=<%=b%>&id=1" style="float: right; margin-top: 28px;text-decoration: none;" >
                                    <label class="lab">»</label>Xem tất cả</a>
                                <p class="phathanh1">Sách kinh tế mới phát hành</p>
                                <jsp:include page="product.jsp?id=1"></jsp:include>
                                </div>

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
