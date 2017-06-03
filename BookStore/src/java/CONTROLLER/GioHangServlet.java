package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import MODEL.Cart;
import MODEL.Sach;

@WebServlet(name = "GioHangServlet", urlPatterns = {"/GioHangServlet"})
public class GioHangServlet extends HttpServlet {

    private List<Cart> cart = new ArrayList<Cart>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GioHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GioHangServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
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
        doPost(request, response);
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
        String command = request.getParameter("command");
        String ma_sach = request.getParameter("ma_sach");
        if (command.equals("addCart")) {
            Sach p = new Sach(Integer.parseInt(ma_sach), 1, "", "", 1.0, "", "", "");
            addToCart(p);
            //Test xem gio hang co them dc ko?
            System.out.println(cart.size());
            //Tao them  session de luu tru gia tri .
            HttpSession session = request.getSession();
            session.setAttribute("cart", cart);
            //sau khi them vao gio hang se chuyen toi trang gio hang
            response.sendRedirect("giohang.jsp");
        }
        
        if (command.equals("removeCart")) {
            Sach p = new Sach(Integer.parseInt(ma_sach), 1, "", "", 1.0, "", "", "");
            removeToCart(p);
            //Test xem gio hang co them dc ko?
            System.out.println(cart.size());
            //Tao them  session de luu tru gia tri .
            HttpSession session = request.getSession();
            session.getAttribute("cart");
            //sau khi them vao gio hang se chuyen toi trang gio hang
            response.sendRedirect("giohang.jsp");
        }

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

    //Them san pham vao gio hang
    public String addToCart(Sach p) {
        for (Cart item : cart) {
            if (item.getP().getMa_sach() == p.getMa_sach()) {
                item.setSoluong(item.getSoluong() + 1);
                return "cart";
            }
        }
        Cart c = new Cart();
        c.setP(p);
        c.setSoluong(1);
        cart.add(c);
        return "cart";
    }

    public String removeToCart(Sach p) {
        for (Cart item : cart) {
            if (item.getP().getMa_sach() == p.getMa_sach()) {
               // item.p;
                item.setSoluong(0);
                return "cart";
            }
        }
        Cart c = new Cart();
        c.getP();
        c.getSoluong();
        cart.remove(c);
        return "cart";
    }
}
