<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href ="css/timkiem.css" type="text/css">
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="containerjsp">
            <div id="searchjsp">
                <form action="javascript:void(0);" method="GET">
                    <fieldset class="clearfix">
                        <div class="col-xs-2" style="font-size: 20px;font-weight: bold;margin-top: 4px;">THT Store </div>
                        <div class="col-xs-2">
                            <input type="search" name="Tim" class="form-control" placeholder="Nhập tên sách" style="margin-top: 3px;" id="key">                             
                        </div>
                        <div class="col-xs-1">
                            <input type="button" onclick="timkiem()" value="Tìm Sách" class="btn btn-info" style="margin-top: 3px;">
                        </div>


                        <%
                            if (session.getAttribute("id") != null) {
                        %>
                        <a style="text-decoration:none ;float:  right;padding: 10px ;color: white" href="DangXuatServlet"> Đăng xuất</a>
                        <a href="#" style="text-decoration:none ;float:  right;padding: 10px; color: white;">Xin chào, <%=session.getAttribute("id")%></a>

                        <%
                        } else {
                        %>
                        <a  style="text-decoration:none ;float:  right;padding: 10px ;color: white;"href="dangky.jsp">Đăng ký</a> 
                        <a style="text-decoration:none ;float:  right;padding: 10px;color: white;" href="dangnhap.jsp"> Đăng nhập</a>
                        <%}%>
                        <button class="btn btn-info" style="float: right;height: 35px; margin-top: 3px; border: 1px solid;" > 
                            <img src="images/icons/shopping-cart-icon.png" height="25px" width="25px" style="float: left">
                            <a  style="text-decoration:none ;color: white;font-size: 15px;font-weight: bold;padding: 5px;float: right"href="giohang.jsp ">Giỏ hàng</a> 
                        </button>
                    </fieldset>
                </form>
            </div> <!-- end search -->
        </div> <!-- end container -->
        <script src="javascript/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
        <script>
                                function timkiem() {
                                    if ($("#key").val() !== "")
                                    {
                                        window.open("timkiem_ketqua.jsp?key=" + $("#key").val(), "_parent")
                                    }
                                }
        </script>
    </body>
</html>
