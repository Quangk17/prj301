<%-- 
    Document   : login
    Created on : May 30, 2023, 11:02:32 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="./css/bootstrap.css" />
    
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
            justify-content: center;
            gap: 5px;
        }
        .sign-up a{
            color:  #00ac96;
            font-weight: 700;
        }
    </style>
    </head>
    <body>
        <% 
            String error = (String) request.getAttribute("ERROR");
            if(error == null) error = null;
        %>
        <div class="container">
            <div class="row content ">
              <div class="col-md-6 mb-3">
               <img src="./img/support-team.svg" alt="support team" />
              </div>
              <div class="col-md-6 signin-container">
                  <div class="alert alert-success" role="alert">
                    <%= error %>
                  </div>
                <h3 class="signin-text mb-3">Sign In</h3>
                <form action="MainController" method="POST">
                  <div class="form-group mt-3">
                    <label for="userID">Username</label>
                    <input type="text" name="userID" class="form-control">
                  </div>
                  <div class="form-group mt-3">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control">
                  </div>
                  <div class="form-group form-check mb-3 mt-3">
                    <input type="checkbox" name="checkbox" class="form-check-input" id="checkbox">
                    <label class="form-check-label" for="checkbox">Remember Me</label>
                  </div>
                    <button class="btn btn-class btn-fullwidth" type="submit" name="action" value="Login">Login</button>
                    <div class="mt-3 sign-up">
                        Not a member?   <a href="MainController?action=CreatePage">Sign Up</a>
                    </div>
                </form>
              </div>
            </div>
          </div>
    </body>
</html>
