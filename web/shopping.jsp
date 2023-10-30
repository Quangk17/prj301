<%-- 
    Document   : shopping
    Created on : Jun 14, 2023, 12:38:17 PM
    Author     : ASUS
--%>

<%@page import="user.UserDTO"%>
<%@page import="shopping.LaptopDAO"%>
<%@page import="shopping.Laptop"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Laptop page</title>
        <link rel="stylesheet" href="./css/bootstrap-grid.css" />
        <link rel="stylesheet" href="./styles/shopping.css" />
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }

            Cart products = (Cart) session.getAttribute("PRODUCTS");
            if (products == null) {
                products = LaptopDAO.getListProduct("");
            }

            int cartCount = 0;
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cartCount = 0;
            } else {
                for (Laptop laptop : cart.getCart().values()) {
                    cartCount += laptop.getQuantity();
                }
            }

        %>
        <header>
            <div class="container">
                <div class="header">
                    <div className='logo'>
                        <a href="#"><img src="./img/logo.png" alt="uydev_logo" height="40px"/></a>
                    </div>
                    <div class="menu">
                        <%                              if (loginUser == null) {
                        %>
                        <a href="MainController?action=Login" class="login-button">
                            Login
                        </a>

                        <%
                        } else {
                        %>
                        <span>Welcome back,  <b class="username"><%=loginUser.getFullName()%></b>! </span><a href="MainController?action=Logout" class="login-button">Logout</a>
                        <%
                            }
                        %>

                        <a href="MainController?action=ViewCart">
                            <div class="cart">
                                <span class="count"><%= cartCount%></span>
                                <img src="./img/cart.svg" alt="cart" width="30px">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <%

            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            } else {
        %>
        <section class="notification">
            <div class="container">
                <span class="box">
                    <%= message%>
                </span>
            </div>
        </section>
        <%
            }
        %>
        <section class="container" style="margin-top:  20px">
            <div class="row">
                <div class="col-3 sidebar">
                    <form class="input-container" action="MainController">
                        <input type="text" name="search" class="input" placeholder="search...">
                        <button class="icon-search" type="submit" name="action" value="ProductSearch"> 
                            <svg width="19px" height="19px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path opacity="1" d="M14 5H20" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path opacity="1" d="M14 8H17" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M21 11.5C21 16.75 16.75 21 11.5 21C6.25 21 2 16.75 2 11.5C2 6.25 6.25 2 11.5 2" stroke="#000" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"></path> <path opacity="1" d="M22 22L20 20" stroke="#000" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                        </button>
                    </form>
                    <div class="category-box">
                        <a href="MainController?search=MacBook&action=ProductSearch" class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-macbook-149x40.png" alt="MacBook"/></a>
                        <a href="MainController?search=Asus&action=ProductSearch"  class="category-icon"><img src="	https://cdn.tgdd.vn/Brand/1/logo-asus-149x40.png" alt="Asus"/></a>
                        <a href="MainController?search=Hp&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-hp-149x40-1.png" alt="Hp"/></a>
                        <a href="MainController?search=Lenovo&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-lenovo-149x40.png" alt="Lenovo"/></a>
                        <a href="MainController?search=Acer&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-acer-149x40.png" alt="Acer"/></a>
                        <a href="MainController?search=Dell&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-dell-149x40.png" alt="Dell"/></a>
                        <a href="MainController?search=Msi&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-msi-149x40.png" alt="Msi"/></a>
                        <a href="MainController?search=Gigabyte&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-gigabyte-149x40.png" alt="Gigabyte"/></a>
                        <a href="MainController?search=Surface&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-surface-149x40-1.png" alt="Surface"/></a>
                        <a href="MainController?search=Itel&action=ProductSearch"  class="category-icon"><img src="	https://cdn.tgdd.vn/Brand/1/logo-itel-149x40.png" alt="Itel"/></a>
                        <a href="MainController?search=Masstel&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/Masstel42-b0-200x48-1.png" alt="Masstel"/></a>
                        <a href="MainController?search=Lg&action=ProductSearch"  class="category-icon"><img src="https://cdn.tgdd.vn/Brand/1/logo-lg-149x40.png" alt="Lg"/></a>
                    </div>
                </div>
                <div class="col-9">
                    <div class="row justify-content-end" style="gap: 50px;">
                        <%
                            if (products != null) {
                                if (products.getCart() != null) {
                                    for (Laptop laptop : products.getCart().values()) {
                        %>
                        <form class="card col-3 col-sm-12" action="MainController" method="POST">
                            <!--<span class="sale">Sale</span>-->
                            <div class="image">
                                <img src="<%= laptop.getImageUrl()%>" alt="<%= laptop.getName()%>">
                            </div>
                            <div class="details">
                                <h5><%= laptop.getName()%></h4>
                                    <div class="price-ratings">
                                        <div class="price">
                                            <span>$ <%= laptop.getPrice()%></span>
                                            <input type="hidden" name="imageUrl" value="<%= laptop.getImageUrl()%>" />
                                            <input type="hidden" name="laptopId" value="<%= laptop.getLaptopID()%>" />
                                            <input type="hidden" name="name" value="<%= laptop.getName()%>" />
                                            <input type="hidden" name="price" value="<%= laptop.getPrice()%>" />
                                        </div>
                                        <button class="add-to-cart" type="submit" name="action" value="Add To Cart" onclick="showAddToCartToast()">
                                            Add to cart
                                        </button>
                                    </div>
                            </div>
                        </form>

                        <%
                            }
                        } else {
                        %>

                        <div class="empty-cart">
                            <svg viewBox="656 573 264 182" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <rect id="bg-line" stroke="none" fill-opacity="0.2" fill="#FFE100" fill-rule="evenodd" x="656" y="624" width="206" height="38" rx="19"></rect>
                            <rect id="bg-line" stroke="none" fill-opacity="0.2" fill="#FFE100" fill-rule="evenodd" x="692" y="665" width="192" height="29" rx="14.5"></rect>
                            <rect id="bg-line" stroke="none" fill-opacity="0.2" fill="#FFE100" fill-rule="evenodd" x="678" y="696" width="192" height="33" rx="16.5"></rect>
                            <g id="shopping-bag" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(721.000000, 630.000000)">
                            <polygon id="Fill-10" fill="#FFA800" points="4 29 120 29 120 0 4 0"></polygon>
                            <polygon id="Fill-14" fill="#FFE100" points="120 29 120 0 115.75 0 103 12.4285714 115.75 29"></polygon>
                            <polygon id="Fill-15" fill="#FFE100" points="4 29 4 0 8.25 0 21 12.4285714 8.25 29"></polygon>
                            <polygon id="Fill-33" fill="#FFA800" points="110 112 121.573723 109.059187 122 29 110 29"></polygon>
                            <polygon id="Fill-35" fill-opacity="0.5" fill="#FFFFFF" points="2 107.846154 10 112 10 31 2 31"></polygon>
                            <path d="M107.709596,112 L15.2883462,112 C11.2635,112 8,108.70905 8,104.648275 L8,29 L115,29 L115,104.648275 C115,108.70905 111.7365,112 107.709596,112" id="Fill-36" fill="#FFE100"></path>
                            <path d="M122,97.4615385 L122,104.230231 C122,108.521154 118.534483,112 114.257931,112 L9.74206897,112 C5.46551724,112 2,108.521154 2,104.230231 L2,58" id="Stroke-4916" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <polyline id="Stroke-4917" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" points="2 41.5 2 29 122 29 122 79"></polyline>
                            <path d="M4,50 C4,51.104 3.104,52 2,52 C0.896,52 0,51.104 0,50 C0,48.896 0.896,48 2,48 C3.104,48 4,48.896 4,50" id="Fill-4918" fill="#000000"></path>
                            <path d="M122,87 L122,89" id="Stroke-4919" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <polygon id="Stroke-4922" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" points="4 29 120 29 120 0 4 0"></polygon>
                            <path d="M87,46 L87,58.3333333 C87,71.9 75.75,83 62,83 L62,83 C48.25,83 37,71.9 37,58.3333333 L37,46" id="Stroke-4923" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M31,45 C31,41.686 33.686,39 37,39 C40.314,39 43,41.686 43,45" id="Stroke-4924" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M81,45 C81,41.686 83.686,39 87,39 C90.314,39 93,41.686 93,45" id="Stroke-4925" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M8,0 L20,12" id="Stroke-4928" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M20,12 L8,29" id="Stroke-4929" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M20,12 L20,29" id="Stroke-4930" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M115,0 L103,12" id="Stroke-4931" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M103,12 L115,29" id="Stroke-4932" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            <path d="M103,12 L103,29" id="Stroke-4933" stroke="#000000" stroke-width="3" stroke-linecap="round"></path>
                            </g>
                            <g id="glow" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(768.000000, 615.000000)">
                            <rect id="Rectangle-2" fill="#000000" x="14" y="0" width="2" height="9" rx="1"></rect>
                            <rect fill="#000000" transform="translate(7.601883, 6.142354) rotate(-12.000000) translate(-7.601883, -6.142354) " x="6.60188267" y="3.14235449" width="2" height="6" rx="1"></rect>
                            <rect fill="#000000" transform="translate(1.540235, 7.782080) rotate(-25.000000) translate(-1.540235, -7.782080) " x="0.54023518" y="6.28207994" width="2" height="3" rx="1"></rect>
                            <rect fill="#000000" transform="translate(29.540235, 7.782080) scale(-1, 1) rotate(-25.000000) translate(-29.540235, -7.782080) " x="28.5402352" y="6.28207994" width="2" height="3" rx="1"></rect>
                            <rect fill="#000000" transform="translate(22.601883, 6.142354) scale(-1, 1) rotate(-12.000000) translate(-22.601883, -6.142354) " x="21.6018827" y="3.14235449" width="2" height="6" rx="1"></rect>
                            </g>
                            <polygon id="plus" stroke="none" fill="#7DBFEB" fill-rule="evenodd" points="689.681239 597.614697 689.681239 596 690.771974 596 690.771974 597.614697 692.408077 597.614697 692.408077 598.691161 690.771974 598.691161 690.771974 600.350404 689.681239 600.350404 689.681239 598.691161 688 598.691161 688 597.614697"></polygon>
                            <polygon id="plus" stroke="none" fill="#EEE332" fill-rule="evenodd" points="913.288398 701.226961 913.288398 699 914.773039 699 914.773039 701.226961 917 701.226961 917 702.711602 914.773039 702.711602 914.773039 705 913.288398 705 913.288398 702.711602 911 702.711602 911 701.226961"></polygon>
                            <polygon id="plus" stroke="none" fill="#FFA800" fill-rule="evenodd" points="662.288398 736.226961 662.288398 734 663.773039 734 663.773039 736.226961 666 736.226961 666 737.711602 663.773039 737.711602 663.773039 740 662.288398 740 662.288398 737.711602 660 737.711602 660 736.226961"></polygon>
                            <circle id="oval" stroke="none" fill="#A5D6D3" fill-rule="evenodd" cx="699.5" cy="579.5" r="1.5"></circle>
                            <circle id="oval" stroke="none" fill="#CFC94E" fill-rule="evenodd" cx="712.5" cy="617.5" r="1.5"></circle>
                            <circle id="oval" stroke="none" fill="#8CC8C8" fill-rule="evenodd" cx="692.5" cy="738.5" r="1.5"></circle>
                            <circle id="oval" stroke="none" fill="#3EC08D" fill-rule="evenodd" cx="884.5" cy="657.5" r="1.5"></circle>
                            <circle id="oval" stroke="none" fill="#66739F" fill-rule="evenodd" cx="918.5" cy="681.5" r="1.5"></circle>
                            <circle id="oval" stroke="none" fill="#C48C47" fill-rule="evenodd" cx="903.5" cy="723.5" r="1.5"></circle>
                            <circle id="oval" stroke="none" fill="#A24C65" fill-rule="evenodd" cx="760.5" cy="587.5" r="1.5"></circle>
                            <circle id="oval" stroke="#66739F" stroke-width="2" fill="none" cx="745" cy="603" r="3"></circle>
                            <circle id="oval" stroke="#EFB549" stroke-width="2" fill="none" cx="716" cy="597" r="3"></circle>
                            <circle id="oval" stroke="#FFE100" stroke-width="2" fill="none" cx="681" cy="751" r="3"></circle>
                            <circle id="oval" stroke="#3CBC83" stroke-width="2" fill="none" cx="896" cy="680" r="3"></circle>
                            <polygon id="diamond" stroke="#C46F82" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" fill="none" points="886 705 889 708 886 711 883 708"></polygon>
                            <path d="M736,577 C737.65825,577 739,578.34175 739,580 C739,578.34175 740.34175,577 742,577 C740.34175,577 739,575.65825 739,574 C739,575.65825 737.65825,577 736,577 Z" id="bubble-rounded" stroke="#3CBC83" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" fill="none"></path>
                            </svg>

                            <h3>Product is not found</h3>
                            <p>The product you are looking for is not available in the shop. <a  href="MainController?search=&action=ProductSearch">Click here </a> to find other products.</p>
                        </div>

                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </section>      
    </body>
</html>
