package CONTROLLER;

import DAO.SachDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MODEL.Sach;

@WebServlet(name = "ThemSachServlet", urlPatterns = {"/ThemSachServlet"})
public class ThemSachServlet extends HttpServlet {

    private final SachDAOImpl sachDAO = new SachDAOImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String ten_sach = request.getParameter("ten_sach");
        String ma_the_loai = request.getParameter("ma_the_loai");
        String gia_ban = request.getParameter("gia_ban");
        String tac_gia = request.getParameter("tac_gia");
        String nha_xuat_ban = request.getParameter("nha_xuat_ban");
        String mo_ta = request.getParameter("mo_ta");
        String hinh_anh = request.getParameter("hinh_anh");

        String loi = "";
        if (ten_sach.equals("")) {
            loi += "Bạn chưa nhập tên sách.";
        }

        if (loi.length() > 0) {
            request.setAttribute("loi", loi);
        }
        String url = "/quan_ly_sach.jsp";
        try {
            if (loi.length() == 0) {
                sachDAO.addProduct(new Sach(0, Integer.parseInt(ma_the_loai), ten_sach, hinh_anh, Double.parseDouble(gia_ban), nha_xuat_ban, mo_ta, tac_gia));
                url = "/quan_ly_sach.jsp";
            } else {
                url = "/quan_ly_sach.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("/quan_ly_sach.jsp");
        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv='refresh' content='0;URL=" + url + "'>");
            out.println("</head>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
