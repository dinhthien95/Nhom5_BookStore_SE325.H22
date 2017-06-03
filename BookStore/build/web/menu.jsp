<%@page import="DAO.KhachHangDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu ngang</title>
        <link rel ="stylesheet" href ="css/menu.css" type="text/css">
    </head>
    <body>
        <div id="menu">
            <ul>
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="gioithieu.jsp">Giới thiệu</a></li>
                <%
                    if(session.getAttribute("id") != null)
                    {
                        KhachHangDAOImpl kh = new KhachHangDAOImpl();
                        String tendn = session.getAttribute("id").toString();
                        if(kh.checkAdmin(tendn))
                        {
                            %>
                            <li id="quanly"><a href="#">Quản lý</a>
                                <div id="quanly_ds">
                                    <a href="quan_ly_sach.jsp">Quản lý sách</a>
                                    <a href="quan_ly_the_loai.jsp">Quản lý thể loại</a>
                                </div>
                            </li>
                            <%
                        }
                    }
                %>
            </ul>
        </div>
    </body>
</html>
