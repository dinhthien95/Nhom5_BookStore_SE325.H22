package CONTROLLER;

import DAO.CategoryDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MODEL.Category;

@WebServlet(name = "SuaTheLoaiServlet", urlPatterns = {"/SuaTheLoaiServlet"})
public class SuaTheLoaiServlet extends HttpServlet {

    private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String ten_the_loai = request.getParameter("ten_the_loai");
        String ma_the_loai = request.getParameter("ma_the_loai");
        String mo_ta = request.getParameter("mo_ta");

        System.out.println(ten_the_loai + "-" + mo_ta);
        String loi = "";
        if (ten_the_loai.equals("")) {
            loi += "Bạn chưa nhập tên thể loại.";
        }
        if (loi.length() > 0) {
            request.setAttribute("loi", loi);
        }
        String url = "/sua_the_loai.jsp";
        try {
            if (loi.length() == 0) {
                categoryDAO.updateCategory(new Category(Integer.parseInt(ma_the_loai), ten_the_loai, mo_ta));
                url = "/quan_ly_the_loai.jsp";
            } else {
                url = "/sua_the_loai.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("/quan_ly_the_loai.jsp");
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
