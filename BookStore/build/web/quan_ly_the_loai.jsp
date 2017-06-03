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
        <title>Quản lý thể loại</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
                        <div class="box box-info" style="margin-top: 10px;">
                            <div class="box-header with-border" style="height: 45px;">
                                <h3 class="box-title">Danh sách thể loại sách</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#themSach">Thêm thể loại mới</button> 
                                </div>
                            </div>
                            <div class="box-body">
                                <table class="table table-bordered table-striped table-hover" id="rounded-corner">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên thể loại</th>
                                            <th>Mô tả</th>
                                            <th>Sửa</th>
                                            <th>Xóa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
                                        List<Category> list = new ArrayList<Category>();
                                        list = categoryDAO.getList();
                                    %>
                                    <%
                                        int stt = 0;
                                        for (Category c : list) {
                                            stt++;
                                    %>
                                    <tr class="odd">
                                        <td><%=stt%></td>
                                        <td><%=c.getTen_the_loai()%></td>
                                        <td><%=c.getMo_ta()%></td>
                                        <td><a href="sua_the_loai.jsp?ma_the_loai=<%=c.getMa_the_loai()%>"><img src="images/icons/edit.png" alt="" title="" border="0" /></a></td>
                                        <td><a href="XoaTheLoaiServlet?ma_the_loai=<%=c.getMa_the_loai()%>"><img src="images/icons/trash.gif" alt="" title="" border="0" /></a></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="themSach" role="dialog">
            <div class="modal-dialog">
                <%
                    String loi = "";
                    if (request.getAttribute("loi") != null) {
                        loi = (String) request.getAttribute("loi");
                    }
                %>
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thêm mới sách</h4>
                    </div>
                    <form action="ThemTheLoaiServlet" method="post">
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <h2 style="color: red"><%=loi%></h2>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Tên thể loại</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" placeholder="Tên thể loại" name="ten_the_loai" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Mô tả</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="3" name="mo_ta" placeholder="Mô tả"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Lưu" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>  
                    </form>

                </div>
            </div>
        </div>
        <div class="row">
            <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
        </div>
        <script src="javascript/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="javascript/bootstrap.min.js" type="text/javascript"></script>
        <script src="javascript/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="javascript/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $('#rounded-corner').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": true,
                    "ordering": false,
                    "info": false
                });
            });
        </script>
    </body>
</html>

