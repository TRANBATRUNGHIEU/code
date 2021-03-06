/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import entity.*;
import DAL.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

     
        UserDAO dao = new UserDAO();
        Account a = dao.login(username, password);
     
        if (a == null) {
    
            request.setAttribute("mess", "Login fail");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
       } else {
   
           HttpSession session = request.getSession(); 
           session.setAttribute("acc", a);

           response.sendRedirect("home"); 
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        //Ph???n doGet c???a Servlet Login s??? c?? nhi???m v??? l???y th??ng tin c???a User v?? Pass t??? Cookie v?? ?????y l??n trang Login.jsp ????? hi???n th???
        
        //B?????c 1: get user, pass from cookie
        //Cookie l?? 1 M???ng, g???m nhi???u th??nh ph???n, bao g???m c??? th??ng tin c???a Browser ????? cho m??nh bi???t l?? ??ang Login ??? ????u
        Cookie arr[] = request.getCookies();
        if (arr != null) { 
        //X??? l?? trg h???p: Khi m??nh ????ng tr??nh duy???t m?? v??o Login t??? ???????ng Link -> Cookie r???ng -> V??ng for b??n d?????i b??? l???i
        //C??n n???u v??o t??? /home th?? d?? v???n ch??a c?? userC v?? passC nh??ng Cookie v???n ko r???ng (v?? c?? Cookie c???a Browser) n??n cx ko l???i
            for (Cookie o : arr) {
            if(o.getName().equals("userC")) { //T??m ?????n th???ng Cookie l??u v??? Username
                request.setAttribute("username", o.getValue()); //?????y Value c???a n?? l??n ?? Username ??? trang Login.jsp
            }
            if(o.getName().equals("passC")) {
                request.setAttribute("password", o.getValue());
            }
        }
        }
        
        //B?????c 2: set user, pass to Login form
        
        request.getRequestDispatcher("Login.jsp").forward(request, response);
        //Chuy???n d??? li???u l??n trang Login.jsp ????? m??? giao di???n
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        //Code ph???n remember me
        String remember = request.getParameter("remember");
//        L???y v??? username v?? password, n???u t???n t???i th?? ?????y v??? home
        UserDAO dao = new UserDAO();
        Account a = dao.login(username, password);
        if (a == null) {
            request.setAttribute("mess", "Wrong username or password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            
//            B???t ?????u code ??? ????y
            //L??u Account l??n tr??n Cookie
            Cookie u = new Cookie("userC", username);
            Cookie p = new Cookie("passC", password);
            
            //Code Remember Me
            u.setMaxAge(60*60); 
            if (remember != null) {
                p.setMaxAge(60*60); //N???u ng d??ng Click Remember Me -> L??u Password
            } else {
                p.setMaxAge(0); //Ko -> L??u Username th??i
            }            
            //X??t th???i gian t???n t???i cho Cookie
            
            //L??u cookie l??n tr??n tr??nh duy???t: trg h???p n??y l?? Chrome
            response.addCookie(u);
            response.addCookie(p);
            
            if (a.getIsAdmin() == 1 || a.getIsSell() == 1) {
                //N???u l?? Admin th?? chuy???n v??? trang DashBoard
                response.sendRedirect("dashBoard");
            } else {
                response.sendRedirect("home");
            }
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

}
