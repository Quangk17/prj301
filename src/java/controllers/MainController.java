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

/**
 *
 * @author ASUS
 */
public class MainController extends HttpServlet {
    private static final String WELCOME_PAGE = "login.html";
    
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SEARCH="Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE="Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE="Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE_PAGE="CreatePage";
    private static final String CREATE_PAGE_VIEW = "create.html";
    private static final String CREATE="Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String ADD_TO_CART = "Add To Cart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_VIEW = "viewCart.jsp";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String REMOVE_CART = "RemoveCart";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "checkout.jsp";
    private static final String PRODUCT_UPDATE = "ProductUpdate";
    private static final String PRODUCT_UPDATE_CONTROLLER = "ProductUpdateController";
    private static final String PRODUCT_DELETE = "ProductDelete";
    private static final String PRODUCT_DELETE_CONTROLLER = "ProductDeleteController";
    private static final String PRODUCT_SEARCH = "ProductSearch";
    private static final String PRODUCT_SEARCH_CONTROLLER = "ProductSearchController";
    private static final String PRODUCT_MANAGE= "ProductManage";
    private static final String PRODUCT_MANAGE_CONTROLLER= "ProductManageController";
    private static final String PRODUCT_ADD="ProductAdd";
    private static final String PRODUCT_ADD_CONTROLLER= "ProductAddController";
    


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
        String url = WELCOME_PAGE;
        try {
            String action = request.getParameter("action");
            if(action == null){
                url = WELCOME_PAGE;
            }else if(LOGIN.equals(action)){
                url = LOGIN_CONTROLLER;
            } else if(SEARCH.equals(action)){
                url = SEARCH_CONTROLLER;
            } else if(DELETE.equals(action)){
                url = DELETE_CONTROLLER;
            }  else if(UPDATE.equals(action)){
                url = UPDATE_CONTROLLER;
            } else if(CREATE_PAGE.equals(action)){
                url = CREATE_PAGE_VIEW;
            } else if(CREATE.equals(action)){
                url = CREATE_CONTROLLER;
            } else if(LOGOUT.equals(action)){
                url = LOGOUT_CONTROLLER;
            }  else if(ADD_TO_CART.equals(action)){
                url = ADD_TO_CART_CONTROLLER;
            } else if(VIEW_CART.equals(action)){
                url = VIEW_CART_VIEW;
            } else if(UPDATE_CART.equals(action)){
                url = UPDATE_CART_CONTROLLER;
            } else if(REMOVE_CART.equals(action)){
                url = REMOVE_CART_CONTROLLER;
            } else if(CHECKOUT.equals(action)){
                url = CHECKOUT_CONTROLLER;
            } else if(PRODUCT_UPDATE.equals(action)){
                url = PRODUCT_UPDATE_CONTROLLER;
            } else if(PRODUCT_DELETE.equals(action)){
                url = PRODUCT_DELETE_CONTROLLER;
            } else if(PRODUCT_SEARCH.equals(action)){
                url = PRODUCT_SEARCH_CONTROLLER;
            } else if(PRODUCT_MANAGE.equals(action)){
                url = PRODUCT_MANAGE_CONTROLLER;
            } else if(PRODUCT_ADD.equals(action)){
                url = PRODUCT_ADD_CONTROLLER;
            } 
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
