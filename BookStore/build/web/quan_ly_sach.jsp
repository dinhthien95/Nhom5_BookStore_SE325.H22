<%@page import="MODEL.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="MODEL.Sach"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page import="DAO.CategoryDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Quản lý Sách</title>
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
                    <%
                        String loi = "";
                        if (request.getAttribute("loi") != null) {
                            loi = (String) request.getAttribute("loi");
                        }
                    %>

                    <div class="box box-info" style="margin-top: 10px;">
                        <div class="box-header with-border" style="height: 45px;">
                            <h3 class="box-title">Danh sách sách</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#themSach">Thêm sách mới</button> 
                            </div>
                        </div>
                        <div class="box-body">
                            <table class="table table-bordered table-striped table-hover" id="rounded-corner">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Thể loại</th>
                                        <th>Tên sách</th>
                                        <th>Giá</th>
                                        <th>Tác giả</th>
                                        <th>Nhà xuất bản</th>
                                        <th>Mô tả</th>
                                        <th>Sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <%
                                    CategoryDAOImpl CategoryDAO = new CategoryDAOImpl();
                                    List<Category> listCategory = new ArrayList<Category>();
                                    listCategory = CategoryDAO.getList();
                                    SachDAOImpl sachDAO = new SachDAOImpl();
                                    List<Sach> list = new ArrayList<Sach>();
                                    list = sachDAO.getList();
                                %>
                                <tbody>
                                    <%
                                        int stt = 0;
                                        for (Sach s : list) {
                                            stt++;
                                    %>
                                    <tr class="odd">
                                        <td><%=stt%></td>
                                        <td><%=CategoryDAO.getCategoryByID(s.getMa_the_loai())%></td>
                                        <td>
                                            <div class="hideextra" style="width:150px">
                                                <%=s.getTen_sach()%>  
                                            </div> 
                                        </td>
                                        <td>
                                            <div class="hideextra" style="width:50px">
                                                <%=s.getGia_ban()%>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="hideextra" style="width:100px">
                                                <%=s.getTac_gia()%>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="hideextra" style="width:100px">
                                                <%=s.getNha_xuat_ban()%>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="hideextra" style="width:150px">
                                                <%=s.getMo_ta()%>
                                            </div>
                                        </td>
                                        <td><a href="sua_sach.jsp?ma_sach=<%=s.getMa_sach()%>"><img src="images/icons/edit.png" alt="" title="" border="0" /></a></td>
                                        <td><a href="XoaSachServlet?ma_sach=<%=s.getMa_sach()%>"><img src="images/icons/trash.gif" alt="" title="" border="0" /></a></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="themSach" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Thêm mới sách</h4>
                            </div>
                            <form action="ThemSachServlet" method="post">
                                <div class="modal-body">
                                    <div class="form-horizontal">
                                        <div class="box-body">
                                            <h2 style="color: red"><%=loi%></h2>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Tên sách</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="Tên sách" name="ten_sach" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Giá bán</label>

                                                <div class="col-sm-10">
                                                    <input type="number" class="form-control" placeholder="Giá bán" name="gia_ban" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Tác giả</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="Tác giả" name="tac_gia" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Nhà xuất bản</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="Nhà xuất bản" name="nha_xuat_ban" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Thể loại</label>
                                                <div class="col-sm-10">
                                                    <select class="form-control" name="ma_the_loai">
                                                        <%
                                                            for (Category c : listCategory) {
                                                        %>
                                                        <option value="<%=c.getMa_the_loai()%>"><%=c.getTen_the_loai()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Hình ảnh</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="Hình ảnh" name="hinh_anh" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Mô tả</label>
                                                <div class="col-sm-10">
                                                    <textarea class="form-control" rows="3" name="mo_ta" placeholder="Mô tả"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Lưu" />
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="row">
                        <div id="bottom"> <jsp:include page="footer.jsp"></jsp:include></div>
                    </div>
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

