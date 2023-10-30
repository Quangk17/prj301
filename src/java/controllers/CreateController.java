/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.UserDAO;
import user.UserDTO;
import user.UserError;

public class CreateController extends HttpServlet {
    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            UserDAO dao = new UserDAO();
            boolean checkValidation = true;
             String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String roleID  = request.getParameter("roleID");
            if(roleID == null) roleID = "US";
            String fullName = request.getParameter("fullName");
            String status = "1";
            String confirm  = request.getParameter("confirm");
            
            if(userID.length() < 2 || userID.length() > 10){
                userError.setUserIDError("User id must be in [2,10]");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(userID);
           if(checkDuplicate){
               userError.setUserIDError("Duplicated User ID");
           }
           if(fullName.length() < 5 || fullName.length() > 20){
                userError.setFullNameError("fullNamemust be in [5,20]");
                checkValidation = false;
            }
           if(!password.equals(confirm)){
               userError.setConfirmError("Those password does not match!");
               checkValidation = false;
           }
           
           String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                   
            URL urlCapcha = new URL("https://www.google.com/recaptcha/api/siteverify");
             HttpURLConnection con = (HttpURLConnection) urlCapcha.openConnection();
             con.setRequestMethod("POST");
             
             Map<String, String> parameters = new HashMap<>();
            parameters.put("response",gRecaptchaResponse);
            parameters.put("secret", "6LfFn6YmAAAAACA3CA-3jkfZ7WTNNWHtNHuwlRI8");
            con.setDoOutput(true);
            DataOutputStream out = new DataOutputStream(con.getOutputStream());
            out.flush();
            out.close();

            int statusResponse = con.getResponseCode();
                   BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
              String inputLine;
              StringBuffer content = new StringBuffer();
              while ((inputLine = in.readLine()) != null) {
                  content.append(inputLine);
              }
              in.close();
              
              System.out.println(content);
                   
           if(checkValidation){
               UserDTO user = new UserDTO(userID, password, roleID, fullName, status);
               boolean checkInsert = dao.insert(user);
               if(checkInsert){
                   url = SUCCESS;
                   request.setAttribute("ERROR", "Account "+ userID +" has been created succesfully!");
                   
               }else{
                   userError.setError("Unknown error");
                   request.setAttribute("USER_ERROR", userError);
               }
           } else{
               request.setAttribute("USER_ERROR", userError);
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
