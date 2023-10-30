<%-- 
    Document   : success
    Created on : Jul 6, 2023, 8:38:08 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Successful Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            .loader {
                position: relative;
                margin: 0px auto;
                width: 100px;
                height:100px;
            }
            .circular{animation:rotate 2s linear forwards ;width:100px;height:100px;position:relative}
            .path{stroke:#007aff; stroke-dasharray: 1,200;
                  stroke-dashoffset: 0;
                  animation: 
                      dash 1.5s ease-in-out forwards,
                      color 6s ease-in-out infinite
                      ;
                  stroke-linecap: round;}
            @keyframes dash{
                0%{
                    stroke-dasharray: 1,200;
                    stroke-dashoffset: 0;
                }

                100%{
                    stroke-dasharray: 150,200;
                    stroke-dashoffset: 10;
                }

            }
            @keyframes color{
                100%, 0%{
                    stroke: #f00;
                }
                40%{
                    stroke: #007aff;
                }
                66%{
                    stroke: #24555d;
                }
                80%, 90%{
                    stroke: #789642;
                }
            }
            @keyframes rotate{
                100%{transform:rotate(360deg)}
            }

            .checkmark__check {
                transform-origin: 50% 50%;
                stroke-dasharray: 48;
                stroke-dashoffset: 48;

                animation: stroke 0.5s  cubic-bezier(0.65, 0, 0.45, 1) 1.5s forwards, color 6s linear infinite;}
            @keyframes stroke {
                100% {
                    stroke-dashoffset: 0;
                }
            }
            .suc{stroke:#007aff;
                 stroke-width:2;
                 position:absolute;top:30px;left:30px;
                 width:40px;height:40px;}
            </style>
        </head>
        <body>
            <div class="w-full h-screen flex flex-col lg:flex-row items-center justify-center space-y-16 lg:space-y-0 space-x-8 2xl:space-x-0">
            <div class="w-full lg:w-1/2 flex flex-col items-center justify-center lg:px-2 xl:px-0 text-center">
                <div class="loader">
                    <svg class="circular">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2"  stroke-color="#f00" stroke-miterlimit="10"/>

                    </svg>
                    <svg class="suc">
                    <path class="checkmark__check" fill="none" d="M10.7,20.4l5.3,5.3l12.4-12.5"></path>
                    </svg>
                </div>
                <p class="text-4xl md:text-5xl lg:text-6xl font-bold tracking-wider text-green-700 mt-2">Payment Successful!</p>
                <p class="text-lg md:text-xl lg:text-2xl text-gray-500 my-12 px-10">Thank you for choosing UyDevLaptop. Your custom Reports will be generated within two business days.</p>
                <a href="shopping.jsp" class="flex items-center space-x-2 bg-blue-600 hover:bg-blue-700 text-gray-100 px-4 py-2 rounded transition duration-150" title="Return Home">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M9.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L7.414 9H15a1 1 0 110 2H7.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"></path>
                    </svg>
                    <span>Return Home</span>
                </a>
            </div>
            <div class="w-1/2 lg:h-full flex lg:items-end justify-center p-4">
                <img class="w-full text-blue-600" src="./img/joy.svg" />
            </div>
        </div>
    </body>
</html>
