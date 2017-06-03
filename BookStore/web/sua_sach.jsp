<%@page import="MODEL.Category"%>
<%@page import="DAO.CategoryDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="MODEL.Sach"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SachDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sửa sách</title>
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
                        String ma_sach = request.getParameter("ma_sach");
                        if (request.getAttribute("loi") != null) {
                            loi = (String) request.getAttribute("loi");
                        }
                        CategoryDAOImpl CategoryDAO = new CategoryDAOImpl();
                        List<Category> listCategory = new ArrayList<Category>();
                        listCategory = CategoryDAO.getList();
                        SachDAOImpl sachDAO = new SachDAOImpl();
                    %>
                    <div class="box box-info"  style="margin-top: 10px;">
                        <div class="box-header with-border">
                            <h3 class="box-title">Sửa thông tin sách</h3>
                        </div>
                        <form action="SuaSachServlet" method="post">
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <h2 style="color: red"><%=loi%></h2>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Tên sách</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" value="<%=sachDAO.getSach(Integer.parseInt(ma_sach)).getTen_sach()%>" required name="ten_sach" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Giá bán</label>

                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" value="<%=sachDAO.getSach(Integer.parseInt(ma_sach)).getGia_ban()%>" name="gia_ban" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Tác giả</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" value="<%=sachDAO.getSach(Integer.parseInt(ma_sach)).getTac_gia()%>" name="tac_gia" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Nhà xuất bản</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" value="<%=sachDAO.getSach(Integer.parseInt(ma_sach)).getNha_xuat_ban()%>" name="nha_xuat_ban" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Thể loại</label>
                                        <div class="col-sm-10">
                                            <select id="idCategory" class="form-control" name="ma_the_loai">
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
                                            <input type="text" class="form-control" value="<%=sachDAO.getSach(Integer.parseInt(ma_sach)).getHinh_anh()%>" name="hinh_anh" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Mô tả</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" rows="3" name="mo_ta"/><%=sachDAO.getSach(Integer.parseInt(ma_sach)).getMo_ta()%></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <div class="col-xs-1 col-xs-offset-10">
                                        <input type="submit" class="btn btn-success" value="Cập nhật dữ liệu" />
                                    </div>
                                    <input type="hidden" value="<%=ma_sach%>" name="ma_sach"/>
                                </div>
                                <!-- /.box-body -->
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
            <script>
                $(function () {
                    var idbook =<%=sachDAO.getSach(Integer.parseInt(ma_sach)).getMa_the_loai()%>;
                    $('#idCategory').val(idbook);
                });
        </script>
    </body>
</html>

