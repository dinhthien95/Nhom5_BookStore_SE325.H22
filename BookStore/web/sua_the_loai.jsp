<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="MODEL.Category"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CategoryDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sửa thể loại</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link rel ="stylesheet" href ="css/style.css" type="text/css">
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .hideextra { white-space: nowrap; overflow: hidden; text-overflow:ellipsis; }
            body{
                background-color:#ccd6da;
            }
        </style>
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
                    <%
                        String loi = "";
                        String ma_the_loai = request.getParameter("ma_the_loai");
                        if (request.getAttribute("loi") != null) {
                            loi = (String) request.getAttribute("loi");
                        }
                        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
                    %>
                    <div class="box box-info"  style="margin-top: 10px;">
                        <div class="box-header with-border">
                            <h3 class="box-title">Sửa thông tin sách</h3>
                        </div>
                        <form action="SuaTheLoaiServlet" method="post">
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <h2 style="color: red"><%=loi%></h2>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Tên thể loại</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" value="<%=categoryDAO.getCategory(Integer.parseInt(ma_the_loai)).getTen_the_loai()%>" required name="ten_the_loai" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Mô tả</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" rows="3" name="mo_ta"/><%=categoryDAO.getCategory(Integer.parseInt(ma_the_loai)).getMo_ta()%></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="col-xs-1 col-xs-offset-10">
                                        <input type="submit" class="btn btn-success" value="Cập nhật dữ liệu" />
                                    </div>
                                    <input type="hidden" value="<%=ma_the_loai%>" name="ma_the_loai"/>
                                </div>
                            </div>
                        </form>
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

