<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giới Thiệu</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/style.css" type="text/css">
        <link rel ="stylesheet" href ="css/gioithieu.css" type="text/css">
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
                        <div id="gthieu">
                            <div id="text">WEBSITE BÁN SÁCH ONLINE</div>
                            <div class="col-xs-5 col-xs-offset-1">
                                <div class="part1">Chuyên đề J2EE
                                    <ul>
                                        <li>SE325.H22</li>
                                        <li>GVLT: Nguyễn Trác Thức</li>
                                        <li>GVTH: Thái Thụy Hàn Uyển</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="part1">Nhóm thực hiện
                                    <ul>
                                        <li>13520769_Nguyễn Quốc Thắng</li>
                                        <li>13520822_Nguyễn Đình Thiện</li>
                                        <li>13520226_Châu Khắc Hải</li>
                                    </ul>
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
