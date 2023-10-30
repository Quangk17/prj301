/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shopping.Cart;
import shopping.LaptopDAO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author ASUS
 */
public class SearchController extends HttpServlet {
    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";
    
    private static final String USERS_TYPE = "users";
    private static final String PRODUCTS_TYPE = "products";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String url = ERROR;
            try {
            String search = request.getParameter("search");
            String pageNumber = request.getParameter("pageNumber");
            if(pageNumber == null){
                pageNumber = "1";
            }
            
//            if(USERS_TYPE.equals(type)){
                    UserDAO dao = new UserDAO();
                    List<UserDTO> listUser = dao.getListUser(search, pageNumber);
                    if(listUser.size() > 0){
                        request.setAttribute("LIST_USER", listUser);
                        url = SUCCESS;
                    }else{
                        request.setAttribute("ERROR", "Not found user to seach!");
                    }
//            } else if(PRODUCTS_TYPE.equals(type)){
//                Cart products = LaptopDAO.getListProduct(search);
//                request.setAttribute("LIST_PRODUCT", products);
//            }
            
               
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
                request.getRequestDispatcher(url).forward(request, response);
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
