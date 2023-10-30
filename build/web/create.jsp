<%-- 
    Document   : create
    Created on : Jun 9, 2023, 10:17:08 AM
    Author     : ASUS
--%>

<%@page import="user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Register Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/bootstrap.css" />
         <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
                @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;900&display=swap');
        body{
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(90deg, rgba(0,172,150,1) 0%, rgba(0,172,112,1) 100%);
        }
        .content{
            margin: 8%;
            background-color: #fff;
            padding: 4rem 1rem 4rem 1rem;
            box-shadow: 0 0 5px 5px rgba(0,0,0, .05);
        }
        .signin-text{
            font-style: normal;
            font-weight: 600 !important;

        }
        .form-control{
            display: block;
            width:100%;
            font-size: 1rem;
            font-weight: 400;
            line-height:1.5;
            border-color: #00ac96 !important;
            border-style: solid !important;
            border-width: 0 0 1px 0 !important;
            padding: 0px !important;
            color:#495057;
            height: auto;
            border-radius: 0;
            background-color: #fff;
            background-clip: padding-box;
        }
        .form-control:focus{

            color: #495057;
            background-color: #fff;
            border-color: #fff;
            outline: 0;
            box-shadow: none;
        }
        .birthday-section{
            padding: 15px;
        }
        .btn-fullwidth{
            width: 100%;
            
        }
        .btn-class{
            background-color:  #00ac96;
            color: #fff;
            transition: all ease-in 0.2s;
        }
        .btn-class:hover{
            background-color:  #00ac96;
            color: #fff;
            opacity: 0.8;
        }
        .signin-container{
            display: flex;
            flex-flow: column nowrap;
            justify-content: center;
            padding: 0 80px;
        }
        .sign-up{
            display: flex;
            gap: 5px;
            color: #bebebe;
        }
        .sign-up a{
            color:  #00ac96;
            font-weight: 600;
        }

    </style>
        
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
         <div class="container">
            <div class="row content ">
              <div class="col-md-6 signin-container">
                <h3 class="signin-text mb-3">Sign Up </h3>
                <div class="sign-up">Already a member? <a href="login.html">Login</a></div>
                <form action="MainController" method="POST">
                  <div class="form-group mt-3">
                    <label for="userID">Username</label>
                    <input type="text" name="userID" class="form-control">
                  </div>
                    <% 
                           if(!userError.getUserIDError().equals("")){
                               %>
                                        <div class="alert alert-danger mt-2" role="alert">
                                            <%--<%= userError.getUserIDError()%>--%>
                                            ${requestScope.USER_ERROR.getUserIDError()}
                                          </div>
                               <%
                           }
                  %>
                   <div class="form-group mt-3">
                    <label for="fullName">Fullname</label>
                    <input type="text" name="fullName" class="form-control">
                  </div>
                      <% 
                           if(!userError.getFullNameError().equals("")){
                               %>
                                        <div class="alert alert-danger mt-2" role="alert">
                                            <%= userError.getFullNameError()%>
                                          </div>
                               <%
                           }
                  %>
                  <div class="form-group mt-3">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control">
                  </div>
                  <div class="form-group mt-3">
                    <label for="confirm">Confirm Password</label>
                    <input type="password" name="confirm" class="form-control">
                  </div>
                  <% 
                           if(!userError.getConfirmError().equals("")){
                               %>
                                        <div class="alert alert-danger mt-2" role="alert">
                                            <%= userError.getConfirmError()%>
                                          </div>
                               <%
                           }
                      
                  %>
                    <div class="g-recaptcha mt-2" data-sitekey="6LfFn6YmAAAAAPImYkGpMQCje1rJnyT7z5TKQBhH"></div>
                    <button class="btn btn-class btn-fullwidth mt-5" type="submit" name="action" value="Create">Create account</button>
                </form>
              </div>
               <div class="col-md-6 mb-3">
                <img src="./img/support-team.svg" alt="support team" />
               </div>
            </div>
          </div>
    </body>
</html>
