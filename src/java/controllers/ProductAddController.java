/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shopping.Cart;
import shopping.Laptop;
import shopping.LaptopDAO;

/**
 *
 * @author ASUS
 */
public class ProductAddController extends HttpServlet {
    private static final String ERROR = "productAdmin.jsp";
    private static final String SUCCESS = "productAdmin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String url = ERROR;
        try {
             String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String productPrice = request.getParameter("productPrice");
            String productQuantity  = request.getParameter("productQuantity");
            String image = request.getParameter("imageUrl");
            Laptop laptop = new Laptop(productID, productName, Float.parseFloat(productPrice), Integer.parseInt(productQuantity), image, 0);
            
            LaptopDAO dao = new LaptopDAO();
            boolean check = dao.addLaptop(laptop);
            if(check){
                request.setAttribute("ERROR", "Add Product Successful!");
                 Cart products = LaptopDAO.getListProduct("");
                HttpSession session = request.getSession();
                session.setAttribute("LIST_PRODUCT", products);
                url = SUCCESS;
            }else{
                request.setAttribute("ERROR", "Add Product Failed!");
            }
            
            
        } catch (Exception e) {
            log("ERROR at Create Controller " + e.toString());
        }finally{
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
